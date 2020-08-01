import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

enum FormType {
  login,
  register,
}

class _LoginPageState extends State<LoginPage> {
  String _name;
  String _email;
  String _password;
  FormType _formType = FormType.login;
  static final formKey = new GlobalKey<FormState>();
  List<Widget> usernameAndPassword() {
    if (_formType == FormType.login) {
      return [
        SizedBox(height: 150),
        new Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: new SafeArea(
                child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                child: new Row(
                  children: [
                    Text(
                      'Sign in',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.green[400],
                      ),
                    ),
                    Text(
                      ' to your account',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 5.0),
                  child: new TextFormField(
                    key: new Key('email'),
                    decoration: InputDecoration(
                      hintText: 'Enter Your Email Here...',
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.green[400],
                      ),
                      hintStyle: TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white70,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12.0)),
                        borderSide:
                            BorderSide(color: Colors.blue[100], width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide:
                            BorderSide(color: Colors.blue[100], width: 1),
                      ),
                    ),
                    autocorrect: false,
                    validator: (val) =>
                        val.isEmpty ? 'Email can\'t be empty.' : null,
                    onSaved: (val) => _email = val,
                  )),
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 20.0),
                child: new TextFormField(
                  key: new Key('password'),
                  decoration: InputDecoration(
                    hintText: 'Enter Your password Here...',
                    prefixIcon: Icon(
                      Icons.enhanced_encryption,
                      color: Colors.green[400],
                    ),
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.blue[100], width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue[100], width: 1),
                    ),
                  ),
                  obscureText: true,
                  autocorrect: false,
                  validator: (val) =>
                      val.isEmpty ? 'Password can\'t be empty.' : null,
                  onSaved: (val) => _password = val,
                ),
              ),
            ])))
      ];
    } else {
      return [
        SizedBox(height: 150),
        new Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Colors.white,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: new SafeArea(
                child: Column(children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                child: new Row(
                  children: [
                    Text(
                      'Create',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.green[400],
                      ),
                    ),
                    Text(
                      ' your account',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                child: new TextFormField(
                  key: new Key('name'),
                  decoration: InputDecoration(
                    hintText: 'Enter Your name Here...',
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.green[400],
                    ),
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.blue[100], width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue[100], width: 1),
                    ),
                  ),
                  autocorrect: false,
                  validator: (val) => val.isEmpty
                      ? 'Username can\'t be empty.'
                      : val.length < 2
                          ? 'user name must be at least 2 charecter long'
                          : null,
                  onSaved: (val) => _name = val,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 10.0),
                child: new TextFormField(
                  key: new Key('email'),
                  decoration: InputDecoration(
                    hintText: 'Enter Your Email Here...',
                    prefixIcon: Icon(
                      Icons.email,
                      color: Colors.green[400],
                    ),
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.blue[100], width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue[100], width: 1),
                    ),
                  ),
                  autocorrect: false,
                  validator: (val) =>
                      val.isEmpty ? 'Email can\'t be empty.' : null,
                  onSaved: (val) => _email = val,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 20.0),
                child: new TextFormField(
                  key: new Key('password'),
                  decoration: InputDecoration(
                    hintText: 'Enter Your password Here...',
                    prefixIcon: Icon(
                      Icons.enhanced_encryption,
                      color: Colors.green[400],
                    ),
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.blue[100], width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.blue[100], width: 1),
                    ),
                  ),
                  obscureText: true,
                  autocorrect: false,
                  validator: (val) =>
                      val.isEmpty ? 'Password can\'t be empty.' : null,
                  onSaved: (val) => _password = val,
                ),
              ),
            ])))
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: _height,
        width: _width,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: usernameAndPassword(),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
