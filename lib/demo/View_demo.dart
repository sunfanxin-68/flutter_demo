// 导入 Flutter 的 material 风格组件库
import 'package:flutter/material.dart';
import '../model/post.dart';

class ViewDemo extends StatelessWidget {
  const ViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const GridViewBuilderDemo();
  }
}


class GridViewBuilderDemo extends StatelessWidget {
  const GridViewBuilderDemo({super.key});

  Widget _gridItemBuilder(BuildContext context, int index) {
    return Container(
      child: Image.network(
        posts[index].imageUrl,
        fit: BoxFit.cover
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      itemCount: posts.length,
      itemBuilder: _gridItemBuilder,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        // crossAxisCount: 3,
        maxCrossAxisExtent: 150.0,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
    );
  }
}

class GridViewExtentDemo extends StatelessWidget {
  const GridViewExtentDemo({super.key});
  List<Widget> _buildTiles(length) {
    return List.generate(length, (int index) {
      return Container(
        color: Colors.grey[300],
        alignment: const Alignment(0.0, 0.0),
        child: Text(
          'Item $index',
          style: const TextStyle(fontSize: 18.0, color: Colors.grey),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
        maxCrossAxisExtent: 150.0,
        // crossAxisCount: 3,
        crossAxisSpacing: 12.0,
        mainAxisSpacing: 12.0,
        // scrollDirection: Axis.horizontal,//横向滚动
        children: _buildTiles(100));
  }
}

// 定义一个无状态组件 ViewDemo，这个组件将创建一个可以滚动的页面视图
class PageViewBuilderDemo extends StatelessWidget {
  Widget _pageItemBuilder(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                posts[index].title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                posts[index].author,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  // 构造函数，key 是组件的标识
  const PageViewBuilderDemo({Key? key}) : super(key: key);

  // 重写 build 方法，用于构建组件
  @override
  Widget build(BuildContext context) {
    // 创建一个页面视图，用户可以在不同的子页面间滑动
    return PageView.builder(
      itemCount: posts.length,
      itemBuilder: _pageItemBuilder,
    );
  }
}

class PageViewDemo extends StatelessWidget {
  const PageViewDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      // pageSnapping: false, // 如果设为 false，当用户停止滑动时，页面将不会对齐到最近的页面边界
      // reverse: true, // 如果设为 true，页面滑动的方向将反向（从右向左）

      // 指定滚动方向为水平方向
      scrollDirection: Axis.horizontal,

      // 当页面改变时打印当前页面索引
      onPageChanged: (currentPage) => debugPrint('Page: $currentPage'),

      // 控制页面视图的显示
      controller: PageController(
        // 指定初始化时显示的页面索引
        initialPage: 1,

        // 控制页面是否记录用户访问过的页面，以便下次滑动回来时仍然显示
        keepPage: false,

        // 控制每个页面在视口中显示的占比
        // viewportFraction: 0.85,
      ),

      // 定义子页面
      children: <Widget>[
        // 第一页
        Container(
          // 页面背景色
          color: Colors.brown[900],

          // 居中对齐的文本
          alignment: const Alignment(0.0, 0.0),
          child: const Text('ONE',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),

        // 第二页
        Container(
          color: Colors.grey[900],
          alignment: const Alignment(0.0, 0.0),
          child: const Text('TWO',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),

        // 第三页
        Container(
          color: Colors.blueGrey[900],
          alignment: const Alignment(0.0, 0.0),
          child: const Text('THREE',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
      ],
    );
  }
}
