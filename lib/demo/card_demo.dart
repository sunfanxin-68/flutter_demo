import 'package:flutter/material.dart';
import '../model/post.dart';

class CardDemo extends StatefulWidget {
  const CardDemo({super.key});

  @override
  _CardDemoState createState() => _CardDemoState();
}

class _CardDemoState extends State<CardDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CardDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: posts.map((post) {
            return Card(  //投稿の内容を表示するカードウィジェット
              child: Column(
                children: <Widget>[
                  AspectRatio(  //子ウィジェットの幅と高さの比を指定する
                    aspectRatio: 16/9,
                    child: ClipRRect(  //子ウィジェットの角を切り抜くため
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4.0),
                        topRight: Radius.circular(4.0),
                      ),
                      child: Image.network(
                        post.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(post.imageUrl),
                    ),
                    title: Text(post.title),
                    subtitle: Text(post.author),
                  ),
                  Container(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      //設定によりテキストの切り詰めや省略を行い
                      post.description,
                       maxLines: 2,
                        overflow: TextOverflow.ellipsis,),
                  ),
                  ButtonBarTheme(
                    data: const ButtonBarThemeData(),
                    child: ButtonBar(
                      children: <Widget>[
                        ElevatedButton(
                          child: Text('いいね'.toUpperCase()),
                          onPressed: () {},
                        ),
                        ElevatedButton(
                          child: Text('既読'.toUpperCase()),
                          onPressed: () {},
                        ),
                        ElevatedButton(
                          child: Text('シェア'.toUpperCase()),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      )
    );
  }
}