import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';


final dummyItems=<String>[
  'assets/joe.jpeg',
  'assets/joesae.jpeg',
  'assets/IU.jpeg',
  'assets/glasses.jpeg',
  'assets/gliter.jpeg'
];


class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  final _searchTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _searchTextController.addListener(_printLatestValue);
  }

  _printLatestValue() {
    print('search_text field: ${_searchTextController.text}');
  }

  @override
  void dispose() {
    super.dispose();
    _searchTextController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          searchTop(),
          SizedBox(height: 30,),
          searchMiddle(),
          searchBottom(),
        ],
      ),
    );
  }


  @override
  Widget searchTop(){
    return Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Container(
                  height: 100,
                  width:300,
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding:
                      EdgeInsets.only(left: 10, top: 30, right: 30, bottom: 30),
                      child: TextFormField(
                        decoration: InputDecoration(hintText: '검색어를 입력해주세요'),
                        controller: _searchTextController,
                        validator: (value) {
                          if (value.toString().trim().isEmpty) {
                            return '검색어를 1글자 이상 입력해주세요!';
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                ),
                CupertinoButton(
                  color: Colors.purple[200],
                  child: Text('검색'),
                  padding: EdgeInsets.only(left: 35, right: 35),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      print('need 1 word at least');
                    }
                  },
                ),
              ],
            ),
          ],
        );
  }

  @override
  Widget searchMiddle(){
    return Column(
      children: [
        Text('오늘의 소식-!',style:GoogleFonts.notoSansNKo(textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 30))),
        SizedBox(
          height: 20,
        ),
        CarouselSlider(
          options: CarouselOptions(height:150.0, autoPlay: true,enlargeCenterPage: true,), //높이 400
          items: dummyItems.map((url) {
            //5페이지
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context)
                        .size
                        .width, //context를 사용하고자 할 때, 기기의 가로 길이
                    margin: EdgeInsets.symmetric(horizontal: 2.0), //좌우여백 5
                    decoration: const BoxDecoration(color: Colors.white //배경색
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        url,
                        fit: BoxFit.cover,
                      ),
                    ));
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  @override
  Widget searchBottom(){
    return Column(
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        InkWell(
          onTap: (){},
          child: Container(
            decoration: BoxDecoration(border: Border(top: BorderSide(width: 1,color: Colors.grey))),
            height: 125,
            child: Row(
              children: <Widget>[
                Image.asset('assets/joe.jpeg',width: 100,height: 100,),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text('조이현, 다채로운 매력!',style: GoogleFonts.notoSansNKo(textStyle: TextStyle(fontWeight: FontWeight.bold),)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,top: 10),
                      child: Text('#루이드 #화보 #조이현 #봄',style: TextStyle(color: Colors.grey),),
                    ),

                  ],
                ),
                SizedBox(width: 90,),
                Icon(CupertinoIcons.right_chevron,size: 40,color: Colors.purple[200],)
              ],
            ),
          ),
        ),
        InkWell(
          onTap: (){},
          child: Container(
            decoration: BoxDecoration(border: Border(top: BorderSide(width: 1,color: Colors.grey))),
            height: 125,
            child: Row(
              children: <Widget>[
                Image.asset('assets/glasses.jpeg',width: 99,height: 100,),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text('스타일의 완성, 안경에서부터',style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,top: 10),
                      child: Text('#남성미 #악세사리 #안경 #시크함',style: TextStyle(color: Colors.grey),),
                    ),

                  ],
                ),
                SizedBox(width: 50,),
                Icon(CupertinoIcons.right_chevron,size: 40,color: Colors.purple[200],)
              ],
            ),
          ),
        ),
        InkWell(
          onTap: (){},
          child: Container(
            decoration: BoxDecoration(border: Border(top: BorderSide(width: 1,color: Colors.grey))),
            height: 125,
            child: Row(
              children: <Widget>[
                Image.asset('assets/joesae.jpeg',width: 100,height: 100,),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text('조세호, 매끈한 피부로 광고 데뷔!     ',style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,top: 10),
                      child: Text('#조세호 #수분크림 #피부미남 #피부관리 ',style: TextStyle(color: Colors.grey),),
                    ),

                  ],
                ),
                SizedBox(width: 10,),
                Icon(CupertinoIcons.right_chevron,size: 40,color: Colors.purple[200],)
              ],
            ),
          ),
        ),
        InkWell(
          onTap: (){},
          child: Container(
            decoration: BoxDecoration(border: Border(top: BorderSide(width: 1,color: Colors.grey))),
            height: 125,
            child: Row(
              children: <Widget>[
                Image.asset('assets/lee.jpeg',width: 110,height: 100,),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10,top: 30),
                      child: Text('이은재의 청순해보이는 화장법?',style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,top: 10),
                      child: Text('#스냅사진 #배우 #이은재 #청순',style: TextStyle(color: Colors.grey),),
                    ),

                  ],
                ),
                SizedBox(width: 50,),
                Icon(CupertinoIcons.right_chevron,size: 40,color: Colors.purple[200],)
              ],
            ),
          ),
        ),
        InkWell(
          onTap: (){},
          child: Container(
            decoration: BoxDecoration(border: Border(top: BorderSide(width: 1,color: Colors.grey))),
            height: 125,
            child: Row(
              children: <Widget>[
                Image.asset('assets/lipstick.jpeg',width: 100,height: 100,),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10,top: 30),
                      child: Text('블랙핑크 리사, 매력적인 입술',style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,top: 10),
                      child: Text('#블랙핑크 #리사 #맥립스틱 #맥',style: TextStyle(color: Colors.grey),),
                    ),

                  ],
                ),
                SizedBox(width: 60,),
                Icon(CupertinoIcons.right_chevron,size: 40,color: Colors.purple[200],)
              ],
            ),
          ),
        ),
        InkWell(
          onTap: (){},
          child: Container(
            decoration: BoxDecoration(border: Border(top: BorderSide(width: 1,color: Colors.grey))),
            height: 125,
            child: Row(
              children: <Widget>[
                Image.asset('assets/IU.jpeg',width: 100,height: 100,),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text('아이유가 애정하는 목걸이?',style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,top: 10),
                      child: Text('#아이유 #화보 #목걸이 #우아함',style: TextStyle(color: Colors.grey),),
                    ),

                  ],
                ),
                SizedBox(width: 60,),
                Icon(CupertinoIcons.right_chevron,size: 40,color: Colors.purple[200],)
              ],
            ),
          ),
        ),
        InkWell(
          onTap: (){},
          child: Container(
            decoration: BoxDecoration(border: Border(top: BorderSide(width: 1,color: Colors.grey))),
            height: 125,
            child: Row(
              children: <Widget>[
                Image.asset('assets/eyebrow.jpeg',width: 100,height: 100,),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text('아이브로우, 이제는 편하게 그리자!',style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10,top: 10),
                      child: Text('#아이브로우 #유니섹스 #원터치 #펜슬',style: TextStyle(color: Colors.grey),),
                    ),

                  ],
                ),
                SizedBox(width: 20,),
                Icon(CupertinoIcons.right_chevron,size: 40,color: Colors.purple[200],)
              ],
            ),
          ),
        ),
      ],
    );
  }
}
