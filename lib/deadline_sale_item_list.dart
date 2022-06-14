import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class deadline_sale_item_list extends StatefulWidget {
  const deadline_sale_item_list({Key? key}) : super(key: key);

  @override
  State<deadline_sale_item_list> createState() => _deadline_sale_item_listState();
}

class _deadline_sale_item_listState extends State<deadline_sale_item_list> {
  final sortKey = ['가격이 낮은 순', '가격이 높은 순', '오래된 순', '최근 순'];
  var _selected_sort_key = '최근 순';
  var _selected_card_view = false;
  var _selected_list_view = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: <Widget>[itemlistTop(), itemlistMiddle(), itemlistBottom()],
        ));
  }

  @override
  Widget itemlistTop() {
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
                '기간 한정 세일',
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
  Widget itemlistMiddle() {
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
  Widget itemlistBottom() {
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
            '등록된 상품이 없어요 :(',
            style: TextStyle(color: Colors.grey, fontSize: 20),
          ),
        ],
      ),
    );
  }

}
