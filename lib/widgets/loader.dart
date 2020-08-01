

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatefulWidget{
  @override
  _LoaderState createState()=>_LoaderState();
}

class _LoaderState extends State<Loader>{

@override
 Widget build (BuildContext context){
   return Scaffold(
     backgroundColor :  Color(0xFF75A2EA),
     body: Center(
       child:SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
       )
     )  
     );

 }
}