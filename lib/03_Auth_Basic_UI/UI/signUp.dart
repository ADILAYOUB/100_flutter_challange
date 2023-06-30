// ignore: file_names
import '../header.dart';

import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        Container(
          color: Colors.indigo[100],
          child: Column(
            children: const [Signup()],
          ),
        ),
      ],
    ));
  }
}

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Header(),
        Positioned.fill(
          top: 160.0,
          child: Center(
            child: SignupCard(),
          ),
        ),
      ],
    );
  }
}

class SignupCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 320, maxHeight: 400),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          color: Colors.white),
      padding: const EdgeInsets.fromLTRB(0.0, 32.0, 0.0, 0.0),
      margin: const EdgeInsetsDirectional.fromSTEB(32.0, 0.0, 32.0, 0.0),
      child: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 6.0),
            child: Text("SALAM ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.indigo,
                  fontSize: 18.0,
                )),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 0.0),
            child: Text("Authentication ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 14.0,
                )),
          ),
          const Padding(
              padding: EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 2.0),
              child: TextField(
                autofocus: true,
                keyboardType: TextInputType.text,
                autocorrect: false,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                    labelText: "Full Name",
                    hintText: "Name",
                    labelStyle: TextStyle(color: Colors.black38),
                    fillColor: Colors.black87),
                style: TextStyle(color: Colors.black87),
              )),
          const Padding(
              padding: EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 0.0),
              child: TextField(
                autofocus: true,
                keyboardType: TextInputType.number,
                autocorrect: false,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                    labelText: "Mobile Number",
                    hintText: "Number",
                    labelStyle: TextStyle(color: Colors.black38),
                    fillColor: Colors.black87),
                style: TextStyle(color: Colors.black87),
              )),
          const Padding(
              padding: EdgeInsets.fromLTRB(32.0, 0.0, 32.0, 2.0),
              child: TextField(
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(
                    labelText: "Enter Email",
                    hintText: "Email",
                    labelStyle: TextStyle(color: Colors.black38),
                    fillColor: Colors.black87),
                style: TextStyle(color: Colors.black87),
              )),
          Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 32.0, 0.0, 0.0),
              child: ButtonTheme(
                minWidth: 320,
                child: MaterialButton(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16.0),
                          bottomRight: Radius.circular(16.0)),
                    ),
                    color: Colors.indigo,
                    textColor: Colors.white,
                    disabledColor: Colors.black12,
                    disabledTextColor: Colors.black26,
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    splashColor: Colors.indigoAccent,
                    elevation: 2.0,
                    onPressed: () {},
                    child: const Text("GET OTP",
                        style: TextStyle(fontSize: 14.0))),
              )),
        ],
      ),
    );
  }
}
