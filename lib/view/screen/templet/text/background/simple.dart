
import 'package:flutter/material.dart';

Icon icons() {
  return Icon(
    Icons.done,
    color: Colors.white,
  );
}
Column dividerandspace() {
  return Column(
    children: [
      const SizedBox(
        height: 5,
      ),
      Divider(
        thickness: 2,
      ),
      const SizedBox(
        height: 5,
      ),
    ],
  );
}
