import 'package:flutter/material.dart';

Padding alignmentbottom() {
  return Padding(
    padding: const EdgeInsets.only(left: 14.0),
    child: Container(
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
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Color(0xff1c2438),
      ),
      child: Icon(
        Icons.arrow_drop_down,
        size: 25,
        color: Colors.white,
      ),
    ),
  );
}