import 'package:flutter/material.dart';
import 'package:flutternews2/custom/custom_Scaffold.dart';
import 'package:flutternews2/helper/news.dart';
import 'package:flutternews2/models/ArticleModel.dart';
import 'package:flutternews2/utils/constants.dart';

import 'news_tile.dart';

class CategoryNews extends StatefulWidget {

  final String category;
  CategoryNews({this.category});

  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {

  List<ArticleModel> articles = List<ArticleModel>();
  bool _loading = true;


  @override
  void initState() {
    super.initState();
    setState(() {
      getCategoryNews();
    });
    getCategoryNews(); 

  }
  getCategoryNews() async{
    CategoryNewsHelper newsClass = CategoryNewsHelper();
    await newsClass.getCategoryNews(widget.category);
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
    return CustomScaffold(
        title: Constants.app_name,
      body: _loading ? Center(
        child: Container(
          child: CircularProgressIndicator(),
        ),
      ): 
        SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
              margin: EdgeInsets.only(top: 10),
              child: Column(
                children: <Widget>[
             //Blogs
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                child:ListView.builder(
                  itemCount: articles.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context,index){
                    return articles != null
                        ? NewsTile(
                      imageURL: articles[index].urlToImage,
                      title: articles[index].title,
                      articleURL: articles[index].url,
                      disc: articles[index].description,
                      sourceName: articles[index].sourceName,
                      publishedAt: articles[index].publishedAt,)
                        : CircularProgressIndicator();
                  } ,
                )
              )
          ],
          ),
      ),
    )
    );
  }
}