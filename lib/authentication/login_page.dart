
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'auth.dart';
import '../widgets/loader.dart';
import '../widgets/primary_button.dart';

bool googleSignIn = false;

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title, this.auth, this.onSignIn, this.type})
      : super(key: key);
  final String type;
  final String title;
  final BaseAuth auth;
  final VoidCallback onSignIn;

  @override
  _LoginPageState createState() => new _LoginPageState();
}

enum FormType {
  login,
  register,
}

class _LoginPageState extends State<LoginPage> {
  static final formKey = new GlobalKey<FormState>();
  static bool a = true;
  String _name;
  String _email;
  String _password;
  bool loading = false;

  FormType _formType = FormType.login;
  String _authHint = '';

  bool validateAndSave() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void googlelogin() async {
    try {
      String user = await widget.auth.signinWithGoogle();
      Loader();
      print('google');
      setState(() {
        _authHint = 'Signed In\n\nUser id: $user';
      });
      widget.onSignIn();
      googleSignIn = true;
    } catch (e) {
      setState(() {
        _authHint = 'sigin failed';
      });
    }
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      setState(() {
        loading = true;
      });
      if (_email != 'techbin@gmail.com') {
        try {
          String userId = _formType == FormType.login
              ? await widget.auth.signIn(_email, _password)
              : await widget.auth.createUser(_name, _email, _password);
          setState(() {
            _authHint = 'Signed In\n\nUser id: $userId';
          });
          print("done sigin");
          widget.onSignIn();
        } catch (e) {
          setState(() {
            loading = false;
            _authHint = e.message;
          });
          String msg;
          _formType == FormType.login
              ? msg = 'Login Failed'
              : msg = 'Registration Failed';
          Alert(context: context, title: msg, desc: _authHint).show();
          print(e);
        }
      } else {
       
        loading = false; 
        Alert(context: context, title: 'Login Failed', desc: 'Invaild User')
            .show();
      }
    } else {
      setState(() {
        _authHint = '';
      });
    }
  }

  void validateAndCheck() async {
    if (validateAndSave()) {
      setState(() {
        loading = true;
      });
      if (_email == 'techbin@gmail.com') {
        try {
          String userId = await widget.auth.signIn(_email, _password);
          setState(() {
            _authHint = 'Signed In\n\nUser id: $userId';
          });
          print("done sigin");
          widget.onSignIn();
        } catch (e) {
          setState(() {
            loading = false;
            _authHint = e.message;
          });
          Alert(context: context, title: 'Login Failed', desc: _authHint)
              .show();
          print(e);
        }
      } else {
       
          
           loading = false;

       
        Alert(
                context: context,
                title: 'Login Failed',
                desc: 'Invaild Muncipal User')
            .show();
      }
    } else {
      setState(() {
        _authHint = '';
      });
    }
  }

  void moveToRegister() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
      _authHint = '';
    });
  }

  void moveToLogin() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
      _authHint = '';
    });
  }

  List<Widget> usernameAndPassword() {
    if (a == true) {
      if (widget.type == 'Register') {
        setState(() {
          _formType = FormType.register;
          _authHint = '';
        });
      } else {
        setState(() {
          _formType = FormType.login;
          _authHint = '';
        });
      }
      a = false;
    }

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

  List<Widget> submitWidgets() {
    switch (_formType) {
      case FormType.login:
        return [
          SizedBox(height: 20),
          new PrimaryButton(
              key: new Key('login'),
              text: 'Login as User',
              height: 50.0,
              onPressed: validateAndSubmit),
          SizedBox(height: 5),
          new PrimaryButton(
              key: new Key('MunicipalLogin'),
              text: 'Login as Municipalty',
              height: 50.0,
              onPressed: validateAndCheck),
          SizedBox(height: 5),
          new Text(
            'OR',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 5),
          new ConstrainedBox(
            constraints: BoxConstraints.expand(height: 55.0),
            child: new RaisedButton(
              onPressed: googlelogin,
              shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              color: Colors.blue,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                          image: AssetImage("assets/image/google_logo.png"),
                          height: 35.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'continue with Google',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            new FlatButton(
                key: new Key('need-account'),
                child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Text(
                        "don't have an account?",
                        style: TextStyle(
                          color: Colors.black54,
                        ),
                      ),
                      new Text(
                        "Register",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),
                      ),
                    ]),
                onPressed: moveToRegister),
          ]),
        ];
      case FormType.register:
        return [
          SizedBox(height: 20),
          new PrimaryButton(
              key: new Key('register'),
              text: 'Create an account',
              height: 50.0,
              onPressed: validateAndSubmit),
          SizedBox(height: 5),
          new Text(
            'OR',
            style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 5),
          new ConstrainedBox(
            constraints: BoxConstraints.expand(height: 55.0),
            child: new RaisedButton(
              onPressed: googlelogin,
              shape: new RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              color: Colors.blue,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image(
                          image: AssetImage("assets/image/google_logo.png"),
                          height: 35.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          'continue with Google',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
            new FlatButton(
                key: new Key('need-login'),
                child: new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Text("Have an account? ",
                          style: TextStyle(
                            color: Colors.black54,
                          )),
                      new Text("Login",
                          style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.bold))
                    ]),
                onPressed: moveToLogin)
          ]),
        ];
    }
    return null;
  }

  Widget hintText() {
    return new Container(
        //height: 80.0,
        padding: const EdgeInsets.all(32.0),
        child: new Text(_authHint,
            key: new Key('hint'),
            style: new TextStyle(fontSize: 18.0, color: Colors.grey),
            textAlign: TextAlign.center));
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return loading == true
        ? Loader()
        : Scaffold(
            resizeToAvoidBottomInset: false,
            body: Container(
              height: _height,
              width: _width,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/image/sigin_page.jpeg"),
                    fit: BoxFit.fill),
              ),
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: usernameAndPassword() + submitWidgets(),
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
