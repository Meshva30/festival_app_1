
import 'package:flutter/material.dart';

import '../../../../../utils/gobleList.dart';
import '../../../../../utils/list.dart';



Padding backimage(int index) {
  return Padding(
    padding: const EdgeInsets.only(right: 18.0),
    child: Container(
        height: 100,
        width: 100,
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 0.5,
              spreadRadius: 1,
            )
          ],
          color: Colors.black,
        ),
        child: Image.asset(
          festivallist[postIndex]['image'][index],
          fit: BoxFit.cover,
        )),
  );
}
Container backgroundimg() {
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
      'Background',
      style: TextStyle(color: Colors.white, fontSize: 20),
    ),
  );
}
Text headofimage() {
  return Text(
    'Choose Background',
    style: TextStyle(color: Colors.white, fontSize: 15),
  );
}
