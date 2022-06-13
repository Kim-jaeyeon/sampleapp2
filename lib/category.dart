import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sampleapp2/item_list.dart';


class category extends StatefulWidget {
  const category({Key? key}) : super(key: key);

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {

  int _index=0;
  final categories=[bestItem(),timeSale(),basic(),base(),forcolor()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          categryTop(),
          categoryMiddle(),
          categoryBottom(context)
        ],
      ),
    );
  }

  @override
  Widget categryTop() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            decoration: BoxDecoration(
              color: Colors.purple[100],
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
            ),
            width: 500,
            height: 150,
            child: Center(
                child: Text('상품목록',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center))),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }

  @override
  Widget categoryMiddle() {
    return Row(
      children: <Widget>[
        Container(
          width: 100,
          height: 500,
          child: Column(
            children: <Widget>[
              InkWell(
                onTap: () {
                  setState((){
                    _index=0;
                  });
                },
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/icons/positive-vote.png',width:50,height: 50,color: Colors.purple[200],),
                    Text(
                      '베스트 상품',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 30,),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  setState((){
                    _index=1;
                  });
                },
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/icons/coupon.png',width:50,height: 50,color: Colors.purple[200],),
                    Text(
                      '타임세일',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),

              InkWell(
                onTap: () {
                  setState((){
                    _index=2;
                  });
                },
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/icons/skin.png',width:55,height: 55,color: Colors.purple[200],),
                    Text(
                      '기초',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  setState((){
                    _index=3;
                  });
                },
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/icons/foundation.png',width:55,height: 55,color: Colors.purple[200],),
                    Text('베이스',
                        style: GoogleFonts.sacramento(
                          textStyle: TextStyle(fontSize: 15),
                        )),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  setState((){
                    _index=4;
                  });
                },
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/icons/lipstick.png',width:50,height: 50,color: Colors.purple[200],),
                    Text(
                      '색조',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),

            ],
          ),
        ),
        Container(
          width: 311.3,
          height: 500,
          child: categories[_index]
        )
      ],
    );
  }

  @override
  Widget categoryBottom(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

}
@override
Widget bestItem() {
  return Builder(
    builder: (context) {
      return ListView(
        children: <Widget>[
          InkWell(
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>item_list()));
            },
            child: Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 0.5))),
              padding:EdgeInsets.all(10),
              child: Row(
                children: [
                  Text('연간 베스트 상품'),
                  SizedBox(width: 170,),
                  Icon(CupertinoIcons.right_chevron,size: 18,)
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){},
            child: Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 0.5))),
              padding:EdgeInsets.all(10),
              child: Row(
                children: [
                  Text('월간 베스트 상품'),
                  SizedBox(width: 170,),
                  Icon(CupertinoIcons.right_chevron,size: 18,)
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){},
            child: Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(width: 0.5))),
              padding:EdgeInsets.all(10),
              child: Row(
                children: [
                  Text('일간 베스트 상품'),
                  SizedBox(width: 170,),
                  Icon(CupertinoIcons.right_chevron,size: 18,)
                ],
              ),
            ),
          ),
        ],
      );
    }
  );
}

@override
Widget timeSale() {
  return ListView(
    children: <Widget>[
      InkWell(
        onTap: (){},
        child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.5))),
          padding:EdgeInsets.all(10),
          child: Row(
            children: [
              Text('행사 종료 임박 상품'),
              SizedBox(width: 154,),
              Icon(CupertinoIcons.right_chevron,size: 18,)
            ],
          ),
        ),
      ),
      InkWell(
        onTap: (){},
        child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.5))),
          padding:EdgeInsets.all(10),
          child: Row(
            children: [
              Text('반값 세일'),
              SizedBox(width: 212,),
              Icon(CupertinoIcons.right_chevron,size: 18,)
            ],
          ),
        ),
      ),
      InkWell(
        onTap: (){},
        child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.5))),
          padding:EdgeInsets.all(10),
          child: Row(
            children: [
              Text('기간 한정 세일'),
              SizedBox(width: 183,),
              Icon(CupertinoIcons.right_chevron,size: 18,)
            ],
          ),
        ),
      ),
    ],
  );
}

@override
Widget basic() {
  return ListView(
    children: <Widget>[
      InkWell(
        onTap: (){},
        child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.5))),
          padding:EdgeInsets.all(10),
          child: Row(
            children: [
              Text('토너/스킨'),
              SizedBox(width: 210,),
              Icon(CupertinoIcons.right_chevron,size: 18,)
            ],
          ),
        ),
      ),
      InkWell(
        onTap: (){},
        child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.5))),
          padding:EdgeInsets.all(10),
          child: Row(
            children: [
              Text('에센스/앰플/세럼/로션/에멀젼'),
              SizedBox(width: 91,),
              Icon(CupertinoIcons.right_chevron,size: 18,)
            ],
          ),
        ),
      ),
      InkWell(
        onTap: (){},
        child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.5))),
          padding:EdgeInsets.all(10),
          child: Row(
            children: [
              Text('오일/크림류'),
              SizedBox(width: 198,),
              Icon(CupertinoIcons.right_chevron,size: 18,)
            ],
          ),
        ),
      ),
    ],
  );
}

@override
Widget base() {
  return ListView(
    children: <Widget>[
      InkWell(
        onTap: (){},
        child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.5))),
          padding:EdgeInsets.all(10),
          child: Row(
            children: [
              Text('쿠션'),
              SizedBox(width: 242,),
              Icon(CupertinoIcons.right_chevron,size: 18,)
            ],
          ),
        ),
      ),
      InkWell(
        onTap: (){},
        child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.5))),
          padding:EdgeInsets.all(10),
          child: Row(
            children: [
              Text('파운데이션'),
              SizedBox(width: 203,),
              Icon(CupertinoIcons.right_chevron,size: 18,)
            ],
          ),
        ),
      ),
      InkWell(
        onTap: (){},
        child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.5))),
          padding:EdgeInsets.all(10),
          child: Row(
            children: [
              Text('파우더'),
              SizedBox(width: 229,),
              Icon(CupertinoIcons.right_chevron,size: 18,)
            ],
          ),
        ),
      ),
      InkWell(
        onTap: (){},
        child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.5))),
          padding:EdgeInsets.all(10),
          child: Row(
            children: [
              Text('쉐딩'),
              SizedBox(width: 242,),
              Icon(CupertinoIcons.right_chevron,size: 18,)
            ],
          ),
        ),
      ),
      InkWell(
        onTap: (){},
        child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.5))),
          padding:EdgeInsets.all(10),
          child: Row(
            children: [
              Text('블러셔'),
              SizedBox(width: 228,),
              Icon(CupertinoIcons.right_chevron,size: 18,)
            ],
          ),
        ),
      ),
    ],
  );
}

@override
Widget forcolor() {
  return ListView(
    children: <Widget>[
      InkWell(
        onTap: (){},
        child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.5))),
          padding:EdgeInsets.all(10),
          child: Row(
            children: [
              Text('얼굴'),
              SizedBox(width: 242,),
              Icon(CupertinoIcons.right_chevron,size: 18,)
            ],
          ),
        ),
      ),
      InkWell(
        onTap: (){},
        child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.5))),
          padding:EdgeInsets.all(10),
          child: Row(
            children: [
              Text('눈'),
              SizedBox(width: 255,),
              Icon(CupertinoIcons.right_chevron,size: 18,)
            ],
          ),
        ),
      ),
      InkWell(
        onTap: (){},
        child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.5))),
          padding:EdgeInsets.all(10),
          child: Row(
            children: [
              Text('입'),
              SizedBox(width: 255,),
              Icon(CupertinoIcons.right_chevron,size: 18,)
            ],
          ),
        ),
      ),
    ],
  );
}

