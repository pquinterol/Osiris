

import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class cameraScreen extends StatefulWidget{

  File image;
  @override
  _cameraScreenState createState() => _cameraScreenState();

  cameraScreen({this.image});

}

class _cameraScreenState extends State<cameraScreen>{

  @override
  Widget build(BuildContext context) {
    return new Center(
      //child: _image == null? Text('No Image') : new Image.file(_image),
      child: Container(
        child:  widget.image == null? Text('No Image',style: TextStyle(fontSize: 20.0, color: Colors.white),) : new Image.file(widget.image, fit: BoxFit.fill,),
        margin: EdgeInsets.all(15.0),
        //padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 5),
          //borderRadius: BorderRadius.all(Radius.circular(18.0))
        ),
        
      ),
    );
  }

}