import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewContactPage extends StatefulWidget {
  static const String routeName='/new_contact';

  @override
  _NewContactPageState createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Contact"),
      ),
    );
  }
}
