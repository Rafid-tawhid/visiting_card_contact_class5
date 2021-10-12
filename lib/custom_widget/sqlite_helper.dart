import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as Path;
import 'package:visiting_card_contact_class5/models/contact_model.dart';

class SQliteHelper{
  static const String _createContactTable='''create table $tblContact(
  $tblContactColId integer primary key autoincrement,
  $tblContactColName text not null,
  $tblContactColCompany text not null,
  $tblContactColDesignation text not null,
  $tblContactColEmail text not null,
  $tblContactColMobile text not null,
  $tblContactColAddress text not null,
  $tblContactColWeb text not null,
  $tblContactColFav integer not null)
  ''';
  static Future<Database> _open() async
  {

    final rootPath = await getDatabasesPath();
    final dbPath = Path.join(rootPath,'contact.db');

    return openDatabase(dbPath,version: 1,onCreate:( db,version) async {

      db.execute(_createContactTable);
    });
  }
  static Future<int> insertNewContact(ContactModel contactModel) async
  {
    final db =await _open();
    return db.insert(tblContact, contactModel.toMap());
  }
  static Future<List<ContactModel>> getAllContacts ()async
  {
    final db =await _open();
    final mapList=await db.query(tblContact);
    return List.generate(mapList.length, (index) => ContactModel.fromMap(mapList[index]));
  }

}