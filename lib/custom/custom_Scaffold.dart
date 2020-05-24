import 'package:flutter/material.dart';
import 'package:flutternews2/configer/index.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: camel_case_types
class CustomScaffold extends StatelessWidget {
  bool firstClick = true;
  final String title;

  final Widget body;
  final Widget bottomTabs;
  final Widget floatingButton;

  CustomScaffold(
      {Key key, this.title, this.body, this.bottomTabs, this.floatingButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      color: ConfigerBloc().darkModeOn ? Colors.grey[800] : Colors.white,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
            centerTitle: true,
            //bottom: bottomTabs != null ? bottomTabs : null,
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    ConfigerBloc().darkModeOn
                        ? FontAwesomeIcons.lightbulb
                        : FontAwesomeIcons.solidLightbulb,
                    size: 15,
                  ),
                  onPressed: () {
                    ConfigerBloc()
                        .add(DarkModeEvent(!ConfigerBloc().darkModeOn));
                  }),
              /*IconButton(
                  icon: ConfigerBloc().darkModeOn
                      ? Icon(Icons.search, color: Colors.white, size: 20)
                      : Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 20,
                        ),
                  onPressed: firstClick?() {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchTile()),
                    );
                    firstClick=false;

                  }:null,),*/
              /*PopupMenuButton<String>(
                onSelected:choiceAction,
                itemBuilder: (BuildContext context){
                  return SortBy.options.map((String choice){
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(choice),
                    );

                  }).toList();
                },
              )*/
            ],
            elevation: 1.2,
          ),
          bottomNavigationBar: bottomTabs != null ? bottomTabs : null,
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: floatingButton != null ? floatingButton : null,
          body: body,
          /*bottomNavigationBar: BottomAppBar(
            child: new Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(icon: Icon(Icons.menu), onPressed: () {},),
                IconButton(icon: Icon(Icons.search), onPressed: () {},),
              ],
            ),
          ),*/
        ),
      ),
    );
  }

  void choiceAction(String choice) {}
}
