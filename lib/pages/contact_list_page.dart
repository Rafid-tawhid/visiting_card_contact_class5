
import 'package:flutter/material.dart';
import 'package:visiting_card_contact_class5/custom_widget/contact_row_item.dart';
import 'package:visiting_card_contact_class5/db/temp_db.dart';
import 'package:visiting_card_contact_class5/pages/new_contact_page.dart';

class ContactListPage extends StatefulWidget {

  static const String routeName='/';

  @override
  _ContactListPageState createState() => _ContactListPageState();
}

class _ContactListPageState extends State<ContactListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Contact List"),),
      body:contactList.isEmpty?const Center(child: Text("No Contact Found.."),): ListView.builder(
        itemCount: contactList.length,
        itemBuilder: (context,index)
        {
          final contacts=contactList[index];
          return ContactRowItem(contacts);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
         final status= await Navigator.pushNamed(context, NewContactPage.routeName);
         print('something');
         if(status != null)
           {
             if(status is bool)
               {
                 setState(() {

                 });
               }
           }

        },
        child: Icon(Icons.add),

      ),
    );
  }
}
