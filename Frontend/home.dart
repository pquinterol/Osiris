
import 'package:flutter/material.dart';
import 'listViewAccounts.dart';

class home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return _homeWidget();

  }

  Widget _homeWidget(){

    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              Text('Osiris', style: TextStyle(fontSize: 40.0,letterSpacing: 10.0, decorationStyle: TextDecorationStyle.wavy,color: Colors.white, fontWeight: FontWeight.w900)),
              Text('Invasibe Flowers Recognition App', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 20, decorationStyle: TextDecorationStyle.solid, fontWeight: FontWeight.bold),)
            ],
          )
        ),
        Padding(
          padding: EdgeInsets.all(20.0),
        ),
        Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(18.0))
          ),
          height: 210,
          child: ListView(
            addAutomaticKeepAlives: true,
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 10.0),
            children: <Widget>[
              listViewAccounts(name: 'Pedro',career: 'Ing de Sistemas',),
              listViewAccounts(name: 'Victor',career: 'Ing Civil',),
              listViewAccounts(name: 'Andrea',career: 'Biologia',),
            ],
          )
        ),
        Container(
          margin: EdgeInsets.all(10.0),
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: Text('Whatever'),
          ),
        )
      ],
    );
  }

}