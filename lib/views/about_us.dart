import 'package:flutter/material.dart';

class AbooutUs extends StatefulWidget {
  @override
  _Information createState() => new _Information();
}

class _Information extends State<AbooutUs> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('About Us'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 20.0, 0, 0),
              height: 60,
              child: Center(
                child: Text('Mission',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
              ),
            ),
            Container(
              padding: EdgeInsets.all(15),
              height: 230,
              child: Container(
                padding: EdgeInsets.fromLTRB(30.0, 0, 12.0, 15.0),
                child: Center(
                  child: Text(
                      ' Our mission is to reform the methods of waste disposal at public interest in order to have a healthy environment.So it is a app from our side which directs you to the nearest bin and provides the credits for being a part in our mission.',
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 20,
                      )),
                ),
              ),
            ),
            Container(
              height: 50,
              child: Center(
                child: Container(
                  margin: EdgeInsets.fromLTRB(120, 0, 120, 0),
                  height: 5,
                  decoration: BoxDecoration(color: Colors.lightBlueAccent),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
              height: 60,
              child: Center(
                child: Text('Our team',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20, 15, 20, 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              image: new DecorationImage(
                                image:
                                    new AssetImage("assets/image/sumanth.jpg"),
                                fit: BoxFit.fill,
                              ),
                              shape: BoxShape.circle,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(0.5, 3.0),
                                    blurRadius: 10.0),
                              ],
                            ),
                          ),
                          Center(
                            child: Container(
                                padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                                child: Text('Sumanth',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ))),
                          ),
                          Center(
                            child: Container(
                                padding: EdgeInsets.fromLTRB(0, 2.0, 0, 10.0),
                                child: Text('Developer',
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ))),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              image: new DecorationImage(
                                image: new AssetImage("assets/image/amogh.jpg"),
                                fit: BoxFit.fill,
                              ),
                              shape: BoxShape.circle,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(0.5, 3.0),
                                    blurRadius: 10.0),
                              ],
                            ),
                          ),
                          Center(
                            child: Container(
                                padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                                child: Text('Amogh',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ))),
                          ),
                          Center(
                            child: Container(
                                padding: EdgeInsets.fromLTRB(0, 2.0, 0, 10.0),
                                child: Text('Developer',
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ))),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              image: new DecorationImage(
                                  image: new AssetImage(
                                      "assets/image/shravya.jpg"),
                                  fit: BoxFit.fill),
                              shape: BoxShape.circle,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(0.5, 3.0),
                                    blurRadius: 10.0),
                              ],
                            ),
                          ),
                          Center(
                            child: Container(
                                padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                                child: Text('Shravya',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ))),
                          ),
                          Center(
                            child: Container(
                                padding: EdgeInsets.fromLTRB(0, 2.0, 0, 10.0),
                                child: Text('Developer',
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ))),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              image: new DecorationImage(
                                  image:
                                      new AssetImage("assets/image/elton.jpg"),
                                  fit: BoxFit.fill),
                              shape: BoxShape.circle,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(0.5, 3.0),
                                    blurRadius: 10.0),
                              ],
                            ),
                          ),
                          Center(
                            child: Container(
                                padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                                child: Text('Elton',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ))),
                          ),
                          Center(
                            child: Container(
                                padding: EdgeInsets.fromLTRB(0, 2.0, 0, 10.0),
                                child: Text('Developer',
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ))),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              image: new DecorationImage(
                                image:
                                    new AssetImage("assets/image/anusha.jpg"),
                                fit: BoxFit.fill,
                              ),
                              shape: BoxShape.circle,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(0.5, 3.0),
                                    blurRadius: 10.0),
                              ],
                            ),
                          ),
                          Center(
                            child: Container(
                                padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                                child: Text('Anusha',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ))),
                          ),
                          Center(
                            child: Container(
                                padding: EdgeInsets.fromLTRB(0, 2.0, 0, 10.0),
                                child: Text('Developer',
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ))),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              image: new DecorationImage(
                                image:
                                    new AssetImage("assets/image/praveen.jpg"),
                                fit: BoxFit.fill,
                              ),
                              shape: BoxShape.circle,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(0.5, 3.0),
                                    blurRadius: 10.0),
                              ],
                            ),
                          ),
                          Center(
                            child: Container(
                                padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                                child: Text('Praveen',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ))),
                          ),
                          Center(
                            child: Container(
                                padding: EdgeInsets.fromLTRB(0, 2.0, 0, 10.0),
                                child: Text('Mentor',
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ))),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              image: new DecorationImage(
                                  image: new AssetImage(
                                      "assets/image/prashanth.jpg"),
                                  fit: BoxFit.fill),
                              shape: BoxShape.circle,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(0.5, 3.0),
                                    blurRadius: 10.0),
                              ],
                            ),
                          ),
                          Center(
                            child: Container(
                                padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                                child: Text('Prashanth',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ))),
                          ),
                          Center(
                            child: Container(
                                padding: EdgeInsets.fromLTRB(0, 2.0, 0, 10.0),
                                child: Text('Mentor',
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ))),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 55,
                            width: 55,
                            decoration: BoxDecoration(
                              image: new DecorationImage(
                                  image:
                                      new AssetImage("assets/image/ranju.jpeg"),
                                  fit: BoxFit.fill),
                              shape: BoxShape.circle,
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black54,
                                    offset: Offset(0.5, 3.0),
                                    blurRadius: 10.0),
                              ],
                            ),
                          ),
                          Center(
                            child: Container(
                                padding: EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                                child: Text('Ranjith',
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ))),
                          ),
                          Center(
                            child: Container(
                                padding: EdgeInsets.fromLTRB(0, 2.0, 0, 10.0),
                                child: Text('Developer',
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ))),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
