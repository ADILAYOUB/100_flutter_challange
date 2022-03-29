import 'package:flutter/material.dart';

import '../model/loginRequest.dart';

class loginScreen extends StatefulWidget {

  const loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  //Global key: GlobalKey<FormState> _key in Form => attribute to access form state to save, validate, and reset.
   GlobalKey<FormState> _key = GlobalKey();
   bool _validation = false;
  // For String email and password
  LoginRequestData _loginRequestData = LoginRequestData();
  // To hide an entered password in a TextField/TextFormField, just set its obscureText property to true
   bool _obscureText  = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Center(
          child: Form(
            key: _key,
            //Autovalidate: We pass bool _validate in Form If true, form fields will validate and update
            // their error text immediately after every change.
            // Otherwise, you must call FormState.validate to validate.
           // autovalidate: _validation,
            child: _get_FormUI(),
          ),
        ),
      ),
    );
  }

  Widget _get_FormUI() {
    return  Column(
      children: <Widget>[
        Icon(
          Icons.person,
          color: Colors.lightBlue,
          size: 100.0,
        ),
         SizedBox(height: 50.0),
         TextFormField(
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          decoration: InputDecoration(
            hintText: 'Email',
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          ),
          // validator: FormValidator().validateEmail,
          // onSaved: (String value) {
          //   _loginData.email = value;
          // },
        ),
         const SizedBox(height: 20.0),
         TextFormField(
            autofocus: false,
            obscureText: _obscureText,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: 'Password',
              contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  semanticLabel:
                  _obscureText ? 'show password' : 'hide password',
                ),
              ),
            ),
            // validator: FormValidator().validatePassword,
            // onSaved: (String value) {
            //   _loginData.password = value;
            // }
            ),
        const SizedBox(height: 15.0),
         Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          // ignore: deprecated_member_use
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            onPressed:(){},
            //_sendToServer,
            padding: const EdgeInsets.all(12),
            color: Colors.lightBlueAccent,
            child: const Text('Log In', style: TextStyle(color: Colors.white)),
          ),
        ),
         // ignore: deprecated_member_use
         FlatButton(
          child:const  Text(
            'Forgot password?',
            style: TextStyle(color: Colors.black54),
          ),
          onPressed:(){}
          //_showForgotPasswordDialog,
        ),
         // ignore: deprecated_member_use
         FlatButton(
          onPressed: _sendToRegisterPage,
          child: const Text('Not a member? Sign up now',
              style: TextStyle(color: Colors.black54)),
        ),
      ],
    );
  }

  _sendToRegisterPage() {
    ///Go to register page
  }

  // _sendToServer() {
  //   if (_key.currentState.validate()) {
  //     /// No any error in validation
  //     _key.currentState.save();
  //     print("Email ${_loginData.email}");
  //     print("Password ${_loginData.password}");
  //   } else {
  //     ///validation error
  //     setState(() {
  //       _validate = true;
  //     });
  //   }
  // }
  //
  // Future<Null> _showForgotPasswordDialog() async {
  //   await showDialog<String>(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return new AlertDialog(
  //           title: const Text('Please enter your eEmail'),
  //           contentPadding: EdgeInsets.all(5.0),
  //           content: new TextField(
  //             decoration: new InputDecoration(hintText: "Email"),
  //             onChanged: (String value) {
  //               _loginData.email = value;
  //             },
  //           ),
  //           actions: <Widget>[
  //             new FlatButton(
  //               child: new Text("Ok"),
  //               onPressed: () async {
  //                 _loginData.email = "";
  //                 Navigator.pop(context);
  //               },
  //             ),
  //             new FlatButton(
  //               child: new Text("Cancel"),
  //               onPressed: () => Navigator.pop(context),
  //             ),
  //           ],
  //         );
  //       });
  // }
}


