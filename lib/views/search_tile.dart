import 'package:flutter/material.dart';
import 'package:flutternews2/configer/configer_bloc.dart';
import 'package:flutternews2/custom/custom_Scaffold.dart';
import 'package:flutternews2/custom/search_box.dart';
import 'package:flutternews2/helper/news.dart';
import 'package:flutternews2/models/ArticleModel.dart';
import 'package:flutternews2/utils/constants.dart';

import 'news_tile.dart';

class SearchTile extends StatefulWidget {
  String query;

  SearchTile({this.query});

  @override
  _SearchTileState createState() => _SearchTileState();
}

class _SearchTileState extends State<SearchTile> {
  List<ArticleModel> articles = List<ArticleModel>();
  bool _loading = true;
  String data = "Search";
  TextEditingController textEditingController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    //getSearchedNews(widget.query);
    textEditingController.text = widget.query;
  }

  getSearchedNews(String query) async {
    SearchedNews newsClass = SearchedNews();
    await newsClass.getSearchedNews(query);
    articles = newsClass.mNews;
    //print("#########################");
    //print(articles[2].title);
    setState(() {
      _loading = false;
      print(articles.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    /*String errorMsg;
    if(widget.query.isEmpty){
      errorMsg="";
    }
    else errorMsg="Not Found";*/
    return CustomScaffold(
      title: Constants.app_name,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 30, right: 30),
              decoration: BoxDecoration(
                  color: ConfigerBloc().darkModeOn
                      ? Colors.grey[900]
                      : Colors.grey[200],
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
                  InkWell(
                      onTap: () {
                        _loading = true;
                        getSearchedNews(textEditingController.text);
                        data = "Not Found";
                      },
                      child: Container(child: Icon(Icons.search)))
                ],
              ),
            ),
            articles.length == 0
                ? Center(
                    child: Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .34),
                      child: Text(
                        data,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  )
                : _loading
                    ? CircularProgressIndicator()
                    : Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: ListView.builder(
                          itemCount: articles.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return articles != null
                                ? NewsTile(
                                    imageURL: articles[index].urlToImage,
                                    title: articles[index].title,
                                    articleURL: articles[index].url,
                                    disc: articles[index].description,
                                    sourceName: articles[index].sourceName,
                                    publishedAt: articles[index].publishedAt,
                                  )
                                : CircularProgressIndicator();
                          },
                        )),
          ],
        ),
      ),
    );
  }
}
