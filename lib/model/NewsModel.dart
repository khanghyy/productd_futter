import 'dart:core';
class NewsModel{
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  DateTime? publisheAt;
  String? content;
  NewsModel({
    this.author,this.title,this.description,this.content,this.publisheAt,this.url,this.urlToImage
});
factory NewsModel.fromJson(Map<String,dynamic>obj){
  return NewsModel(
    author: obj['author'],
    title: obj['title'],
    description: obj['description'],
    urlToImage: obj['urlToImage'],
    url: obj['url'],
   // publisheAt: obj['publisheAt'],
    content: obj['content']
  );
}
}