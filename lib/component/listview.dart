import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget ContainerBox(String name, String content, String img, int index,Color color) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Column(
      children: [
        Container(
          height: 100,
          width: 500,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                    Text(
                      content,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 15),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  child: CircleAvatar(
                    radius: 40,
                    // backgroundColor: Colors.grey,
                    backgroundImage: AssetImage(img),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
