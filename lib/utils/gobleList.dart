

import 'dart:typed_data';

import 'package:flutter/material.dart';

int postIndex = 0;
int selectedIndex=0;
int editIndex =0;

int backgroundindex = 0;
int backgroundcolorindex = 0;
bool isImageandColor =true;
Alignment? n0;
Alignment n=Alignment.topLeft;
Alignment n1=Alignment.topCenter;
Alignment n2=Alignment.topRight;



Color color = Colors.white;
Color textcolor = Colors.black;
Uint8List? imgdata;

GlobalKey imgkey = GlobalKey();