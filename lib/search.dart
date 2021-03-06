

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:sampleapp2/inappview.dart';

final dummyItems = <String>[
  'assets/joe.jpeg',
  'assets/joesae.jpeg',
  'assets/IU.jpeg',
  'assets/glasses.jpeg',
  'assets/gliter.jpeg'
];

class MyInAppBrowser extends InAppBrowser {
  @override
  Future onBrowserCreated() async {
    print("Browser Created!");
  }

  @override
  Future onLoadStart(url) async {
    print("Started $url");
  }

  @override
  Future onLoadStop(url) async {
    print("Stopped $url");
  }

  @override
  void onLoadError(url, code, message) {
    print("Can't load $url.. Error: $message");
  }

  @override
  void onProgressChanged(progress) {
    print("Progress: $progress");
  }

  @override
  void onExit() {
    print("Browser closed!");
  }
}

class search extends StatefulWidget {


  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {

  final GlobalKey webViewKey = GlobalKey();


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
          SizedBox(
            height: 30,
          ),
          searchMiddle(),
          searchBottom(),
        ],
      ),
    );
  }

  @override
  Widget searchTop() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 40,
        ),
        Row(
          children: [
            Container(
              height: 100,
              width: 300,
              child: Form(
                key: _formKey,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 10, top: 30, right: 30, bottom: 30),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: '???????????? ??????????????????'),
                    controller: _searchTextController,
                    validator: (value) {
                      if (value.toString().trim().isEmpty) {
                        return '???????????? 1?????? ?????? ??????????????????!';
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
              child: Text('??????'),
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
  Widget searchMiddle() {
    return Column(
      children: [
        Text('????????? ??????-!',
            style: GoogleFonts.notoSansNKo(
                textStyle:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 30))),
        SizedBox(
          height: 20,
        ),
        CarouselSlider(
          options: CarouselOptions(
            height: 150.0,
            autoPlay: true,
            enlargeCenterPage: true,
          ), //?????? 400
          items: dummyItems.map((url) {
            //5?????????
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context)
                        .size
                        .width, //context??? ??????????????? ??? ???, ????????? ?????? ??????
                    margin: EdgeInsets.symmetric(horizontal: 2.0), //???????????? 5
                    decoration: const BoxDecoration(color: Colors.white //?????????
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
  Widget searchBottom() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 50,
        ),
        InkWell(
          onTap: () {
              Navigator.push(context, CupertinoPageRoute(fullscreenDialog: true,builder: (context)=>inappview(0)));
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border(top: BorderSide(width: 1, color: Colors.grey))),
            height: 125,
            child: Row(
              children: <Widget>[
                Image.asset(
                  'assets/joe.jpeg',
                  width: 100,
                  height: 100,
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text('?????????, ???????????? ??????!',
                          style: GoogleFonts.notoSansNKo(
                            textStyle: TextStyle(fontWeight: FontWeight.bold),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        '#????????? #?????? #????????? #???',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 90,
                ),
                Icon(
                  CupertinoIcons.right_chevron,
                  size: 40,
                  color: Colors.purple[200],
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context, CupertinoPageRoute(fullscreenDialog: true,builder: (context)=>inappview(1)));
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border(top: BorderSide(width: 1, color: Colors.grey))),
            height: 125,
            child: Row(
              children: <Widget>[
                Image.asset(
                  'assets/glasses.jpeg',
                  width: 99,
                  height: 100,
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                        '???????????? ??????, ??????????????????',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        '#????????? #???????????? #?????? #?????????',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 50,
                ),
                Icon(
                  CupertinoIcons.right_chevron,
                  size: 40,
                  color: Colors.purple[200],
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context, CupertinoPageRoute(fullscreenDialog: true,builder: (context)=>inappview(2)));
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border(top: BorderSide(width: 1, color: Colors.grey))),
            height: 125,
            child: Row(
              children: <Widget>[
                Image.asset(
                  'assets/joesae.jpeg',
                  width: 100,
                  height: 100,
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                        '?????????, ????????? ????????? ?????? ??????!     ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        '#????????? #???????????? #???????????? #???????????? ',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  CupertinoIcons.right_chevron,
                  size: 40,
                  color: Colors.purple[200],
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context, CupertinoPageRoute(fullscreenDialog: true,builder: (context)=>inappview(3)));
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border(top: BorderSide(width: 1, color: Colors.grey))),
            height: 125,
            child: Row(
              children: <Widget>[
                Image.asset(
                  'assets/lee.jpeg',
                  width: 110,
                  height: 100,
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 30),
                      child: Text(
                        '???????????? ?????????????????? ??????????',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        '#???????????? #?????? #????????? #??????',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 50,
                ),
                Icon(
                  CupertinoIcons.right_chevron,
                  size: 40,
                  color: Colors.purple[200],
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context, CupertinoPageRoute(fullscreenDialog: true,builder: (context)=>inappview(4)));
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border(top: BorderSide(width: 1, color: Colors.grey))),
            height: 125,
            child: Row(
              children: <Widget>[
                Image.asset(
                  'assets/lipstick.jpeg',
                  width: 100,
                  height: 100,
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 30),
                      child: Text(
                        '???????????? ??????, ???????????? ??????',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        '#???????????? #?????? #???????????? #???',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 60,
                ),
                Icon(
                  CupertinoIcons.right_chevron,
                  size: 40,
                  color: Colors.purple[200],
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context, CupertinoPageRoute(fullscreenDialog: true,builder: (context)=>inappview(5)));
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border(top: BorderSide(width: 1, color: Colors.grey))),
            height: 125,
            child: Row(
              children: <Widget>[
                Image.asset(
                  'assets/IU.jpeg',
                  width: 100,
                  height: 100,
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                        '???????????? ???????????? ??????????',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        '#????????? #?????? #????????? #?????????',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 60,
                ),
                Icon(
                  CupertinoIcons.right_chevron,
                  size: 40,
                  color: Colors.purple[200],
                )
              ],
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context, CupertinoPageRoute(fullscreenDialog: true,builder: (context)=>inappview(6)));
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border(top: BorderSide(width: 1, color: Colors.grey))),
            height: 125,
            child: Row(
              children: <Widget>[
                Image.asset(
                  'assets/eyebrow.jpeg',
                  width: 100,
                  height: 100,
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                        '???????????????, ????????? ????????? ?????????!',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        '#??????????????? #???????????? #????????? #??????',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Icon(
                  CupertinoIcons.right_chevron,
                  size: 40,
                  color: Colors.purple[200],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
