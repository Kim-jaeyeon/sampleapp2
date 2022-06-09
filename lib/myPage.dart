import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:sampleapp2/main.dart';

class myPage extends StatefulWidget {
  const myPage({Key? key}) : super(key: key);

  @override
  State<myPage> createState() => _myPageState();
}

class _myPageState extends State<myPage> {
  var _mainpage = MyHomePage(title: 'appSample');

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
                  child: Icon(
                    CupertinoIcons.profile_circled,
                    color: Colors.white,
                    size: 120,
                    shadows: [
                      Shadow(
                          color: Colors.grey,
                          offset: Offset(2, 4),
                          blurRadius: 40)
                    ],
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
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                'jaeyeon',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: InkWell(
                onTap: () {},
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

  @override
  Widget myPageMiddle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          onTap: (){},
          child: Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 0.5)),
              ),
              width: 500,
              height: 50,
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Icon(CupertinoIcons.heart_fill,color: Colors.grey,size:25,),
                  SizedBox(width: 10,),
                  Text('위시리스트',
                      style: GoogleFonts.notoSansNKo(
                        textStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      textAlign: TextAlign.left),
                  SizedBox(width: 250,),
                  Icon(CupertinoIcons.right_chevron,color: Colors.grey,)
                ],
              )),
        ),InkWell(
          onTap: (){},
          child: Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 0.5)),
              ),
              width: 500,
              height: 50,
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Icon(CupertinoIcons.cart_fill,color: Colors.grey,size:25,),
                  SizedBox(width: 10,),
                  Text('주문내역',
                      style: GoogleFonts.notoSansNKo(
                        textStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      textAlign: TextAlign.left),
                  SizedBox(width: 265,),
                  Icon(CupertinoIcons.right_chevron,color: Colors.grey,)
                ],
              )),
        ),
        InkWell(
          onTap: (){},
          child: Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 0.5)),
              ),
              width: 500,
              height: 50,
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Icon(CupertinoIcons.heart_fill,color: Colors.grey,size:25,),
                  SizedBox(width: 10,),
                  Text('위시리스트',
                      style: GoogleFonts.notoSansNKo(
                        textStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      textAlign: TextAlign.left),
                  SizedBox(width: 250,),
                  Icon(CupertinoIcons.right_chevron,color: Colors.grey,)
                ],
              )),
        ),
        InkWell(
          onTap: (){},
          child: Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 0.5)),
              ),
              width: 500,
              height: 50,
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Icon(CupertinoIcons.heart_fill,color: Colors.grey,size:25,),
                  SizedBox(width: 10,),
                  Text('위시리스트',
                      style: GoogleFonts.notoSansNKo(
                        textStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      textAlign: TextAlign.left),
                  SizedBox(width: 250,),
                  Icon(CupertinoIcons.right_chevron,color: Colors.grey,)
                ],
              )),
        ),
        InkWell(
          onTap: (){},
          child: Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 0.5)),
              ),
              width: 500,
              height: 50,
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Icon(CupertinoIcons.heart_fill,color: Colors.grey,size:25,),
                  SizedBox(width: 10,),
                  Text('위시리스트',
                      style: GoogleFonts.notoSansNKo(
                        textStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      textAlign: TextAlign.left),
                  SizedBox(width: 250,),
                  Icon(CupertinoIcons.right_chevron,color: Colors.grey,)
                ],
              )),
        ),
        InkWell(
          onTap: (){},
          child: Container(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 0.5)),
              ),
              width: 500,
              height: 50,
              child: Row(
                children: [
                  SizedBox(width: 10,),
                  Icon(CupertinoIcons.gear_alt_fill,color: Colors.grey,size:25,),
                  SizedBox(width: 10,),
                  Text('환경설정',
                      style: GoogleFonts.notoSansNKo(
                        textStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                      ),
                      textAlign: TextAlign.left),
                  SizedBox(width: 250,),
                  Icon(CupertinoIcons.right_chevron,color: Colors.grey,)
                ],
              )),
        ),

      ],
    );
  }
}
