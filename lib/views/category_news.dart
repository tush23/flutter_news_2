import 'package:flutter/material.dart';
import 'package:flutternews2/helper/news.dart';
import 'package:flutternews2/models/ArticleModel.dart';

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
    getCategoryNews(); 

  }
  getCategoryNews() async{
    CategoryNewsHelper newsClass = CategoryNewsHelper();
    await newsClass.getCategoryNews(widget.category);
    articles = newsClass.mNews;
    print(articles);
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Flutter",style: TextStyle(
              fontFamily: 'Product Sans'
             ),
            ),
            Text("News",style: TextStyle(
                color: Colors.blue[600],
                fontFamily: 'Product Sans',
              ),
            )
          ],
        ),
        actions: <Widget>[
          Opacity(
              opacity: 0,
              child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Icon(Icons.desktop_windows),
            ),
          )
        ],
        elevation: 0.0, 
      ),
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
                    return NewsTile(
                      imageURL:articles[index].urlToImage,
                      title:articles[index].title,
                      articleURL: articles[index].url,
                      disc:articles[index].description);
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