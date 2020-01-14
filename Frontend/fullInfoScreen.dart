import 'package:flutter/material.dart';
import 'package:osiris2/infoScreen.dart';

class fullInfoScreen extends StatelessWidget{

  final flower f;

  fullInfoScreen({@required this.f});
  
  @override
  Widget build(BuildContext context){

    return new Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blueAccent,),
            onPressed: (){
              Navigator.pop(context);
            }
        ),
        title: Text('Information',style: TextStyle(color: Colors.white, fontSize: 30.0, fontFamily: 'Raleway'),),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.white,
      body: _fullInfoScreen(),
    );

  }

  Widget _fullInfoScreen(){

    return ListView(
      addAutomaticKeepAlives: true,
      children: <Widget>[

        Column(

          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
            ),
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.blueAccent,width: 5.0)),
              padding: EdgeInsets.all(10.0),
              child: f.image,
            )
          ],
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(                               //If needed, change Container by a SizedBox
              child: Text(f.info,softWrap: true,overflow: TextOverflow.clip,style: TextStyle(color: Colors.black,fontSize: 5.0,fontWeight: FontWeight.normal),),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                invasibeState(),
                Padding(padding: EdgeInsets.all(5.0),),
                Text('From: '+f.origin,style: TextStyle(color: Colors.black,fontSize: 10.0,fontWeight: FontWeight.w500),)
              ],
            )
          ],
        ),

        Padding(padding: EdgeInsets.all(5.0),),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(5.0),
              child: Text('Issues',style: TextStyle(color: Colors.black,decoration: TextDecoration.underline,fontSize: 20.0,fontWeight: FontWeight.w800),),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(5.0),
              child: Text(f.issues,softWrap: true,overflow: TextOverflow.clip,style: TextStyle(color: Colors.black,fontSize: 5.0),),
            ),
            Container(
              margin: EdgeInsets.all(5.0),
              child: Text('Procedures',style: TextStyle(color: Colors.black,decoration: TextDecoration.underline,fontSize: 20.0,fontWeight: FontWeight.w800),),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.all(5.0),
              child: Text(f.procedures,softWrap: true,overflow: TextOverflow.clip,style: TextStyle(color: Colors.black,fontSize: 5.0),),
            )
          ],
        )
      ],
    );

  }

  Widget invasibeState(){
    if (f.invasibe){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.warning, color: Colors.redAccent),
          Text('Invasora',style: TextStyle(color: Colors.redAccent, fontSize: 10.0, fontWeight: FontWeight.w800),)
        ]
      );
    }else{
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(Icons.warning, color: Colors.greenAccent),
          Text('Nativa',style: TextStyle(color: Colors.greenAccent, fontSize: 10.0, fontWeight: FontWeight.w800),)
        ]
      );
    }
  }

}