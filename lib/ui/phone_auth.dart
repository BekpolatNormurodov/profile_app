import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'verify_sms.dart';

FirebaseAuth _auth = FirebaseAuth.instance;

class PhoneAuth extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return PhoneAuthState();
  }
}

class PhoneAuthState extends State<PhoneAuth> {
  String? email;
  String? phone;
  var _formKey = GlobalKey<FormState>();
  String? verificationId;

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((event) {
      if (event == null) {
        print("User signed out ");
      } else {
        print("User signed up");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://i.pinimg.com/originals/f5/bd/1c/f5bd1c80c92b3eab564da19ee2bba886.jpg",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 250.0, top: 100.0),
                child: Text(
                  "Create\nAccount",
                  style: TextStyle(
                      fontSize: 45.0,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.w200,
                      color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      SizedBox(height: 100.0),
                      TextFormField(
                        validator: (text) {
                          if (text!.length < 4) {
                            return "Must be at lesat 4 sign";
                          }
                        },
                        onSaved: (text) {
                          email = text;
                        },
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: "Username",
                          labelStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 17.0,
                          ),
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 50.0),
                      TextFormField(
                        onSaved: (text) {
                          phone = text;
                        },
                        keyboardType: TextInputType.phone,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        initialValue: "+998",
                        maxLength: 13,
                        decoration: InputDecoration(
                          hintText: "Phone Number",
                          hintStyle: TextStyle(
                            color: Colors.white,
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
                padding: const EdgeInsets.only(top: 200.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 30.0,
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 200.0),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          await _auth.verifyPhoneNumber(
                            phoneNumber: phone!,
                            verificationCompleted: (phoneAuthCredential) {},
                            verificationFailed: (firebaseAuthException) {},
                            codeSent: (verificationId, resendToken) async {
                              setState(() {
                                this.verificationId = verificationId;
                              });
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      VerifySms(verificationId),
                                ),
                              );
                            },
                            codeAutoRetrievalTimeout: (verificationId) {},
                          );
                        }
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
