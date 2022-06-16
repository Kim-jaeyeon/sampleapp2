import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class cameraPage extends StatefulWidget {
  const cameraPage({Key? key}) : super(key: key);

  @override
  State<cameraPage> createState() => _cameraPageState();
}

class _cameraPageState extends State<cameraPage> {
  File _image=File('/document/image:19');

  @override
  void initState(){
    getImage(ImageSource.gallery);
    super.initState();
  }

  void dispose(){
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          SizedBox(height: 200,),
          showImg(),
        ],
      ),
    );
  }

  Widget showImg(){
    if(_image==null){
      return Container();
    }
    else{
      return Image.file(_image,width: 200,height: 200,);
    }
  }

  Future getImage(ImageSource imageSource)async{
    var image=await ImagePicker.platform.pickImage(source: imageSource);

    setState((){
      _image=image as File;
    });
  }



}
