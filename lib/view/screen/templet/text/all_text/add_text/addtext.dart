
import 'package:flutter/material.dart';

import '../../../../../../utils/text.dart';




TextField textFields() {
  return TextField(
    style: TextStyle(color: Colors.white),
    controller: txtname,
    decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        )),
  );
}

Text headtext() {
  return const Text(
    'Edit Your Text',
    style: TextStyle(color: Colors.white, fontSize: 15),
  );
}
