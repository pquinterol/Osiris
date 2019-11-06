import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:osiris2/cameraScreen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  _myAppState createState() => new _myAppState();
}

class _myAppState extends State<MyApp>{

  File _image;
  int _counter = 0;
  int _screenIndex = 1;

  Future getImage() async{
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
     _image = image; 
    });
  }

  void changeScreen(int index){

    setState(() {
      _screenIndex = index;
    });

  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Osiris',
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
        appBar: AppBar(
          title: Text('Osiris', style: TextStyle(fontFamily: 'Raleway', fontSize: 30.0, color: Colors.blueAccent)),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.blueAccent,
        body: _screenIndex == 1? home():cameraScreen(image: _image,),

        floatingActionButton: _screenIndex != 0? null : FloatingActionButton(
          child: Icon(Icons.camera),
          //backgroundColor: Colors.blue[100],
          //autofocus: true,
          onPressed: _screenIndex == 0? getImage : (){},
          tooltip: 'Take a photo',
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        bottomNavigationBar: CurvedNavigationBar(
          
          backgroundColor: Colors.blueAccent,
          items: <Widget>[
            Icon(Icons.camera_enhance, size: 30),
            Icon(Icons.home, size: 30),
            Icon(Icons.list, size: 30),
          ],
          onTap: (index) {
            //Handle button tap
            changeScreen(index);
          },
          height: 70.0,
          animationDuration: Duration(milliseconds: 400),

        )
      ),
    );

  }

}