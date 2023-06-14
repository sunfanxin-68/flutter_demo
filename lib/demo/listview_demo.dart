import 'package:flutter/material.dart';
import './post_show.dart' as demo;
import '../model/post.dart';

class ListViewDemo extends StatelessWidget {
  const ListViewDemo({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: _listItemBuilder,
    );
  }
}

Widget _listItemBuilder(BuildContext context, int index) {
  return Container(
    color: Colors.white,
    margin: const EdgeInsets.all(8.0),
    child: Stack(
      children: <Widget>[
        Column(
          children: <Widget>[
            AspectRatio(
                aspectRatio: 16/9,
                child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
              ),
            const SizedBox(height: 16.0),
            Text(
              posts[index].title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              posts[index].author,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16.0),
          ],
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
                splashColor: Colors.white.withOpacity(0.3),
                highlightColor: Colors.white.withOpacity(0.1),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => demo.PostShow(post: posts[index]))
                  );
                }
                ),
          ),
        ),
      ],
    ),
  );
}
