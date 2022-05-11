import 'package:flutter/material.dart';

class Book {
  final String title;
  final String auther;
  final String urlimage;

  Book({
    @required this.title,
    @required this.auther,
    @required this.urlimage,
  });
}

List Books = <Book>[
  Book(
      title: 'C++', auther: 'learn basic C++ ', urlimage: "http://www.e-booksdirectory.com/imglrg/1316.jpg"),
  Book(
      title: 'Java',
      auther: 'learn basic Java',
      urlimage: "https://th.bing.com/th/id/R.4c059154ad3bf753ebc2b2ab6ad51a48?rik=b7rb64HKMF0yoQ&pid=ImgRaw&r=0"),
  Book(title: 'Python', auther: 'learn basic Python', urlimage: "https://th.bing.com/th/id/R.7c9f91ec2023790daf4811d7135e8dfc?rik=pNkOhmiWIzzEOQ&pid=ImgRaw&r=0"),
];
