
import 'package:flutter/material.dart';

import '../../../../../../utils/text.dart';




Text headfontcolor() {
  return Text(
    'Edit Your Text color',
    style: TextStyle(color: Colors.white, fontSize: 15),
  );
}
Padding coloricon(int index) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: Colorlist[index]),
      child: (index == 0)
          ? Icon(
        Icons.add,
        size: 30,
      )
          : null,
    ),
  );
}
