import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:osiris2/cameraScreen.dart';
import 'package:osiris2/infoScreen.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'fullInfoScreen.dart';
import 'home.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget{
  _myAppState createState() => new _myAppState();
}

class _myAppState extends State<MyApp>{

  File _image;
  int _counter = 0;
  int _screenIndex = 1;

  final home _home = new home();
  //final cameraScreen _c = new cameraScreen(image: null);
  final infoScreen _infoScreen = new infoScreen();

  //final String urlEAFIT = 'http://10.161.35.46:4000/identify'
  
  //Set up the url and finish modifiying the getImage method
  Future getImage() async{
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
     _image = image; 
    });

    String base64Image = base64Encode(image.readAsBytesSync());
    String filename = image.path.split('/').last;

    print(base64Image);
    print(filename);

    var response = await http.post('http://10.161.35.46:4000/identify', body: {
      'image': base64Image,
      'name': filename,
    });

    var state = response.statusCode;
    var jsonData = json.decode(response.body);
    var name = jsonData['name'];

    if(state==200){
        var filewrapper = base64Decode(jsonData['image']);
        var imageN = Image.memory(base64Decode(filewrapper.toString()));
        Navigator.push(context, new MaterialPageRoute(builder: (context) => new fullInfoScreen(f: new flower(image: imageN,name: name,info: '',invasibe: true,issues: '',origin: '',procedures: ''))));
      }

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
        //body: _screenIndex == 1? home():cameraScreen(image: _image,),
        body:homeBuilder(_screenIndex),                                                                // Metod who gives body the screen that the actual index represents.

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

  Widget homeBuilder(int index){
    if(index==0){
      return cameraScreen(image:_image);
    }else if(index==1){
      return _home;
    }else{
      return _infoScreen;
    }
  }

}