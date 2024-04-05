import 'package:festival_app/utils/color.dart';
import 'package:flutter/material.dart';


Container backgroundcol() {
  return Container(
    padding: const EdgeInsets.all(10),
    decoration: const BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.white,
          blurRadius: 5,
          spreadRadius: 2,
        )
      ],
      borderRadius: BorderRadius.all(Radius.circular(5)),
      color: Color(0xff1c2438),
    ),
    child: const Text(
      'BG Color',
      style: TextStyle(color: Colors.white, fontSize: 20),
    ),
  );
}
Padding backcolors(int index) {
  return Padding(
    padding: const EdgeInsets.only(right: 18.0),
    child: Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          boxShadow: [
            const BoxShadow(
              color: Colors.grey,
              blurRadius: 0.5,
              spreadRadius: 1,
            )
          ],

          gradient: LinearGradient(colors: colorList[index])
      ),

    ),
  );
}
Text headofbgcolor() {
  return Text(
    'Choose Background Color',
    style: TextStyle(color: Colors.white, fontSize: 15),
  );
}