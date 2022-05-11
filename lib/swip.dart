import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

import 'books.dart';
class Swip extends StatefulWidget {


  @override
  _SwipState createState() => _SwipState();
}

class _SwipState extends State<Swip> {
  @override
  Widget build(BuildContext context) {
    return LiquidSwipe.builder(
      waveType: WaveType.liquidReveal,
      fullTransitionValue: 600,
      itemBuilder:(_,i)=>Image.network(Books[i].urlimage,fit: BoxFit.fill,height: MediaQuery.of(context).size.height,) ,
      itemCount: Books.length,
    );
  }
}
