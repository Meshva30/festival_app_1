
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/gobleList.dart';



class Canvas extends StatefulWidget {
  const Canvas({super.key});

  @override
  State<Canvas> createState() => _CanvasState();
}

class _CanvasState extends State<Canvas> {
  @override
  Container build(BuildContext context) {
    return Container(
      height: 230,
      decoration: BoxDecoration(
        color: Color(0xff1c2438),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            'Change Background Image And Color',
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    postIndex = 4;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 5,
                        spreadRadius: 2,
                      )
                    ],
                    borderRadius:
                    BorderRadius.all(Radius.circular(5)),
                    color: Color(0xff1c2438),
                  ),
                  child: Text(
                    'Background',
                    style:
                    TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    postIndex = 5;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 5,
                        spreadRadius: 2,
                      )
                    ],
                    borderRadius:
                    BorderRadius.all(Radius.circular(5)),
                    color: Color(0xff1c2438),
                  ),
                  child: Text(
                    'BG Color',
                    style:
                    TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
