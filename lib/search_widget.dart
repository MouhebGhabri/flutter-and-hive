import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class searchWidget extends StatefulWidget {
  const searchWidget({Key? key}) : super(key: key);

  @override
  State<searchWidget> createState() => _searchWidgetState();
}

class _searchWidgetState extends State<searchWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.purple,
        title: Text(
          "Excellence École",
          style:  GoogleFonts.mochiyPopOne(fontSize: 30.0,color: Color.fromARGB(194, 255, 251, 6)),
          // style: TextStyle(
          //   color: Color.fromARGB(194, 255, 251, 6),
          //   fontSize: 30.0,
          // ),
        ),),
    );
  }
}