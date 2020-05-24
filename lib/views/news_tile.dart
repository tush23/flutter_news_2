import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutternews2/utils/tools.dart';
import 'package:flutternews2/views/article_news.dart';

class NewsTile extends StatelessWidget {
  String imageURL, title, disc, articleURL, author, publishedAt, sourceName;


  NewsTile({
    this.imageURL,
    this.title,
    this.disc,
    this.articleURL,
    this.author,
    this.publishedAt, this.sourceName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticleNews(
                articleUrl: articleURL,
              )),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        //padding: EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: imageURL,
                  height: 180,
                  fit: BoxFit.fill,
                  width: 400,
                )),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(
                  fontFamily: "Product Sans",
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 3),
            Text(
              disc,
              style: TextStyle(
                  fontFamily: "Product Sans", color: Colors.grey[600]),
            ),
            SizedBox(height: 5),
            Row(
              children: <Widget>[
                SizedBox(width: 10),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 3, 15, 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue),
                  child: Text(
                    Tools.TimeExtracter(publishedAt),
                    style: TextStyle(fontFamily: "Product Sans", fontSize: 11),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 3, 15, 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue),
                  child: Text(
                    Tools.DateExtracter(publishedAt),
                    style: TextStyle(fontFamily: "Product Sans", fontSize: 11),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 3, 15, 3),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue),
                  child: Text(
                    sourceName,
                    style: TextStyle(fontFamily: "Product Sans", fontSize: 11),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Divider(
              color: Colors.grey[400],
              thickness: 1,
            )
          ],
        ),

      ),
    );
  }
}
