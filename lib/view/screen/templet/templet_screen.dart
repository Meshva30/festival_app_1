import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_extend/share_extend.dart';

import '../../../utils/color.dart';
import '../../../utils/gobleList.dart';
import '../../../utils/list.dart';
import '../../../utils/text.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        elevation: 5,
        shadowColor: Colors.grey,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          Padding(
            padding: EdgeInsets.all(15),
            child: InkWell(
              onTap: () {
                setState(() {
                  txtname = TextEditingController(text: '');
                });
              },
              child: Icon(
                Icons.refresh,
                size: 28,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: RepaintBoundary(
              key: imgkey,
              child: Container(
                height: 550,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: (isImageandColor)
                        ? AssetImage(
                            festivallist[postIndex]['image'][backgroundindex],
                          )
                        : AssetImage(''),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xff1c2438),
                      blurRadius: 0.5,
                      spreadRadius: 1,
                    )
                  ],
                ),
                child: Stack(
                  children: [
                    Container(
                        width: 550,
                        height: double.infinity,
                        child: (isImageandColor)
                            ? Image.asset(
                                festivallist[postIndex]['image'][backgroundindex],
                                fit: BoxFit.cover,
                              )
                            : null),
                    Positioned(
                      top: top,
                      bottom: bottem,
                      left: left,
                      right: right,
                      child: Container(
                        height: 300,
                        width: 300,
                        alignment: n0,
                        child: Text(
                          txtname.text,
                          style: textfamily[textfontfamilyindex](
                            fontSize: fontofsize,
                            color: Colorlist[textcolorindex],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 80,
          ),
          IndexedStack(
            index: editIndex,
            children: [
              canvasBox(), //0
              textBox(), //1
              backgroundSelect(), //2
              alignment(), //3
              selectTextBox(), //4
              selectTextColor(), //5
              fontFamily(), //6
              textFieldBox(), //7
            ],
          ),
          navigationBar(),
        ],
      ),
    );
  }

  Widget navigationBar() {
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color: Colors.indigo,
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 5,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                editIndex = 0;
              });
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.indeterminate_check_box_outlined,
                  color: Colors.white,
                ),
                Text(
                  'Canvas',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              setState(() {
                editIndex = 1;
              });
            },
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.text_fields,
                  color: Colors.white,
                ),
                Text(
                  'Text',
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () async{

                final directory = await getApplicationDocumentsDirectory();
                File fileImage = await File('${directory.path}/img.png')
                    .create();
                fileImage.writeAsBytesSync(imgdata!);
                await ShareExtend.share(fileImage.path, 'festival');
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.share,
                  color: Colors.white,
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text(
                      'Share',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
          ),
          InkWell(
            onTap: ()async {

               setState(() async {
                 RenderRepaintBoundary? boundray = imgkey.currentContext!
                     .findRenderObject() as RenderRepaintBoundary;
                 ui.Image image = await boundray.toImage();
                 ByteData? bytedata = await image.toByteData(
                     format: ui.ImageByteFormat.png);
                 imgdata = bytedata!.buffer.asUint8List();
                 ImageGallerySaver.saveImage(imgdata!,
                     name: 'poster', quality: 100);
               });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.save_alt,
                  color: Colors.white,
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text(
                      'Save',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container canvasBox() {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.indigo,
      ),
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Text(
            'Change Background Image And Colour',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Row(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 60),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      editIndex = 2;
                    });
                  },
                  child: Container(
                    width: 130,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.white,
                          blurRadius: 5,
                          spreadRadius: 1,
                        )
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      color: Colors.indigo,
                    ),
                    child: const Text(
                      'Background',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              Container(
                width: 130,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 5,
                      spreadRadius: 1,
                    )
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: Colors.indigo,
                ),
                child: const Text(
                  'BG Colour',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container textBox() {
    return Container(
      height: 220,
      decoration: const BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          const Text(
            'Edit Your Text Here!!',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    editIndex = 4;
                  });
                },
                child: Container(
                  width: 130,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 5,
                        spreadRadius: 1,
                      )
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.indigo,
                  ),
                  child: const Text(
                    'Add Text',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    editIndex = 3;
                  });
                },
                child: Container(
                  width: 130,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 5,
                        spreadRadius: 1,
                      )
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.indigo,
                  ),
                  child: const Text(
                    'Alignment',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    editIndex = 6;
                  });
                },
                child: Container(
                  width: 130,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 5,
                        spreadRadius: 1,
                      )
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.indigo,
                  ),
                  child: const Text(
                    'Font Family',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    editIndex = 5;
                  });
                },
                child: Container(
                  width: 130,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white,
                        blurRadius: 5,
                        spreadRadius: 1,
                      )
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.indigo,
                  ),
                  child: const Text(
                    'Font Color',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget backgroundSelect() {
    return Container(
      height: 220,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Choose Background',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    editIndex = 0;
                  });
                },
                child: const Icon(
                  Icons.done,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                festivallist[postIndex]['image']?.length ?? 0,
                (index) => InkWell(
                  onTap: () {
                    setState(() {
                      backgroundindex = index;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, top: 15),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 0.5,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: Image.asset(
                        festivallist[postIndex]['image'][index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container alignment() {
    return Container(
      height: 220,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Edit Your Font Style',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              InkWell(
                  onTap: () {
                    setState(() {
                      editIndex = 1;
                    });
                  },
                  child: const Icon(
                    Icons.done,
                    color: Colors.white,
                  ))
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Divider(
            thickness: 1.5,
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Alignament',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              n0 = n;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            child: Icon(
                              Icons.format_align_left,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              n0 = n1;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            child: Icon(
                              Icons.format_align_center,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              n0 = n2;
                            });
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            child: Icon(
                              Icons.format_align_right,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 38.0),
                      child: Text(
                        'Font size',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              fontofsize++;
                            });
                          },
                          child: Container(
                            width: 40,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Text(
                              'A+',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              fontofsize--;
                            });
                          },
                          child: Container(
                            width: 40,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5)),
                            ),
                            child: Text(
                              'A-',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.format_bold_sharp,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.format_italic,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget selectTextBox() {
    return Container(
      height: 220,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Choose Your Text',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    editIndex = 1;
                  });
                },
                child: const Icon(
                  Icons.done,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Divider(
            thickness: 1.5,
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              setState(() {
                editIndex = 8;
              });
            },
            child: TextField(
              controller: txtname,
              decoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget selectTextColor() {
    return Container(
      height: 220,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Choose Your Text',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    editIndex = 1;
                  });
                },
                child: const Icon(
                  Icons.done,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Divider(
            thickness: 1.5,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                children: [
                  ...List.generate(
                    colorList.length,
                    (index) => InkWell(
                        onTap: () {
                          setState(() {
                            textcolorindex = index;
                          });
                        },
                        child: colourListItem(Colorlist[index])),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget colourListItem(Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 11),
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  Widget fontFamily() {
    return Container(
      height: 220,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Edit Your Text Family',
                style: TextStyle(color: Colors.white, fontSize: 17),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    editIndex = 1;
                  });
                },
                child: const Icon(
                  Icons.done,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Divider(
            thickness: 1.5,
          ),
          Container(
            height: 145,
            child: Expanded(
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: 60,
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.2),
                      ),
                    ),
                  ),
                  ListWheelScrollView.useDelegate(
                    itemExtent: 55,
                    onSelectedItemChanged: (value) {
                      setState(() {
                        textfontfamilyindex = value;
                      });
                    },
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: textfamily.length,
                      builder: (context, index) => InkWell(
                        onTap: () {
                          textfontfamilyindex = index;
                        },
                        child: Text(
                          'Enjoy the festival with family',
                          style: textfamily[index](
                              fontSize: 20.0, color: Colors.white),
                        ),
                      ),
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

  Widget textFieldBox() {
    return Container(
      height: 220,
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Edit Your Text',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    TextEditingControllerlist.add(txtname.text);
                    editIndex = 1;
                  });
                },
                child: Icon(Icons.done),
              ),
            ],
          ),
          TextField(
            style: TextStyle(color: Colors.white),
            controller: txtname,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
