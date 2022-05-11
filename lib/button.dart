import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
 final String text;

   Buttons( this.text) ;
  
  @override
  Widget build(BuildContext context) {
    return Container(
          width: 80,
          height: 35,

margin: EdgeInsets.only(top: 7,bottom: 15,right: 5,left: 5),
child: Center(
  child: Text(text,style: TextStyle(fontFamily: "Rom",fontSize: 18),),
),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.grey[300],
              
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[600],
                  offset: Offset(2.0, 2.0),
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                ),
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(-2.0, -2.0),
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                ),
              ],
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.grey[200],
                  Colors.grey[300],
                  Colors.grey[400],
                  Colors.grey[500],
                ],

              )),


    );
  }
}
