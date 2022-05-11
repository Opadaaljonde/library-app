

import 'dart:math';

import 'package:flutte5/button.dart';
import 'package:flutter/material.dart';

import 'books.dart';


class BookApp extends StatefulWidget {
  @override
  _BookAppState createState() => _BookAppState();
}

class _BookAppState extends State<BookApp> {
  final _controller = PageController();
  final _notifierScroll = ValueNotifier(0.0);
  void _listener() {
    _notifierScroll.value = _controller.page;
  }

  @override
  void initState() {
    _controller.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(_listener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bookheight = size.height * 0.48;
    final bookwidth = size.width * 0.6;
    return Scaffold(


      body: Stack(
        children: [
          SizedBox(
            height: kToolbarHeight,
            child: AppBar(
              leading: null,
              centerTitle: false,
              leadingWidth: 0,
              backgroundColor: Colors.white,
              title: Text(
                'Book',

                style: TextStyle(color: Colors.black,fontFamily: 'Rom',fontSize: 30),
              ),
              elevation: 0,

            ),
          ),
          ValueListenableBuilder<double>(
              valueListenable: _notifierScroll,
              builder: (context, value, _) {
                return PageView.builder(
                    itemCount: Books.length,
                    controller: _controller,
                    itemBuilder: (ctx, i) {
                      final book = Books[i];
                      final percentage = i - value;
                      final rotation = percentage.clamp(0.0, 1.0);
                      final fixrotation = pow(rotation, 0.36);
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Stack(
                                children: [
                                  Container(
                                    height: bookheight,
                                    width: bookwidth,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            blurRadius: 20,
                                            offset: Offset(5.0, 5.0),
                                            spreadRadius: 10,
                                          )
                                        ]),
                                  ),
                                  Transform(
                                    alignment: Alignment.centerLeft,
                                    transform: Matrix4.identity()
                                      ..setEntry(3, 2, 0.002)
                                      ..rotateY(1.8 * fixrotation)
                                      ..translate(-rotation * size.width * 0.8)
                                      ..scale(1 + rotation),
                                    child: Image.network(book.urlimage,
                                      fit: BoxFit.fill,
                                      height: bookheight,
                                      width: bookwidth,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 70,
                            ),
                            Opacity(
                              opacity: 1 - rotation,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    book.title,
                                    style: TextStyle(
                                        fontSize: 40,
                                        fontFamily: 'Rom',
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'By ${book.auther}',
                                        style: TextStyle(
                                            fontSize: 25,
                                            color: Colors.grey,
                                            fontFamily: 'Rom'),
                                      ),
                                     Buttons('Read More')
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    });
              }),
        ],
      ),
    );
  }
}
