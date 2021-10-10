import 'package:flutter/material.dart';
import 'package:visiting_card_contact_class5/models/contact_model.dart';

class ContactDetails extends StatefulWidget {
  static const String routeName='/details';

  @override
  _ContactDetailsState createState() => _ContactDetailsState();
}

class _ContactDetailsState extends State<ContactDetails> {
  @override
  Widget build(BuildContext context) {
    final contact=ModalRoute.of(context)!.settings.arguments as ContactModel;
    print(contact.name);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(contact.name,style: TextStyle(fontSize: 20),),
            Text(contact.designation,style: TextStyle(fontSize: 16),),
          ],
        ),
      ),
    );
  }
}
