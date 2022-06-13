import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class personal_info extends StatefulWidget {
  const personal_info({Key? key}) : super(key: key);

  @override
  State<personal_info> createState() => _personal_infoState();
}

class _personal_infoState extends State<personal_info> {
  final sortKey = ['가격이 낮은 순', '가격이 높은 순', '오래된 순', '최근 순'];
  var _selected_sort_key = '최근 순';
  var _selected_card_view = false;
  var _selected_list_view = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: <Widget>[personal_infoTop(),],
        ));
  }

  @override
  Widget personal_infoTop() {
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
              padding: EdgeInsets.only(left: 1, bottom: 3),
              child: Text(
                '개인정보',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15,
        )
      ],
    );
  }

  @override
  Widget personal_infoMiddle() {
    return Row(
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 0.5)),
            ),
            width: 410,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  child: Icon( (_selected_card_view==true)?
                  CupertinoIcons.rectangle_grid_3x2 : CupertinoIcons.rectangle_grid_3x2_fill,
                    color: Colors.grey,
                    size: 25,
                  ),
                  onTap: () {
                    setState((){
                      _selected_card_view=!_selected_card_view;
                      if(_selected_card_view==true){
                        _selected_list_view=false;
                      }
                      else{
                        _selected_list_view=true;
                      }
                    });
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  child: Icon((_selected_list_view==true)?
                  CupertinoIcons.list_bullet: CupertinoIcons.list_bullet_below_rectangle,
                    color: Colors.grey,
                    size: 25,
                  ),
                  onTap: (){
                    setState((){
                      _selected_list_view=!_selected_list_view;
                      if(_selected_list_view==true){
                        _selected_card_view=false;
                      }
                      else{
                        _selected_card_view=true;
                      }
                    });
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                DropdownButton(
                    value: _selected_sort_key,
                    items: sortKey.map((key) {
                      return DropdownMenuItem(
                        value: key,
                        child: Text(
                          key,
                          style: TextStyle(color: Colors.black),
                        ),
                      );
                    }).toList(),
                    onChanged: (key) {
                      setState(() {
                        _selected_sort_key = key.toString();
                      });
                    }),
                SizedBox(
                  width: 20,
                )
              ],
            )),
      ],
    );
  }

  @override
  Widget personal_infoBottom() {
    return Center(
      child: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Icon(
            CupertinoIcons.xmark,
            size: 150,
            color: Colors.grey,
          ),
          Text(
            '주문한 상품이 없어요 :(',
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
        ],
      ),
    );
  }

}
