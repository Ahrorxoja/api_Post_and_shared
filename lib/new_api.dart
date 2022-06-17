// import 'dart:convert';
//
// import 'package:api_post/controller/test_controller.dart';
// import 'package:flutter/material.dart';
//
// import 'controller/urls.dart';
// import 'models/news_models.dart';
//
// class TestApi extends StatefulWidget {
//   const TestApi({Key? key}) : super(key: key);
//
//   @override
//   _TestApiState createState() => _TestApiState();
// }
//
// class _TestApiState extends State<TestApi> {
//   late Future data;
//   late NewsModel model;
//   List userList = [];
//   var URLS = UrlStorage();
//
//     // List<Article> articles =[];
//
//   Future<NewsModel?>? _getUsersList() async {
//     final response = await TestController().getNews();
//     return NewsModel.fromJson(jsonDecode(response.body));
//     // print(response.body);
//     // final Map<String,dynamic> body = jsonDecode(response.body);
//     // final Article article = Article.fromJson(body);
//     // await TestController().getNews().then((result) {
//     //   if (result != null) {
//     //     userList = result;
//     //     model = NewsModel.fromJson(result);
//     //   }
//     // });
//   }
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     futureAlbum =   _getUsersList();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("TestApi"),
//       ),
//       body: Container(
//         child: Center(
//           child: FutureBuilder<Article>(
//             future: _getUsersList(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return ListView.builder(
//                     itemCount: snapshot.data?.articles?.length,
//                     itemBuilder:  (BuildContext context,int index){
//                      return Text(snapshot.data!.title);
//                 });
//               } else if (snapshot.hasError) {
//                 return Text('${snapshot.error}');
//               }
//
//               // By default, show a loading spinner.
//               return const CircularProgressIndicator();
//             },
//           ),
//           // FutureBuilder(
//           //   future: _getUsersList(),
//           //   builder: (context, snapshot) {
//           //     switch (snapshot.connectionState) {
//           //       case ConnectionState.none:
//           //         return Center(child: Text("loading..."));
//           //       case ConnectionState.active:
//           //       case ConnectionState.waiting:
//           //         return Text("loading...");
//           //       default:
//           //         if (model == null) {
//           //           return Column(
//           //             mainAxisAlignment: MainAxisAlignment.center,
//           //             crossAxisAlignment: CrossAxisAlignment.center,
//           //             children: <Widget>[
//           //               Icon(Icons.info, size: 48, color: Colors.grey,),
//           //               SizedBox(height: 10),
//           //               Center(child: Text("No found", style: TextStyle(fontSize: 18)))
//           //             ],
//           //           );
//           //         } else {
//           //           return SingleChildScrollView(
//           //               child: Padding(
//           //                 padding: const EdgeInsets.all(8.0),
//           //                 child: ListView.builder(
//           //                     itemCount: 5,
//           //                     itemBuilder: (BuildContext context,int index){
//           //                       return Column(
//           //                         crossAxisAlignment: CrossAxisAlignment.start,
//           //                         children: [
//           //                           Center(child: Text(model.status,
//           //                               style: TextStyle(
//           //                                   fontWeight: FontWeight.bold,
//           //                                   fontSize: 24))),
//           //                           Container(
//           //                             child: Text(
//           //                               model.articles.source.name, style: TextStyle(),
//           //                               textAlign: TextAlign.start,
//           //                             ),
//           //                           )
//           //                         ],
//           //                       );
//           //                     }
//           //                 ),
//           //               )
//           //             // child: Container(
//           //             //   child: Text(model.result.text),
//           //             // ),
//           //           );
//           //         }
//           //     }
//           //   },
//           // )
//     )
//         ),);
//   }
// }
// // To parse this JSON data, do
// //
// //     final newsModel = newsModelFromJson(jsonString);
//
//
// NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));
//
// String newsModelToJson(NewsModel data) => json.encode(data.toJson());
//
// class NewsModel {
//   NewsModel({
//     required this.status,
//     required this.totalResults,
//     required this.articles,
//   });
//
//   String status;
//   int totalResults;
//   List<Article> articles;
//
//   factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
//     status: json["status"],
//     totalResults: json["totalResults"],
//     articles: List<Article>.from(json["articles"].map((x) => Article.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "totalResults": totalResults,
//     "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
//   };
// }
//
// class Article {
//   Article({
//     required this.source,
//     required this.author,
//     required this.title,
//     required this.description,
//     required this.url,
//     required this.urlToImage,
//     required this.publishedAt,
//     required this.content,
//   });
//
//   Source source;
//   String author;
//   String title;
//   String description;
//   String url;
//   String urlToImage;
//   DateTime publishedAt;
//   String content;
//
//   factory Article.fromJson(Map<String, dynamic> json) => Article(
//     source: Source.fromJson(json["source"]),
//     author: json["author"] == null ? null : json["author"],
//     title: json["title"],
//     description: json["description"],
//     url: json["url"],
//     urlToImage: json["urlToImage"],
//     publishedAt: DateTime.parse(json["publishedAt"]),
//     content: json["content"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "source": source.toJson(),
//     "author": author == null ? null : author,
//     "title": title,
//     "description": description,
//     "url": url,
//     "urlToImage": urlToImage,
//     "publishedAt": publishedAt.toIso8601String(),
//     "content": content,
//   };
// }
//
// class Source {
//   Source({
//     required this.id,
//     required this.name,
//   });
//
//   String id;
//   String name;
//
//   factory Source.fromJson(Map<String, dynamic> json) => Source(
//     id: json["id"] == null ? null : json["id"],
//     name: json["name"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id == null ? null : id,
//     "name": name,
//   };
// }
//
//
