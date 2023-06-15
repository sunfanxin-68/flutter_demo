import 'package:flutter/material.dart';
import 'package:flutter_0610/demo/drawer_demo.dart';
import 'package:flutter_0610/demo/BottomNavigationBarDemo.dart'; 
import 'package:flutter_0610/demo/listview_demo.dart';
//import 'package:flutter_0610/demo/basic_demo.dart';
import 'package:flutter_0610/demo/layout_demo.dart';
import 'package:flutter_0610/demo/View_demo.dart';
import 'package:flutter_0610/demo/sliver_demo.dart';
import 'package:flutter_0610/demo/navigator_demo.dart' as demo; 
import 'package:flutter_0610/demo/form_demo.dart';
import 'package:flutter_0610/demo/material_components.dart';



void main() {
  runApp(App()); // 主函数，程序入口
}

class App extends StatelessWidget {
  // App组件，无状态组件
  @override
  Widget build(BuildContext context) {
    // 实现构建方法
    return MaterialApp(
        // 返回一个MaterialApp组件，为应用程序顶级组件
        // home: const NavigatorDemo(),
        initialRoute: '/mdc',
        routes: {
          '/': (context) =>  const Home(),
          '/about': (context) => demo.Page(title: 'About'),  // 使用了正确的构造函数语法
           '/form': (context) => const FormDemo(),
           '/mdc': (context) => const MaterialComponents(),
          },
        theme: ThemeData(
          // 设置主题
          primarySwatch: Colors.orange, // 主题颜色
          highlightColor: Color.fromARGB(123, 36, 255, 200), // 高亮颜色
          splashColor: const Color.fromARGB(179, 10, 102, 200), // 波纹颜色
          hintColor: const Color.fromRGBO(3, 54, 255, 1.0), // 提示颜色
           colorScheme: ColorScheme.fromSwatch(
           primarySwatch: Colors.orange,
             ).copyWith(
                secondary: Colors.blue,
                )
        )
     );
  }
}

class Home extends StatelessWidget {
  // Home组件，无状态组件
  const Home({Key? key}) : super(key: key); // 构造函数

  @override
  Widget build(BuildContext context) {
    // 实现构建方法
    return DefaultTabController(
      // 标签控制器
      length: 4, // 标签数量
      child: Scaffold(
        // 脚手架组件，用于页面布局
        backgroundColor: const Color.fromARGB(255, 245, 245, 245), // 页面背景颜色
        appBar: AppBar(
          // 顶部应用栏  menu按钮自己打开抽屉了
          // leading: IconButton( // 左侧菜单按钮
          //   icon: const Icon(Icons.menu), // 菜单图标
          //   tooltip: 'Navigration', // 提示文字
          //   onPressed: () => debugPrint('okkk'), // 点击事件，打印日志
          // ),
          title: const Text('dreaMTank'), // 标题
          actions: <Widget>[
            // 右侧操作按钮列表
            IconButton(
              icon: const Icon(Icons.search), // 搜索按钮
              tooltip: 'Search', // 提示文字
              onPressed: () =>
                  debugPrint('Search button is pressed.'), // 点击事件，打印日志
            ),
            IconButton(
              icon: const Icon(Icons.more_horiz), // 更多按钮
              tooltip: 'more_horiz', // 提示文字
              onPressed: () =>
                  debugPrint('more button is pressed.'), // 点击事件，打印日志
            )
          ],
          elevation: 0.0, // 应用栏阴影
          bottom: const TabBar(
              // 应用栏底部的标签栏
              unselectedLabelColor: Colors.black38, // 未选中标签颜色
              indicatorColor: Colors.black54, // 指示器颜色
              indicatorSize: TabBarIndicatorSize.label, // 指示器大小
              indicatorWeight: 1.0, // 指示器粗细
              tabs: <Widget>[
                // 标签列表
                Tab(icon: Icon(Icons.local_florist)), // 第一个标签
                Tab(icon: Icon(Icons.local_activity)), // 第二个标签
                Tab(icon: Icon(Icons.local_see_sharp)), // 第三个标签
                Tab(icon: Icon(Icons.view_quilt)), // 第４个标签
              ]),
        ),
        body: const TabBarView(
          // 主体部分，标签视图
          children: <Widget>[
            ListViewDemo(),
            ViewDemo(),
            // BasicDemo(),
            LayoutDemo(),
            SliverDemo(),
          ],
        ),
        drawer: const DrawerDemo(),
        bottomNavigationBar: const BottomNavigationBarDemo(),
      ),
    );
  }
}
