import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fillme/widgets/loader.dart';

abstract class BaseAuth {
  Future<String> currentUseremail();
  Future<String> currentUser();
  Future<String> signIn(String email, String password);
  Future<String> createUser(String name, String email, String password);
  Future<void> signOut();
  Future<String> signinWithGoogle();
  Future<void> signOutGoogle();
}

class Auth implements BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final CollectionReference username = Firestore.instance.collection('name');
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Future<String> signIn(String email, String password) async {
    final FirebaseUser user = (await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password))
        .user;
    return user.uid;
  }

  Future<String> createUser(String name, String email, String password) async {
    final AuthResult result = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    await username.document(user.uid).setData({'username': name});
    return user.uid;
  }

  Future<String> signinWithGoogle() async {
    Loader();
    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final AuthResult authResult =
        await _firebaseAuth.signInWithCredential(credential);
    final FirebaseUser user = authResult.user;

    assert(!user.isAnonymous);
    assert(await user.getIdToken() != null);

    return 'signInWithGoogle succeeded: $user';
  }

  @override
  Future<String> currentUser() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user != null ? user.uid : null;
  }

  Future<String> currentUseremail() async {
    FirebaseUser user = await _firebaseAuth.currentUser();
    return user != null ? user?.email : null;
  }

  Future<void> signOutGoogle() async {
    await googleSignIn.signOut();

    print("User Sign Out");
  }

  @override
  Future<void> signOut() async {
    return _firebaseAuth.signOut();
  }
}
