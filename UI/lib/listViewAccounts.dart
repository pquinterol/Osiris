
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class listViewAccounts extends StatelessWidget{

  final String name;
  final String career;

  listViewAccounts({@required this.name,@required this.career});

  @override
  Widget build(BuildContext context) {

    return Row(
      //
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[

        CircleAvatar(child: Icon(Icons.account_circle),radius: 30.0,),
        Padding(
          padding: EdgeInsets.all(10.0),
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(name,style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
            Text(career,)
          ],
        ),

        Container(
        //For a button.,
         margin: EdgeInsets.all(5.0),
         padding: EdgeInsets.all(2.0),
         decoration: BoxDecoration(
           color: Colors.lightGreen,
           borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
         ),
         child: Text('Team Osiris', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold, color: Colors.white)),
        )
      ],
    );
  }

}