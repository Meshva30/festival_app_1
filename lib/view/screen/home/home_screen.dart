import 'package:festival_app/component/grid_view.dart';
import 'package:festival_app/component/listview.dart';
import 'package:festival_app/utils/list.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/gobleList.dart';

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}



class _home_screenState extends State<home_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 5,
        shadowColor: Colors.grey,
        title: Text(
          "Festy",
           style: GoogleFonts.dancingScript(
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
        ),
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isList = !isList;
                });
              },
              icon: (isList) ? Icon(Icons.grid_view) : Icon(Icons.list))
        ],
      ),
      body: (isList)
          ? ListView.builder(
            itemCount: festivallist.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                setState(() {
                  postIndex = index;
                  Navigator.of(context).pushNamed('edit',);
                });
              },
              child: ContainerBox(
                festivallist[index]['name'],
                festivallist[index]['contant'],
                festivallist[index]['Images'],
                index,
                festivallist[index]['color'],

              ),
            ),
          )
          : GridView.builder(
              itemCount: festivallist.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1 / 1,
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    postIndex=index;
                    Navigator.of(context).pushNamed('edit');
                  });
                },
                child: gridviewBox(
                  festivallist[index]['Images'],
                  festivallist[index]['name'],
                  festivallist[index]['color'],
                ),
              ),
            ),
    );
  }
}

bool isList = true;
