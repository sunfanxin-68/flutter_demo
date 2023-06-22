import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AnimationDemo'),
          elevation: 0.0,
        ),
        body: AnimationDemoHome());
  }
}

class AnimationDemoHome extends StatefulWidget {
  const AnimationDemoHome({super.key});

  @override
  State<AnimationDemoHome> createState() => _AnimationDemoHomeState();
}

class _AnimationDemoHomeState extends State<AnimationDemoHome>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  late Animation animationColor;
  late CurvedAnimation curve;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      // value: 18.0,
      // lowerBound: 50.0,
      // upperBound: 300.0,
      duration: Duration(milliseconds: 3000),
      vsync: this,
    );

    curve =
        CurvedAnimation(parent: animationController, curve: Curves.bounceIn);
    animation = Tween(begin: 32.0, end: 300.0).animate(curve);
    animationColor = ColorTween(begin: Colors.orange, end: Colors.blue)
        .animate(curve);

    // animationController.addListener(() {
    //   // print('${animationController.value}');
    //   setState(() {});
    // });
    animationController.addStatusListener((AnimationStatus status) {
      print(status);
    });

    // animationController.forward();
  }

  @override
  void dispose() {
    super.dispose();

    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedHeart(
        animations: [
          animation,
          animationColor
        ],
       controller: animationController,
      
      ),
    );
  }
}

class AnimatedHeart extends AnimatedWidget {
  final List animations;
  final AnimationController controller;

  AnimatedHeart({
    required this.animations,
    required this.controller,
  }) : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.favorite),
      iconSize: animations[0].value,
      color: animations[1].value,
      onPressed: () {
        switch (controller.status) {
          case AnimationStatus.completed:
            controller.reverse();
            break;
          default:
            controller.forward();
        }
      },
    );
  }
}