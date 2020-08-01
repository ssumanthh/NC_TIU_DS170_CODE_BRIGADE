import 'package:flutter/material.dart';
import 'package:qrcode/generate.dart';

import 'package:lottie/lottie.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    startTime();
    return Scaffold(
      appBar: AppBar(
        title: Text("FillMe"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Container(
                height: 300,
                width: 300,
                child: Lottie.asset('assets/animations/dustbin.json'),
                padding: const EdgeInsets.all(30.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                'Measuring Weight...',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
            ),
            // flatButton("Generate QR CODE", GeneratePage()),
          ],
        ),
      ),
    );
  }

  Widget flatButton(String text, Widget widget) {
    return FlatButton(
      padding: EdgeInsets.all(15.0),
      onPressed: () async {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => widget));
      },
      child: Text(
        text,
        style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
      ),
      shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.blue, width: 3.0),
          borderRadius: BorderRadius.circular(20.0)),
    );
  }

  startTime() async {
    var duration = new Duration(seconds: 8);
    return new Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => GeneratePage()),
    );
  }
}
