import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
class ScanPage extends StatefulWidget {
  static const String routeName='/scan_page';


  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  List <String> _linesS=[];
  ImageSource _imageSource=ImageSource.camera;
  String? _imgPath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scan Visiting Card"),
        actions: [
          TextButton(onPressed: (){}, child: Text("Next",style: TextStyle(color: Colors.white),),)
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              width: double.maxFinite,
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey,width: 2),
              ),
              child: _imgPath==null ?null:Image.file(File(_imgPath!),fit: BoxFit.cover,),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                _imageSource=ImageSource.camera;
                _pickImage();
              }, child: Text("Camera")),
              SizedBox(width: 10,),
              ElevatedButton(onPressed: (){
                _imageSource=ImageSource.gallery;
                _pickImage();
              }, child: Text("Gallery")),
            ],
          ),
          SizedBox(height: 20,),
          Expanded(
            child: ListView.builder( itemCount: _linesS.length,
                itemBuilder: (context,index) => ListTile(
              title: Text(_linesS[index]),
            )),
          )
        ],
      ),
    );
  }

  void _pickImage() async {
    final pickedFile=await ImagePicker().pickImage(source: _imageSource);
    setState(() {
      _imgPath=pickedFile!.path;
    });

    final testDetector=GoogleMlKit.vision.textDetector();
    final inputImage=InputImage.fromFilePath(_imgPath!);
   final recognisedText= await testDetector.processImage(inputImage);
   print("This is text :"+recognisedText.text);
   var lines=<String>[];
   for(var block in recognisedText.blocks)
     {
       for(var line in block.lines)
         {
           lines.add(line.text);
         }
     }
   setState(() {
     _linesS=lines;
   });

  }
}
