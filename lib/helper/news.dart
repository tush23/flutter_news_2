import 'dart:convert';

import 'package:flutternews2/models/ArticleModel.dart';
import 'package:flutternews2/models/source_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> mNews = [];


  Future<void> getNews(String sortBy) async {
    /*  String url =
        "http://newsapi.org/v2/top-headlines?sources=$source&sortBy=$sortBy&pageSize=100&pageSize=100&apiKey=595a430e1e364be4952d4ceba47f6db1";
      */
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&sortBy=$sortBy&pageSize=100&pageSize=100&apiKey=595a430e1e364be4952d4ceba47f6db1";
/*
  if(sortBy==SortBy.Popularity){
    url="https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=595a430e1e364be4952d4ceba47f6db1";
  }*/

    var response = await http.get(url);
    print(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              author: element['author'],
              title: element['title'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              publishedAt: element['publishedAt'],
              sourceName: element['source']['name'],
              content: element['content']);

          mNews.add(articleModel);
        }
      });
      /*jsonData['articles']['source'].forEach((element) {
        if (element['id'] != null || element['source'] != null) {
          SourceModel sourceModel =
              SourceModel(name: element['source'], id: element['id']);
          mSources.add(sourceModel);
        }
      });
    }*/
    }
  }
}

class CategoryNewsHelper {
  List<ArticleModel> mNews = [];

  Future<void> getCategoryNews(String category) async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=595a430e1e364be4952d4ceba47f6db1";

    var response = await http.get(url);
    print(response);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              author: element['author'],
              title: element['title'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              publishedAt: element['publishedAt'],
              content: element['content'],
              sourceName: element['source']['name']);
          mNews.add(articleModel);
        }
      });
    }
    /*jsonData['articles']['source'].forEach((element) {
      if (element['id'] != null || element['source'] != null) {
        SourceModel sourceModel =
            SourceModel(name: element['source'], id: element['id']);
        mSources.add(sourceModel);
      }
    });*/
  }
}

class SearchedNews {
  List<ArticleModel> mNews = [];

  Future<void> getSearchedNews(String q) async {
    String url =
        "https://newsapi.org/v2/everything?q=$q&apiKey=595a430e1e364be4952d4ceba47f6db1";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              author: element['author'],
              title: element['title'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              publishedAt: element['publishedAt'],
              sourceName: element['source']['name'],
              content: element['content']);

          mNews.add(articleModel);
        }
      });
      /*jsonData['articles']['source'].forEach((element) {
        if (element['id'] != null || element['source'] != null) {
          SourceModel sourceModel =
              SourceModel(name: element['source'], id: element['id']);
          mSources.add(sourceModel);
        }
      });
    }*/
    }
  }
}

class SourceInfo {
  List<SourceModel> mSource = [];

  Future<void> getSourceData() async {
    String url =
        "https://newsapi.org/v2/sources?apiKey=595a430e1e364be4952d4ceba47f6db1";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['sources'].forEach((element) {
        if (element['id'] != null && element['name'] != null) {
          SourceModel sourceModel =
          SourceModel(id: element['id'], name: element['name']);

          mSource.add(sourceModel);
        }
      });
    }
    print('###################');
    print(mSource);
  }
}

class SourceWiseNews {
  List<ArticleModel> mNews = [];

  Future<void> getSearchedNews(String source) async {
    String url =
        "https://newsapi.org/v2/everything?sources=$source&sortBy=publishedAt&apiKey=595a430e1e364be4952d4ceba47f6db1";

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          ArticleModel articleModel = ArticleModel(
              author: element['author'],
              title: element['title'],
              description: element['description'],
              url: element['url'],
              urlToImage: element['urlToImage'],
              publishedAt: element['publishedAt'],
              sourceName: element['source']['name'],
              content: element['content']);

          mNews.add(articleModel);
        }
      });
      /*jsonData['articles']['source'].forEach((element) {
        if (element['id'] != null || element['source'] != null) {
          SourceModel sourceModel =
              SourceModel(name: element['source'], id: element['id']);
          mSources.add(sourceModel);
        }
      });
    }*/
    }
  }
}
