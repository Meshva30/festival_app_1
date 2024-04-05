
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

import 'package:share_extend/share_extend.dart';

import '../../../../../utils/gobleList.dart';

InkWell save() {
  return InkWell(
    onTap: () async {
      postIndex = 6;

      RenderRepaintBoundary? boundray = imgkey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundray.toImage();
      ByteData? bytedata =
      await image.toByteData(format: ui.ImageByteFormat.png);
      imgdata = bytedata!.buffer.asUint8List();
      ImageGallerySaver.saveImage(imgdata!,
          name: 'poster', quality: 100);

    },
    child: const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.save_alt,
          color: Colors.white,
        ),
        Text(
          'Save',
          style: TextStyle(color: Colors.white),
        )
      ],
    ),
  );
}


InkWell share() {
  return InkWell(
    onTap: () async {
      RenderRepaintBoundary? boundray = imgkey.currentContext!
          .findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundray.toImage();
      ByteData? bytedata =
      await image.toByteData(format: ui.ImageByteFormat.png);
      imgdata = bytedata!.buffer.asUint8List();
      final directory = await getApplicationDocumentsDirectory();
      File fileImage = await File('${directory.path}/img.png').create();
      fileImage.writeAsBytesSync(imgdata!);
      await ShareExtend.share(fileImage.path, 'festival');
    },
    child: const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.share,
          color: Colors.white,
        ),
        Text(
          'share',
          style: TextStyle(color: Colors.white),
        )
      ],
    ),
  );
}
Column textedit() {
  return Column(
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
  );
}


Column canvasedit() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(
        Icons.draw,
        color: Colors.white,
      ),
      Text(
        'Canvas',
        style: TextStyle(color: Colors.white),
      )
    ],
  );
}



Text textname() {
  return const Text(
    'Change Background Image And Color',
    style: TextStyle(color: Colors.white),
  );
}
