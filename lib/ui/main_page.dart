import 'package:examination/bottom_bar/discoverPage.dart';
import 'package:examination/bottom_bar/inboxPage.dart';
import 'package:examination/bottom_bar/profilePage.dart';
import 'package:examination/bottom_bar/secondMainPage.dart';
import 'package:examination/ui/phone_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  int selectedIndex = 0;
  List<Widget>? pageList;
  SecondMainPage? secondMainPage;
  DiscoverPage? discoverPage;
  InboxPage? inboxPage;
  ProfilePage? profilePage;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    secondMainPage = SecondMainPage();
    discoverPage = DiscoverPage();
    inboxPage = InboxPage();
    profilePage = ProfilePage();
    pageList = [secondMainPage!, discoverPage!, inboxPage!, profilePage!];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          pageList![selectedIndex],
          Positioned(
            bottom: 0.0,
            right: 0.0,
            left: 0.0,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 20.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 7.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40.0),
                  child: BottomNavigationBar(
                    selectedIconTheme: IconThemeData(color: Colors.deepPurple),
                    unselectedIconTheme: IconThemeData(color: Colors.black),
                    selectedItemColor: Colors.deepPurple,
                    type: BottomNavigationBarType.fixed,
                    currentIndex: selectedIndex,
                    onTap: (itemValue) {
                      setState(() {
                        selectedIndex = itemValue;
                      });
                    },
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: "Home",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.airplanemode_off),
                        label: "Discover",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.mail),
                        label: "Inbox",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: "Profile",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _auth.signOut();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PhoneAuth()),
          );
        },
      ),
    );
  }
}

class Initialize extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return InitializeState();
  }
}

class InitializeState extends State<Initialize> {
  FirebaseAuth? _auth;
  User? _user;

  bool? isLoading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _auth = FirebaseAuth.instance;
    _user = _auth!.currentUser;
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return isLoading!
        ? Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : _user == null
            ? PhoneAuth()
            : MainPage();
  }
}
