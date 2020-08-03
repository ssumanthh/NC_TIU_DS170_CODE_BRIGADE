import 'package:flutter/material.dart';

import 'package:percent_indicator/percent_indicator.dart';

import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _Home createState() => new _Home();
}

class _Home extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            child: Container(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text('Total waste Collected',
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                            color: Colors.blueGrey[500],
                            fontSize: 20,
                          ))),
                      SizedBox(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          color: Colors.deepOrangeAccent[900],
                          height: 10,
                          width: 70,
                        ),
                      ),
                      Text('11 kg',
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Colors.blueGrey[900],
                            fontSize: 28,
                          ))),
                    ],
                  ),
                )),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Center(
              child: CircularPercentIndicator(
                percent: 0.7,
                animation: true,
                radius: 300.0,
                lineWidth: 30.0,
                circularStrokeCap: CircularStrokeCap.square,
                linearGradient: LinearGradient(colors: [
                  Colors.teal[700],
                  Colors.teal[400],
                  Colors.tealAccent,
                  Colors.teal,
                ]),
                backgroundColor: Colors.blueGrey[100],
                center: Center(
                  child: Container(
                    height: 250,
                    width: 250,
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                          child: Container(
                              height: 150.0, // Set as you want
                              child: Image.asset('assets/image/waste.jpg')),
                        ),
                        SizedBox(
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            color: Colors.deepOrangeAccent[900],
                            height: 4,
                            width: 70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              color: Colors.deepOrangeAccent[900],
              height: 6,
              width: 70,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text('2.5 kg',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.blueGrey[900],
                        fontSize: 28,
                      ))),
                  SizedBox(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      color: Colors.deepOrangeAccent[900],
                      height: 10,
                      width: 70,
                    ),
                  ),
                  Text('This week',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                        color: Colors.blueGrey[500],
                        fontSize: 20,
                      ))),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('8.5 kg',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                        fontWeight: FontWeight.w800,
                        color: Colors.blueGrey[900],
                        fontSize: 28,
                      ))),
                  SizedBox(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      color: Colors.deepOrangeAccent[900],
                      height: 10,
                      width: 70,
                    ),
                  ),
                  Text('This Month',
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                        color: Colors.blueGrey[500],
                        fontSize: 20,
                      ))),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
