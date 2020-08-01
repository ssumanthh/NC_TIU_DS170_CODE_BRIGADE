import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  Welcome({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _Welcomes();
}

class _Welcomes extends State<Welcome> {
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/image/welcome.jpg"),
                fit: BoxFit.fitHeight),
          ),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new SizedBox(
                width: 700,
                height: 50,
                child: RaisedButton(
                  color: Colors.amber[700],
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
