
import 'package:flutter/material.dart';

Container alignment() {
  return Container(
    width: 130,
    alignment: Alignment.center,
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
      'Alignment',
      style: TextStyle(color: Colors.white, fontSize: 18),
    ),
  );
}

Container addtext() {
  return Container(
    width: 130,
    alignment: Alignment.center,
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
      'Add Text',
      style: TextStyle(color: Colors.white, fontSize: 18),
    ),
  );
}

Container fontcolor() {
  return Container(
    width: 130,
    alignment: Alignment.center,
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
      'Font Color',
      style: TextStyle(color: Colors.white, fontSize: 18),
    ),
  );
}

Container fontfamily() {
  return Container(
    width: 130,
    alignment: Alignment.center,
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
      'Font Family',
      style: TextStyle(color: Colors.white, fontSize: 18),
    ),
  );
}


Text headoftext() {
  return const Text(
    'Edit Your Text Here!!',
    style: TextStyle(color: Colors.white, fontSize: 18),
  );
}
