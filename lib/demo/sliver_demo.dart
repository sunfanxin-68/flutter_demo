import 'package:flutter/material.dart';
import '../model/post.dart';

class SliverDemo extends StatelessWidget {
  const SliverDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // 返回一个Scaffold，表示页面的基本结构
    return Scaffold(
      // 使用CustomScrollView创建一个可以滚动的视图
      body: CustomScrollView(
        // slivers是一个数组，可以添加各种可以滚动的部件
        slivers: <Widget>[
          // SliverAppBar是一个可以展开和收缩的AppBar
          SliverAppBar(
            // floating属性表示当向下滚动时，SliverAppBar是否可以立即显示
            floating: true,
            // 当AppBar展开时，其高度
            expandedHeight: 178.0,
            // AppBar展开时显示的部件
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'dreaMTank Flutter'.toUpperCase(),
                style: const TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              // AppBar展开时的背景图片
              background: Image.network(
                'https://newscast.jp/attachments/CwHucVg9fdpSorO2UUfA.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
         // SliverSafeArea能够将子部件限制在安全的可视范围内
         const SliverSafeArea(
            sliver: SliverPadding(
              // padding表示内边距
              padding: EdgeInsets.all(8.0), 
              // SliverPadding可以给其子部件添加填充
              sliver: SliverListDemo()
            ),
          ),
        ],
      ),
    );
  }
}

class SliverListDemo extends StatelessWidget {
  const SliverListDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // SliverList可以展示一个列表
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        // 使用builder模式创建列表项
        (BuildContext context, int index) {
          return Padding(
            // 每个列表项下方都有一个高为32的空白区域
            padding: const EdgeInsets.only(bottom: 32.0),
            // 使用Material部件包裹列表项，给列表项添加阴影和圆角
            child: Material(
             // borderRadius表示圆角的大小
             borderRadius: BorderRadius.circular(12.0),
             // clipBehavior为Clip.antiAlias能够剪裁超过部件边界的子部件，使子部件也显示为圆角
             clipBehavior: Clip.antiAlias, 
              // elevation表示阴影的大小
              elevation: 14.0,
              // shadowColor表示阴影的颜色，这里给出了一个半透明的灰色
              shadowColor: Colors.grey.withOpacity(0.5),
              child: Stack(
                children: <Widget>[
                  // AspectRatio部件可以调整子部件的宽高比
                  AspectRatio(
                    aspectRatio: 16/9,
                    child: Image.network(
                      posts[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // Positioned部件可以调整子部件的位置
                  Positioned(
                    top: 32.0,
                    left: 32.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          posts[index].title,
                          style: const TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                          ),
                        ),
                        Text(
                          posts[index].author,
                          style: const TextStyle(
                            fontSize: 13.0,
                            color: Colors.white
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
          
        },
        // 列表项的数量
        childCount: posts.length,
      ),
    );
  }
}


class SliverGridDemo extends StatelessWidget {
  const SliverGridDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // SliverGrid可以创建一个网格视图
    return SliverGrid(
      // gridDelegate用于控制网格的布局
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        // crossAxisCount表示每行的列数
        crossAxisCount: 1,
        // crossAxisSpacing表示列间距
        crossAxisSpacing: 8.0,
        // mainAxisSpacing表示行间距
        mainAxisSpacing: 8.0,
        // childAspectRatio表示子部件的宽高比
        childAspectRatio: 1.0,
      ),
      // 使用builder模式创建网格项
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          );
        },
        // 网格项的数量
        childCount: posts.length,
      ),
    );
  }
}
