import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HttpDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpDemo'),
        elevation: 0.0,
      ),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  const HttpDemoHome({super.key});

  @override
  State<HttpDemoHome> createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {
  @override
  void initState() {
    super.initState();
    // fetchPost();

    final post = {
      'title': 'おはよう',
      'date': '6月20日',
      'description': '天気がいいですね',
    };

    print(post['title']);
    print(post['date']);
    print(post['description']);

    final postJson = json.encode(post);
    print(postJson);

    final postJsonConverted = json.decode(postJson);
    print(postJsonConverted['title']);
    print(postJsonConverted is Map);

    final postModel = Post.fromJson(postJsonConverted);
    print('title: ${postModel.title}, description: ${postModel.description}');

    print('${json.encode(postModel)}');
  }

   fetchPost() async {
    final Uri url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(url);

    // print('statusCode: ${response.statusCode}');
    // print('body: ${response.body}');

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
    } else {
      throw Exception('エラーfet');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Post {
  final int id;
  final String title;
  final String description;
  // final String body;

  Post(
    this.id,
    this.title,
    this.description,
    // this.body,
  );

  Post.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        description = json['description'];

  Map toJson() => {
        'title': title,
        'descritpion': description,
      };
}
