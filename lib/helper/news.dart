import 'package:flutternews/models/article_model.dart';
import 'package:http/http.dart';
import 'dart:convert';

class News {

  List<ArticleModel> news = [];

  Future<void> getNews() async {

    String url = "http://newsapi.org/v2/top-headlines?country=in&apiKey=0f00c08c828c43e6b26147da07f2222b";

    var response = await get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      jsonData['articles'].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){

          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urltoimage: element['urlToImage'],
            content: element['content'],
          );

          news.add(articleModel);

        }
      });
    }
  }

}


class CategoryNewsClass {

  List<ArticleModel> news = [];

  Future<void> getNews(String category) async {

    String url = "http://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=0f00c08c828c43e6b26147da07f2222b";

    var response = await get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == 'ok'){
      jsonData['articles'].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){

          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            url: element['url'],
            urltoimage: element['urlToImage'],
            content: element['content'],
          );

          news.add(articleModel);

        }
      });
    }
  }

}