
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';
import 'fullInfoScreen.dart';

class infoScreen extends StatefulWidget{

  _infoScreenState createState() => _infoScreenState();

}

class _infoScreenState extends State<infoScreen>{


  Future<List<flower>> _getFlowers() async{

    var data = await http.get('http://192.168.1.60:4000/flowers');
    var jsonData = json.decode(data.body);                                         //Check
    List<flower> flowerList = [];

    for(var f in jsonData){
      //flowerList.add(new flower(image: f['image'],name: f['name'],origin: f['origin'],info: f['info'],issues: f['issues'],procedures: f['procedures'], invasibe: f['invasibe']));
      var image = Image.memory(base64Decode(jsonData['image']));
      var name = jsonData['name'];
      flowerList.add(new flower(image: image,name: name,info: '',invasibe: false,issues: '',origin: '',procedures: ''));
    }

    return flowerList;

  }

  Widget displayList(BuildContext context, AsyncSnapshot snapshot){
    return ListView.builder(
      itemCount: snapshot.data.length,
      addAutomaticKeepAlives: true,
      itemBuilder: (BuildContext context, int index){
        //
        //return flowerRecog? _flowerFullInfo() : ListTile()
        return flowersInfo(snapshot, index);
      },
    );
  }

  Widget flowersInfo(AsyncSnapshot snapshot, int index){

    return ListTile(
      leading: snapshot.data[index].image,
      title: Text(snapshot.data[index].name),
      subtitle: Text(snapshot.data[index].origin),
      trailing: snapshot.data[index].invasibe ? Icon(Icons.warning,color: Colors.redAccent,): Icon(Icons.check_circle, color: Colors.lightGreenAccent),
      onTap: (){
        Navigator.push(context, new MaterialPageRoute(builder: (context) => new fullInfoScreen(f: snapshot.data[index])));           // fullInfoScreen class hasn't been implemented
      },
    );

  }

  Widget loadingScreen(){
    return Container(
      child: Center(
        child: Icon(Icons.cloud_download,size: 100.0,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            //color: Colors.white
          ),
          child: Text('Flowers Info',style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w900),)
        ),
        FutureBuilder(
          future: _getFlowers(),
          builder: (BuildContext context, AsyncSnapshot snapshot){
            
            return snapshot.hasData? displayList(context,snapshot):loadingScreen;

          },
        )
      ],
    );
  }

}

class flower{
  final Image image;
  final String name;
  final String origin;
  final String info;
  final String issues;
  final String procedures;
  final bool invasibe;

  flower({@required this.image, @required this.name, @required this.origin, @required this.info, @required this.issues, @required this.procedures, @required this.invasibe});
}