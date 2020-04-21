import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutternews2/helper/data.dart';
import 'package:flutternews2/helper/news.dart';
import 'package:flutternews2/models/ArticleModel.dart';
import 'package:flutternews2/models/category_model.dart';
import 'package:flutternews2/views/category_news.dart';

import 'news_tile.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<CategoryModel> categoryy = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;
  @override
  void initState() {
    categoryy = getCategoryModel();
    print(categoryy);
    super.initState();
    getNews();
  }

  getNews() async{
    News newsClass = News();
    await newsClass.getNews();
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
              
              //Caegories
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount:categoryy.length,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return CategoryTile(
                      imageUrl: categoryy[index].imageUrl,
                      categoryName: categoryy[index].categoryName,
                    );
                  }),
              ),

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
                      publishedAt: articles[index].publishedAt,
                      author: articles[index].author,
                      disc:articles[index].description);
                  } ,
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  
  final imageUrl, categoryName;

 CategoryTile({this.imageUrl,this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context)=>CategoryNews(category: categoryName.toString().toLowerCase(),)),
              );
          },
          child: Container(
        margin: EdgeInsets.only(right: 20),
        child: Stack(
          children: <Widget>[
            ClipRRect
            (borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(imageUrl:imageUrl,height: 60,width: 120,fit: BoxFit.cover,)),
            Container(
              alignment:Alignment.center,
              height: 60,width: 120,
              decoration: BoxDecoration(color: Colors.black26,borderRadius: BorderRadius.circular(6)),
              child: Text(categoryName,style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Product Sans'
                ),
              ),
            )
          ],

        ),
      ),
    );
  }
}

