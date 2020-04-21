import 'dart:convert';

import 'package:flutternews2/models/ArticleModel.dart';

import 'package:http/http.dart' as  http;

class News{

  List<ArticleModel> mNews = [];

  Future<void> getNews() async {
   String url = "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=595a430e1e364be4952d4ceba47f6db1";
   
   var response = await http.get(url);

   var jsonData = jsonDecode(response.body);

   if(jsonData['status']=='ok'){
     jsonData['articles'].forEach((element){
       
       if(element['urlToImage']!=null && element['description']!=null){
         ArticleModel articleModel = ArticleModel(
           author: element['author'],
           title: element['title'],
           description: element['description'],
           url: element['url'], 
           urlToImage: element['urlToImage'],
           publishedAt: element['publishedAt'],
           content: element['content']

         );
         mNews.add(articleModel);
       }

     });
   }
  }
}
class CategoryNewsHelper{

  List<ArticleModel> mNews = [];

  Future<void> getCategoryNews(String category) async {
   String url = "http://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=595a430e1e364be4952d4ceba47f6db1";
   
   var response = await http.get(url);

   var jsonData = jsonDecode(response.body);

   if(jsonData['status']=='ok'){
     jsonData['articles'].forEach((element){
       
       if(element['urlToImage']!=null && element['description']!=null){
         ArticleModel articleModel = ArticleModel(
           author: element['author'],
           title: element['title'],
           description: element['description'],
           url: element['url'], 
           urlToImage: element['urlToImage'],
           publishedAt: element['publishedAt'],
           content: element['content']

         );
         mNews.add(articleModel);
       }

     });
   }
  }
}