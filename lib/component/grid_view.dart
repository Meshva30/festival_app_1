import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget gridviewBox(String img, String name,Color color) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      //height: 220,
      width: 210,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(img),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              name,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    ),
  );
}
