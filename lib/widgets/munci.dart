import 'package:flutter/material.dart';


class Municipale extends StatefulWidget{

  @override
  _MunciState createState()=>new _MunciState();
  }
  
  class _MunciState extends State<Municipale>{
    
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(title: Text('FilMe'),),
        body:Text('Municipal',style:TextStyle(fontSize:20),)
      );
    }
}