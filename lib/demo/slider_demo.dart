import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  const SliderDemo({super.key});

  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double _sliderItemA = 0.0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SliderDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Slider(
                  value: _sliderItemA,//現在の値
                  onChanged: (value) {
                    setState(() {
                      _sliderItemA = value;// 値が変更されたときの処理
                    });
                  },
                 activeColor: Colors.blue, // アクティブな状態での色
                    inactiveColor: Theme.of(context).colorScheme.secondary.withOpacity(0.3), // 非アクティブな状態での色
                    min: 0.0, // 最小値
                    max: 100.0, // 最大値
                    divisions: 10, // 分割数
                    label: '${_sliderItemA.toInt()}', // ラベルとして表示される値
                    )
              ],
            ),
            SizedBox(height: 16.0,),
            Text('SliderValue: $_sliderItemA'),
          ],
        ),
      )
    );
  }
}