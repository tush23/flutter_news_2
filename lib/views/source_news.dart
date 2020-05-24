import 'package:flutter/material.dart';
import 'package:flutternews2/configer/configer_bloc.dart';
import 'package:flutternews2/custom/custom_Scaffold.dart';
import 'package:flutternews2/custom/custom_dropdown.dart';
import 'package:flutternews2/helper/news.dart';
import 'package:flutternews2/models/ArticleModel.dart';
import 'package:flutternews2/models/source_model.dart';
import 'package:flutternews2/views/news_tile.dart';

class SourceNews extends StatefulWidget {
  List<SourceModel> sourceModel;

  SourceNews(this.sourceModel);

  @override
  _SourceNewsState createState() => _SourceNewsState();

  var selected;
}

class _SourceNewsState extends State<SourceNews> {
  List<DropdownMenuItem<SourceModel>> _dropdownMenuItem;
  SourceModel selectedSource;
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;

  @override
  void initState() {
    // TODO: implement initState
    _dropdownMenuItem = buildDropDownMenuItems(widget.sourceModel);
    selectedSource =
        _dropdownMenuItem != null ? _dropdownMenuItem[0].value : "Selected";
    super.initState();
    getSourceWiseNews(_dropdownMenuItem[0].value.id);
  }

  getSourceWiseNews(String source) async {
    SourceWiseNews sourceWiseNews = SourceWiseNews();
    await sourceWiseNews.getSearchedNews(source);
    articles = sourceWiseNews.mNews;
    setState(() {
      _loading = false;
    });
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Flutter News",
      body: widget.sourceModel.isEmpty
          ? Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height * .4),
              child: Center(child: Text("No Source Found ")))
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    padding: EdgeInsets.only(left: 30, right: 30),
                    decoration: BoxDecoration(
                        color: ConfigerBloc().darkModeOn
                            ? Colors.grey[900]
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(20),
                        border:
                            Border.all(color: Colors.grey[500], width: 0.5)),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        hint: Text("Select Source"),
                        value: selectedSource,
                        items: _dropdownMenuItem,
                        onChanged: onChangedDropDownItem,
                      ),
                    ),
                  ),
                  _loading
                      ? Container(
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.4),
                          child: CircularProgressIndicator())
                      : Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: ListView.builder(
                            itemCount: articles.length,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return NewsTile(
                                  imageURL: articles[index].urlToImage,
                                  title: articles[index].title,
                                  articleURL: articles[index].url,
                                  publishedAt: articles[index].publishedAt,
                                  author: articles[index].author,
                                  disc: articles[index].description,
                                  sourceName: articles[index].sourceName);
                            },
                          ))
                ],
              ),
            ),
    );
  }

  List<DropdownMenuItem<SourceModel>> buildDropDownMenuItems(List mSourceName) {
    List<DropdownMenuItem<SourceModel>> items = List();
    for (SourceModel sourceModel in mSourceName) {
      items.add(DropdownMenuItem(
        value: sourceModel,
        child: Text(sourceModel.name),
      ));
    }
    return items;
  }

  void onChangedDropDownItem(SourceModel value) {
    setState(() {
      selectedSource = value;
      print(selectedSource.name);
      getSourceWiseNews(selectedSource.id);
    });
  }
}
