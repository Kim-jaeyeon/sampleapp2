import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';


import 'package:sampleapp2/category.dart';
import 'package:sampleapp2/cameraPage.dart';
import 'package:sampleapp2/myPage.dart';
import 'package:sampleapp2/search.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final dummyItems = [
  'assets/beready.jpeg',
  'assets/eyebrow.jpeg',
  'assets/lee.jpeg',
  'assets/lipstick.jpeg',
  'assets/lipstick2.jpeg',
];

void main() async{

  WidgetsBinding widgetsBinding=WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme:
            GoogleFonts.notoSansNKoTextTheme(Theme.of(context).textTheme),
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'appSample2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _index = 3;
  final _bottomPage = [
    category(),
    search(),
    cameraPage(),
    mainPage(),
    myPage(),
  ];



  @override
  Widget build(BuildContext context) {


    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //as
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: _bottomPage[_index],
      bottomNavigationBar: ConvexAppBar(
        initialActiveIndex: 3,
        style: TabStyle.reactCircle,
        onTap: (index) {
          setState(() {
            _index=index;
          });
        },

        height: 55,
        backgroundColor: Colors.purple[100],
        activeColor: Colors.purple[100],
        color: Colors.white,
        items: [
          TabItem(
              activeIcon: Icon(
                CupertinoIcons.list_bullet_indent,
                color: Colors.white,
                size: 30,
              ),
              icon: Icon(
                CupertinoIcons.list_bullet,
                color: Colors.white,
                size: 20,
              ),
              title: '????????????'),
          TabItem(
              activeIcon: Icon(
                CupertinoIcons.search_circle_fill,
                color: Colors.white,
                size: 40,
              ),
              icon: Icon(
                CupertinoIcons.search,
                color: Colors.white,
                size: 20,
              ),
              title: '??????'),
          TabItem(
              activeIcon: Icon(
                CupertinoIcons.bag_fill,
                color: Colors.white,
                size: 30,
              ),
              icon: Icon(
                CupertinoIcons.bag,
                color: Colors.white,
                size: 20,
              ),
              title: '?????????'),
          TabItem(
              activeIcon: Icon(
                CupertinoIcons.house_fill,
                color: Colors.white,
                size: 30,
              ),
              icon: Icon(
                CupertinoIcons.home,
                color: Colors.white,
                size: 20,
              ),
              title: '???'),
          TabItem(
              activeIcon: Icon(
                CupertinoIcons.person_alt_circle,
                color: Colors.white,
                size: 40,
              ),
              icon: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
                size: 20,
              ),
              title: '???????????????'),
        ],
      ),
    );
  }
}

class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  State<mainPage> createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 80,
          ),
          MainTop(),
          MainMiddle(),
          MainBottom()
        ],
      ),
    );
  }

  @override
  Widget MainTop() {
    String name = 'jaeyeon';
    return Column(
      children: <Widget>[
        Text(
          '${name}???,',
          style: TextStyle(fontSize: 40),
        ),
        Text(
          '???????????????!',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 40,
        )
      ],
    );
  }

  @override
  Widget MainMiddle() {
    return CarouselSlider(
      options: CarouselOptions(
          height: 400.0, autoPlay: true, enlargeCenterPage: true), //?????? 400
      items: dummyItems.map((url) {
        //5?????????
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context)
                    .size
                    .width, //context??? ??????????????? ??? ???, ????????? ?????? ??????
                margin: EdgeInsets.symmetric(horizontal: 5.0), //???????????? 5
                decoration: const BoxDecoration(color: Colors.white //?????????
                    ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    url,
                    fit: BoxFit.cover,
                  ),
                ));
          },
        );
      }).toList(),
    );
  }

  @override
  Widget MainBottom() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 1000),
          child: Column(
            children: <Widget>[
              Text(
                '\'???????????? ?????? ????????? ??????\'',
                style: TextStyle(fontSize: 30),
              ),
              Text(
                '???????????? ?????????????',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
          curve: Curves.easeInOut,
        ),
        SizedBox(
          height: 80,
        ),
        Text(
          '??? ?????? ????????????',
          style: TextStyle(fontSize: 20),
        ),
        Icon(
          CupertinoIcons.arrow_down,
          size: 200,
          color: Colors.lightBlue[200],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('copyright ',style: TextStyle(fontSize: 10),),
            Icon(Icons.copyright,size: 15,),
          ],
        ),
        Text('2022 by Kim jaeyeon',style: TextStyle(fontSize: 10),),
        SizedBox(height: 50,)
      ],
    );
  }
}
