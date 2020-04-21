import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutternews2/views/article_news.dart';

class NewsTile extends StatelessWidget {

  String imageURL,title,disc,articleURL,author,publishedAt;

  NewsTile({this.imageURL, this.title, this.disc,this.articleURL,this.author,this.publishedAt});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => ArticleNews(
                articleUrl: articleURL,
              ))
              ,);
          },
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            //padding: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(imageUrl:imageURL,height: 180,fit:BoxFit.fill,width: 400,)),
              SizedBox(height: 10,),
              Text(title,
              style:TextStyle( 
                  fontFamily: "Product Sans",
                  fontSize: 18,
                  fontWeight: FontWeight.w400
                ), 
              ),
              SizedBox(height:3),
              Text(disc,
              style: TextStyle(
                  fontFamily: "Product Sans",
                  color: Colors.grey[600]
                ),
              ),
            ],
          ),
      ),
    );
  }
}
