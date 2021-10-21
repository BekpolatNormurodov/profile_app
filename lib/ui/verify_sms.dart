import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main_page.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class VerifySms extends StatefulWidget {
  String verificationId;
  VerifySms(this.verificationId);
  @override
  State<StatefulWidget> createState() {
    return VerifySmsState();
  }
}

class VerifySmsState extends State<VerifySms> {
  String? email;
  String? password;
  var _formKey = GlobalKey<FormState>();
  TextEditingController smsCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://i.ya-webdesign.com/images/wave-clip-border-14.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 80.0, top: 30.0),
                    child: IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: Icon(
                        Icons.arrow_back,
                        size: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30.0,
                    ),
                    child: Text(
                      "Welcome\nBack",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 50.0,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.w200),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 50.0, right: 50.0, bottom: 50.0),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    SizedBox(height: 50.0),
                    TextFormField(
                      controller: smsCode,
                      validator: (text) {
                        if (text!.length < 4) {
                          return "Must be at least 4 sign";
                        }
                      },
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        labelText: "Password",
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w800,
                          fontSize: 17.0,
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 30.0,
                  ),
                  Text(
                    "Sign In",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 30.0,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(width: 200.0),
                  ElevatedButton(
                    onPressed: () async {
                      await _phoneVerify(context);
                    },
                    child: Icon(Icons.arrow_forward),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey.shade800,
                      fixedSize: Size(100.0, 100.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _phoneVerify(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: widget.verificationId, smsCode: smsCode.text);
      var _authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);
      if (_authCredential.user != null) {
        await Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
        );
      }
    }
  }
}
