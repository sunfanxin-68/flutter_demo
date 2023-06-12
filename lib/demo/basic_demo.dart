import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {
  const BasicDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text('布局相关组件Container：一个组合类容器，可以同时包含其他组件，如 padding、margin、背景色等。Row、Column：它们都接收一个子组件的数组（List<Widget>）。Row 为水平布局，Column 为垂直布局。Stack：可以叠加多个子组件。');
    
  }
}
