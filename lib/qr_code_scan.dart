import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:tech_bin/widgets/entry.dart';
import 'package:tech_bin/widgets/loader.dart';
import 'package:lottie/lottie.dart';

int randomNumber;

class Scanner extends StatefulWidget {
  @override
  _ScannerState createState() => new _ScannerState();
}

class _ScannerState extends State<Scanner> {
  String result = "h";
  bool loader = true, succes = false;
  Random random = new Random();

  Future _scanQR() async {
    try {
      var qrResult = await BarcodeScanner.scan();

      print("result${qrResult.rawContent}..\n");
      if ((qrResult.type).toString() != 'Cancelled') {
        setState(() {
          result = qrResult.rawContent;
          succes = true;
          randomNumber = int.parse(result);
          print(randomNumber);
          print((qrResult.type).toString());
        });
      } else {
        succes = false;
        print(succes);
        route();
      }
    } catch (ex) {
      setState(() {
        result = "ex";
        succes = false;
      });
    }
    loader = false;
  }

  @override
  void initState() {
    super.initState();
    _scanQR();
  }

  startTime() async {
    var duration = new Duration(seconds: 5);
    return new Timer(duration, route);
  }

  route() {
    if (succes == true) {
      print(result);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => EntryPage(
                    selectedIndex: 1,
                  )));
    } else {
      print("home");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => EntryPage(
            selectedIndex: 0,
          ),
        ),
      );
    }
  }

  // ignore: missing_return
  Widget build(BuildContext context) {
    switch (loader) {
      case true:
        return Loader();
      case false:
        startTime();
        return Scaffold(
          body: Center(
            child: succes == true
                ? Center(
                    child: Container(
                      height: 300,
                      width: 300,
                      child: Column(
                        children: [
                          Lottie.asset('assets/animations/weight.json'),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                              'Estimating the Weight',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Text(
                    "scan unSuccessfull!!!!!!!!$result",
                    style: TextStyle(fontSize: 20),
                  ),
          ),
        );
    }
  }
}
