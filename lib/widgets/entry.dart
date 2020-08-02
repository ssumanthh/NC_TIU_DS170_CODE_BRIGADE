

import 'package:flutter/material.dart';


class EntryPage extends StatefulWidget{

  @override
  _EntryState createState()=>new _EntryState();
  }
  
  class _EntryState extends State<EntryPage>{
    
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(title: Text('Fill Me'),),
        body:Text('Home',style:TextStyle(fontSize:20),)
      );
    }
}