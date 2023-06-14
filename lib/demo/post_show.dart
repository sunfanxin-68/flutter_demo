import 'package:flutter/material.dart';
import '../model/post.dart';

class PostShow extends StatelessWidget {
  final Post post;

  // 此处删除super关键字
  const PostShow({
    Key? key, 
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Image.network(post.imageUrl),
          Container(
            padding: const EdgeInsets.all(32.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  post.title,
                  // 修改了textTheme的title属性
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Text(
                  post.author,
                  // 修改了textTheme的subhead属性
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 32.0),
                Text(
                  post.description,
                  // 修改了textTheme的body1属性
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
