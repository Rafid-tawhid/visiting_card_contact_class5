import 'package:flutter/material.dart';
import 'package:visiting_card_contact_class5/models/contact_model.dart';
import 'package:visiting_card_contact_class5/pages/contact_details_page.dart';


class ContactRowItem extends StatefulWidget {

  final ContactModel contact;


  ContactRowItem(this.contact);

  @override
  _ContactRowItemState createState() => _ContactRowItemState();
}

class _ContactRowItemState extends State<ContactRowItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Card(
        elevation: 5,
        child: ListTile(
          onTap: (){
            Navigator.pushNamed(context, ContactDetails.routeName,arguments: widget.contact);
          },
          title: Text(widget.contact.name),
          tileColor: Colors.white,
          subtitle: Text(widget.contact.designation),
          leading: CircleAvatar(),
          trailing: Icon(widget.contact.isFav?Icons.favorite:Icons.favorite_border_rounded,color: Colors.red,),
        ),
      ),
    );
  }
}
