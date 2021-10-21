import 'dart:io';
import 'package:examination/ui/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'database/database_helper.dart';
import 'error_page.dart';
import 'model/picture.dart';
import 'model/saved_picture.dart';

final Future<FirebaseApp> _initfirebase = Firebase.initializeApp();

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initfirebase,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Initialize();
        } else if (snapshot.hasError) {
          return ErrorPage();
        }
        return Scaffold(
          body: Platform.isAndroid
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: CupertinoActivityIndicator(),
                ),
        );
      },
    );
  }
}
