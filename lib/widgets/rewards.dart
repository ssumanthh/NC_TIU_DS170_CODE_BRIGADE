import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class Rewards extends StatefulWidget {
  @override
  _RewardsState createState() => _RewardsState();
}

class _RewardsState extends State<Rewards> {
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    int day = now.day;
    int month = now.month;
    int year = now.year;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Container(
              height: 250.0, // Set as you want
              child: Image.asset('assets/image/coupon.png')),
          Container(
            child: Text(
              'Total Reward Amount',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.blueGrey,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          Container(
            child: Text(
              '₹ 306',
              textAlign: TextAlign.start,
              style: TextStyle(
                color: Colors.deepOrange,
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: 9,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blueGrey[600],
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          color: Colors.black54,
                          offset: Offset(0.5, 3.0),
                          blurRadius: 10.0),
                    ],
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    margin: EdgeInsets.all(2),
                    elevation: 1.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          "${day - index} / $month / $year",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blueGrey[300],
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        Image.asset(
                          'assets/image/rewards.png',
                          fit: BoxFit.cover,
                          height: 60,
                          width: 120,
                        ),
                        Text(
                          'Your have Earned',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          '₹${index * 7 + 6}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.deepOrange[700],
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
