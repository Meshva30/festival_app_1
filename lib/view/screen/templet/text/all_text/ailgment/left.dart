
import 'package:flutter/material.dart';

Container alignmentleft() {
  return Container(
    width: 30,
    height: 30,
    alignment: Alignment.center,
    decoration: const BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black,
          blurRadius: 1,
          spreadRadius: 0.5,
        )
      ],
      borderRadius:
      BorderRadius.all(Radius.circular(5)),
      color: Color(0xff1c2438),
    ),
    child: Icon(
      Icons.arrow_left_sharp,
      size: 25,
      color: Colors.white,
    ),
  );
}
