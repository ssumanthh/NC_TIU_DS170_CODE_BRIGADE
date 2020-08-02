import 'package:fillme/widgets/munci.dart';
import 'package:flutter/material.dart';

import '../widgets/entry.dart';
import 'login_page.dart';
import 'auth.dart';

AuthStatus authStatus = AuthStatus.notSignedIn;

class RootPage extends StatefulWidget {
  RootPage({Key key, this.auth, this.st}) : super(key: key);
  final BaseAuth auth;
  final String st;

  @override
  State<StatefulWidget> createState() => new _RootPageState();
}

enum AuthStatus {
  notSignedIn,
  signedIn,
  municipal,
}

class _RootPageState extends State<RootPage> {
  initState() {
    super.initState();
    widget.auth.currentUser().then((userId) {
      widget.auth.currentUser().then((email) {
        print(email);
        setState(() {
          if (userId != null) {
            if (email == '1xIVAImkgDPY2KIkfhPJ3kNxbNw2') {
              authStatus = AuthStatus.municipal;
            } else {
              authStatus = AuthStatus.signedIn;
            }
          } else {
            authStatus = AuthStatus.notSignedIn;
          }
        });
      });
    });
  }

  void _updateAuthStatus(AuthStatus status) {
    if (status != AuthStatus.notSignedIn) {
      widget.auth.currentUser().then((email) {
        print(email);
        setState(() {
         authStatus = email == '1xIVAImkgDPY2KIkfhPJ3kNxbNw2'
             ?  AuthStatus.municipal
              :AuthStatus.signedIn;
        });
      });
    } else {
      setState(() {
        authStatus = AuthStatus.notSignedIn;
      });
    }
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.notSignedIn:
        {
          return new LoginPage(
            title: ' Login',
            auth: widget.auth,
            type: widget.st,
            onSignIn: () => _updateAuthStatus(AuthStatus.signedIn),
          );
        }
      case AuthStatus.signedIn:
        {
          return new EntryPage(
              selectedIndex: 0,
              auth: widget.auth,
              onSignOut: () => _updateAuthStatus(AuthStatus.notSignedIn),
              );
        }
      case AuthStatus.municipal:
        {
          return new Municipale();
        }
    }
  }
}
