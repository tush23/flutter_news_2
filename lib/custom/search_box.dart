import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutternews2/configer/configer_bloc.dart';
import 'package:flutternews2/views/search_tile.dart';

Widget SearchBox(context) {
  TextEditingController textEditingController = new TextEditingController();
  return Container(
    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
    padding: EdgeInsets.only(left: 30, right: 30),
    decoration: BoxDecoration(
        color: ConfigerBloc().darkModeOn ? Colors.grey[900] : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey[500], width: 0.5)),
    child: Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            controller: textEditingController,
            decoration: InputDecoration(
                hintText: "Search News", border: InputBorder.none),
          ),
        ),
        GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SearchTile(query: textEditingController.text)));
            },
            child: Container(child: Icon(Icons.search))),
      ],
    ),
  );
}
