import 'package:festival_app/utils/list.dart';
import 'package:festival_app/view/screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/gobleList.dart';

class edit_screen extends StatefulWidget {
  const edit_screen({super.key});

  @override
  State<edit_screen> createState() => _edit_screenState();
}

class _edit_screenState extends State<edit_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        shadowColor: Colors.grey,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.download_rounded,
              size: 30,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Center(
              child: Container(
                height: 350,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                          festivallist[postIndex]['Images'],
                        ))),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {

                Navigator.of(context).pushNamed('templet');
              },
              child: Container(
                height: 80,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'Edit Template',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 33,
            ),
            Container(
              alignment: Alignment.bottomRight,
              height: 225,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(220),
                      topRight: Radius.circular(220))),
              child: Container(
                  alignment: Alignment.center,
                  height: 190,
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(220),
                          topRight: Radius.circular(220))),
                  child: Text(
                    '            Festivals\nCreate your Template with us!!',
                    style: GoogleFonts.butterflyKids(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
