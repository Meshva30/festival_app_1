
import 'package:flutter/material.dart';

import '../../../../../../utils/text.dart';


Text fontfamilytext(int index) {
  return Text(
    "Enjoy the festival with family",
    style: textfamily[index](
        fontSize: 20.0,
        color: Colors.white),
  );
}
Text familyheadtext() {
  return Text(
    'Edit Your Text family',
    style: TextStyle(color: Colors.white, fontSize: 15),
  );
}
