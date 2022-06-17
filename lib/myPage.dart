
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sampleapp2/orderedlist.dart';
import 'package:sampleapp2/personal_info.dart';
import 'package:sampleapp2/qna.dart';
import 'package:sampleapp2/wishlist.dart';
import 'package:sampleapp2/information/Person.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


import 'package:sampleapp2/main.dart';

class myPage extends StatefulWidget {
  const myPage({Key? key}) : super(key: key);

  @override
  State<myPage> createState() => _myPageState();
}

class _myPageState extends State<myPage> {
  var _mainpage = MyHomePage(title: 'appSample');
  final _nameTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  var _name = '';

  @override
  void dispose(){
    super.dispose();
    _nameTextController.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: ListView(
        children: [myPageTop(), myPageMiddle()],
      ),
    );
  }




  @override
  Widget myPageTop() {
    Person user=Person('name', 'nickname', 0, 'gender', 'adress');
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('user_info').snapshots(),
      builder: (context, snapshot) {

        return Container(
            decoration: BoxDecoration(
              color: Colors.purple[100],
            ),
            width: 500,
            height: 200,
            child: Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, top: 30, bottom: 10),
                      child: Image.asset(
                        'assets/basic_profile.png',
                        width: 130,
                        height: 110,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        '    프로필 사진 변경하기',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
                Container(
                  height: 100,
                  width: 200,
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding:
                          EdgeInsets.only(left: 15, top: 10, right: 10, bottom: 15),
                      child: TextFormField(

                        decoration: InputDecoration(
                          hintText: user.getName(),
                          hintStyle: TextStyle(fontSize: 40, color: Colors.white),
                        ),
                        controller: _nameTextController,
                        validator: (value) {
                          if (value.toString().trim().isEmpty ||
                              value.toString().trim().length < 3) {
                            return '최소 3글자이어야 해요!';
                          } else {
                            setState(() {
                              _name = value.toString();
                              user.setName(_name);
                              print(user.getName() + "!!!!");
                            });
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 10),
                  child: InkWell(
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        Get.snackbar('닉네임', '변경 완료!',snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.white,barBlur: 40);
                      }
                    },
                    child: Icon(
                      CupertinoIcons.pencil,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                )
              ],
            ));
      }
    );
  }

  @override
  Widget myPageMiddle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context, CupertinoPageRoute(builder: (context) => wishlist()));
          },
          child: Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 0.5)),
              ),
              width: 500,
              height: 50,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    CupertinoIcons.heart_fill,
                    color: Colors.grey,
                    size: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('위시리스트',
                      style: GoogleFonts.notoSansNKo(
                        textStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      textAlign: TextAlign.left),
                  SizedBox(
                    width: 235,
                  ),
                  Icon(
                    CupertinoIcons.right_chevron,
                    color: Colors.purple[100],
                  )
                ],
              )),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (context) => orderedlist()));
          },
          child: Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 0.5)),
              ),
              width: 500,
              height: 50,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    CupertinoIcons.cart_fill,
                    color: Colors.grey,
                    size: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('주문내역',
                      style: GoogleFonts.notoSansNKo(
                        textStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      textAlign: TextAlign.left),
                  SizedBox(
                    width: 250,
                  ),
                  Icon(
                    CupertinoIcons.right_chevron,
                    color: Colors.purple[100],
                  )
                ],
              )),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (context) => personal_info()));
          },
          child: Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 0.5)),
              ),
              width: 500,
              height: 50,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    CupertinoIcons.lock_fill,
                    color: Colors.grey,
                    size: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('개인정보',
                      style: GoogleFonts.notoSansNKo(
                        textStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      textAlign: TextAlign.left),
                  SizedBox(
                    width: 250,
                  ),
                  Icon(
                    CupertinoIcons.right_chevron,
                    color: Colors.purple[100],
                  )
                ],
              )),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context, CupertinoPageRoute(builder: (context)=>qna()));
          },
          child: Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 0.5)),
              ),
              width: 500,
              height: 50,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    CupertinoIcons.question,
                    color: Colors.grey,
                    size: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('Q&A',
                      style: GoogleFonts.notoSansNKo(
                        textStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      textAlign: TextAlign.left),
                  SizedBox(
                    width: 280,
                  ),
                  Icon(
                    CupertinoIcons.right_chevron,
                    color: Colors.purple[100],
                  )
                ],
              )),
        ),
        InkWell(
          onTap: () {},
          child: Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 0.5)),
              ),
              width: 500,
              height: 50,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    CupertinoIcons.info_circle_fill,
                    color: Colors.grey,
                    size: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('공지사항',
                      style: GoogleFonts.notoSansNKo(
                        textStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      textAlign: TextAlign.left),
                  SizedBox(
                    width: 250,
                  ),
                  Icon(
                    CupertinoIcons.right_chevron,
                    color: Colors.purple[100],
                  )
                ],
              )),
        ),
        InkWell(
          onTap: () {},
          child: Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 0.5)),
              ),
              width: 500,
              height: 50,
              child: Row(
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    CupertinoIcons.gear_alt_fill,
                    color: Colors.grey,
                    size: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text('환경설정',
                      style: GoogleFonts.notoSansNKo(
                        textStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      textAlign: TextAlign.left),
                  SizedBox(
                    width: 250,
                  ),
                  Icon(
                    CupertinoIcons.right_chevron,
                    color: Colors.purple[100],
                  )
                ],
              )),
        ),
      ],
    );
  }
}
