import 'package:flutter/material.dart';

class InboxPage extends StatefulWidget {
  const InboxPage({ Key? key }) : super(key: key);

  @override
  _InboxPageState createState() => _InboxPageState();
}

class _InboxPageState extends State<InboxPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Don't have messages"),
    );
  }
}