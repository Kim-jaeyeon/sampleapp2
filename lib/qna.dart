import 'package:flutter/material.dart';
import 'package:flutter/Cupertino.dart';

class qna extends StatefulWidget {
  const qna({Key? key}) : super(key: key);

  @override
  State<qna> createState() => _qnaState();
}

class _qnaState extends State<qna> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        qnaTop(),
        qnaMiddle(),
      ],
    ));
  }

  @override
  Widget qnaTop() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        Row(
          children: [
            CupertinoButton(
                child: Icon(
                  CupertinoIcons.left_chevron,
                  size: 25,
                ),
                onPressed: () {
                  Navigator.pop(context);
                }),
            Padding(
              padding: EdgeInsets.only(left: 1, bottom: 6),
              child: Text(
                'Q&A',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Container(
          height: 10,
          decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1))),
        ),
        SizedBox(
          height: 30,
        )
      ],
    );
  }

  @override
  Widget qnaMiddle() {
    return Expanded(
        child: Container(
          height: 750,
          child: Column(
            children: <Widget>[
              InkWell(
                onTap: (){},
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 0.5)),
                  ),
                  height: 50,
                  child: Row(
                    children: [Text(' Q.',style: TextStyle(color: Colors.lightBlue[200],fontSize: 28,fontWeight: FontWeight.bold),),
                    Text('   배송은 얼마나 걸리나요?',style: TextStyle(fontSize: 18),),
                    SizedBox(width: 130,),
                    Icon(CupertinoIcons.chevron_down,color: Colors.purpleAccent[200],)],
                  ),
                ),
              ),
              InkWell(
                onTap: (){},
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 0.5)),
                  ),
                  height: 50,
                  child: Row(
                    children: [Text(' Q.',style: TextStyle(color: Colors.lightBlue[200],fontSize: 28,fontWeight: FontWeight.bold),),
                      Text('   교환 및 환불은 어떻게 해야하나요?',style: TextStyle(fontSize: 18),),
                      SizedBox(width: 54,),
                      Icon(CupertinoIcons.chevron_down,color: Colors.purpleAccent[200],)],
                  ),
                ),
              ),
              InkWell(
                onTap: (){},
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 0.5)),
                  ),
                  height: 50,
                  child: Row(
                    children: [Text(' Q.',style: TextStyle(color: Colors.lightBlue[200],fontSize: 28,fontWeight: FontWeight.bold),),
                      Text('   주문취소 할 수 있나요?',style: TextStyle(fontSize: 18),),
                      SizedBox(width: 142,),
                      Icon(CupertinoIcons.chevron_down,color: Colors.purpleAccent[200],)],
                  ),
                ),
              ),
              InkWell(
                onTap: (){},
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(width: 0.5)),
                  ),
                  height: 50,
                  child: Row(
                    children: [Text(' Q.',style: TextStyle(color: Colors.lightBlue[200],fontSize: 28,fontWeight: FontWeight.bold),),
                      Text('   결제취소를 했는데 돈이 안 들어와요!',style: TextStyle(fontSize: 18),),
                      SizedBox(width: 41,),
                      Icon(CupertinoIcons.chevron_down,color: Colors.purpleAccent[200],)],
                  ),
                ),
              ),

            ],
          ),
    ));
  }
}
