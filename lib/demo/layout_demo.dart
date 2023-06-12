import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

 // 重写 build 方法，用于构建组件
  @override
  Widget build(BuildContext context) {
    // 返回一个容器，容器中有一个居中的列
    return Container(
      child: const Column(
        // 将子元素沿主轴方向居中
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // 添加 StackDemo 组件
          StackDemo(),
        ],
      ),
    );
  }
}

class ConstrainedBoxDemo extends StatelessWidget {
  const ConstrainedBoxDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // 返回一个容器，容器中有一个居中的列
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 200.0,
        maxWidth: 200.0,
      ),
      child: Container(
        color:const  Color.fromRGBO(3, 54, 255, 1.0),
      ),
    );
  }
}

// 定义一个无状态组件 AspectRatioDemo 用于展示有比例约束的容器
class AspectRatioDemo extends StatelessWidget {
  // 重写 build 方法，用于构建组件
  @override
  Widget build(BuildContext context) {
    // 返回一个具有特定宽高比的容器
    return AspectRatio(
      // 设置宽高比
      aspectRatio: 16.0 / 9.0,
      // 容器的子组件
      child: Container(
        // 容器的颜色
        color:const  Color.fromRGBO(3, 54, 255, 1.0),
      ),
    );
  }
}


class StackDemo extends StatelessWidget {
  const StackDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        SizedBox(
          width: 200.0,
          height: 300.0,
          child: Container(
            alignment: Alignment(0.0, -0.9),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(3, 54, 255, 1.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
        const SizedBox(
          height: 32.0,
        ),
        SizedBox(
          width: 100.0,
          height: 100.0,
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromRGBO(3, 54, 255, 1.0),
              shape: BoxShape.circle,
              gradient: RadialGradient(colors: [
                Color.fromRGBO(7, 102, 255, 1.0),
                Color.fromRGBO(3, 54, 255, 1.0),
              ]),
            ),
            child:const  Icon(Icons.brightness_2, color: Colors.white, size: 32.0),
          ),
        ),
       const  Positioned(
          right: 20.0,
          top: 20.0,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0),
        ),
       const  Positioned(
          right: 40.0,
          top: 60.0,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 18.0),
        ),
        const Positioned(
          right: 20.0,
          top: 120.0,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 20.0),
        ),
        const Positioned(
          right: 70.0,
          top: 180.0,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0),
        ),
        const Positioned(
          right: 30.0,
          top: 230.0,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 18.0),
        ),
        const Positioned(
          right: 90.0,
          bottom: 20.0,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0),
        ),
        const Positioned(
          right: 4.0,
          bottom: -4.0,
          child: Icon(Icons.ac_unit, color: Colors.white, size: 16.0),
        ),
      ],
    );
  }
}

class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;

  IconBadge(this.icon, {this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(icon, size: size, color: Colors.white),
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}
