import 'package:fillme/authentication/auth.dart';
import 'package:flutter/material.dart';


class Municipale extends StatefulWidget{
    Municipale({this.auth, this.onSignOut});
  final BaseAuth auth;
  final VoidCallback onSignOut;
  @override
  _MunciState createState()=>new _MunciState();
  }
  
  class _MunciState extends State<Municipale>{
    void _signOut() async {
      try {
        await widget.auth.signOut();
        widget.onSignOut();
      } catch (e) {
        print(e);
      }
    }

    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
        title: Text('Fillme'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          RaisedButton(
              child: new Text('signout'),
              onPressed: () {
                _signOut();
              }),
        ],
      ),
        body:Text('Municipal',style:TextStyle(fontSize:20),)
      );
    }
}