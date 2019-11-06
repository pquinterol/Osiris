import 'dart:io';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'home.dart';

//void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  _myAppState createState() => new _myAppState();
}

class _myAppState extends State<MyApp>{

  File _image;
  int _counter = 0;
  int _screenIndex;

  Future getImage() async{
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
     _image = image; 
    });
  }

  void changeScreen(int index){
    _screenIndex = index;
    
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
        body: new Center(
          //child: _image == null? Text('No Image') : new Image.file(_image),
          child: Container(
            child:  _image == null? Text('No Image',style: TextStyle(fontSize: 20.0, color: Colors.white),) : new Image.file(_image, fit: BoxFit.fill,),
            margin: EdgeInsets.all(15.0),
            //padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 5),
              //borderRadius: BorderRadius.all(Radius.circular(18.0))
            ),
            
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.camera),
          onPressed: getImage,
          tooltip: 'Take a photo',
        ),
        bottomNavigationBar: CurvedNavigationBar(
          
          backgroundColor: Colors.blueAccent,
          items: <Widget>[
            Icon(Icons.camera_enhance, size: 30),
            Icon(Icons.home, size: 30),
            Icon(Icons.list, size: 30),
          ],
          onTap: (index) {
            //Handle button tap
            
          },
          height: 70.0,
          animationDuration: Duration(milliseconds: 400),

        )
      ),
    );

  }

}