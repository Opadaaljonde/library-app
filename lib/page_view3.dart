



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'FlowPainter.dart';
import 'bookscreen.dart';


class Pageview3 extends StatefulWidget {
  @override
  _Pageview3State createState() => _Pageview3State();
}

class _Pageview3State extends State<Pageview3> {
  ValueNotifier<double> _notifier = ValueNotifier(0.0);
  final _pagecontroller = PageController();
  final _button = GlobalKey();

  final item = [
    Colors.amber,
    Colors.pink,
    Colors.blueAccent,
    Colors.purple,
  ];
  final title= [
    "Programming",
    "History",
    "Culture",
  "Language",
  ];
  @override
  void initState() {
    super.initState();
    _pagecontroller.addListener(() {
      _notifier.value = _pagecontroller.page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        //custom pinter
        AnimatedBuilder(
          animation: _notifier,
          builder: (ctx, _) {
           return CustomPaint(
                painter: FlowPainter(
                    context: context,
                    notifier: _notifier,
                    target: _button,
                    colors: item));
          } ),

//page view
        PageView.builder(

          controller: _pagecontroller,
          itemBuilder: (ctx, i) {

            if(i==3){
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>BookApp()));
            }


            return Center(

             child: Padding(
               padding: const EdgeInsets.all(10.0),
               child: ListTile(

                 title:Text(
                   title[i],
                    style: TextStyle(
                      fontSize: 50,
                      fontFamily: 'Rs',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                 subtitle:Text(
                   'opada.aljondi@outlook.com',
                   style: TextStyle(
                     fontSize: 25,
                     fontFamily: 'Rom',

                   ),
                 ),
                ),
             )
            );

          },
          itemCount: item.length,
        ),

//button
        IgnorePointer(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: ClipOval(
                child: AnimatedBuilder(
                  animation: _notifier,
                  builder: (BuildContext context, Widget child) {
                    double opacity = 0, iconpos = 0;
                    int colorindex;
                    final animaterval =
                        _notifier.value - _notifier.value.floor();
                    if (animaterval < 0.5) {
                      opacity = (animaterval - 0.5) * -2;
                      iconpos = 80 * -animaterval;
                      colorindex = _notifier.value.floor() + 1;
                    } else {
                      colorindex = _notifier.value.floor() + 2;
                      iconpos = -80;
                    }
                    if (animaterval > 0.9) {
                      iconpos = -200 * (1 - animaterval) * 10;
                      opacity = (animaterval - 0.9) * 10;
                    }
                    colorindex = colorindex % item.length;
                    return SizedBox(
                      key: _button,
                      height: 50,
                      width: 50,
                      child: Transform.translate(
                        offset: Offset(iconpos, 0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: item[colorindex], shape: BoxShape.circle),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white.withOpacity(opacity),
                            size: 30,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
