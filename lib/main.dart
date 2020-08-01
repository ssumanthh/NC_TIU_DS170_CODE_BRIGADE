import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _MpAppState();
}

class _MpAppState extends State<MyApp>
{
 Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(title: Text('Fill Me'),),
        body:Center(
          child:Text('Welcome',style:TextStyle(fontSize:20),
          )
        )
      );
    }

}