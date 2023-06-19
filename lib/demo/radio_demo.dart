import 'package:flutter/material.dart';

class RadioDemo extends StatefulWidget {
  const RadioDemo({Key? key});

  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int _radioGroupA = 0;
  
  // 単一選択ボタンの値が変更された時のコールバック関数
  void _handleRadioValueChanged(int? value) {
    setState(() {
      _radioGroupA = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RadioDemo'), // ページのタイトルバー
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('RadioGroupValue: $_radioGroupA'), // 選択された単一選択ボタンの値を表示
            const SizedBox(height: 32.0),
            RadioListTile(
              value: 0, // 単一選択ボタンの値
              groupValue: _radioGroupA, // 現在の選択された単一選択ボタンの値
              onChanged: _handleRadioValueChanged, // 値が変更された時のコールバック関数
              title: const Text('オプション A'), // 単一選択ボタンのテキスト
              subtitle: const Text('説明'), // 単一選択ボタンのサブタイトル
              secondary: const Icon(Icons.filter_1), // 単一選択ボタンのアイコン
              selected: _radioGroupA == 0, // その単一選択ボタンが選択されているかどうか
            ),
            RadioListTile(
              value: 1, // 単一選択ボタンの値
              groupValue: _radioGroupA, // 現在の選択された単一選択ボタンの値
              onChanged: _handleRadioValueChanged, // 値が変更された時のコールバック関数
              title: const Text('オプション B'), // 単一選択ボタンのテキスト
              subtitle: const Text('説明'), // 単一選択ボタンのサブタイトル
              secondary: const Icon(Icons.filter_2), // 単一選択ボタンのアイコン
              selected: _radioGroupA == 1, // その単一選択ボタンが選択されているかどうか
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Radio(
                //   value: 0,
                //   groupValue: _radioGroupA,
                //   onChanged: _handleRadioValueChanged,
                //   activeColor: Colors.black,
                // ),
                // Radio(
                //   value: 1,
                //   groupValue: _radioGroupA,
                //   onChanged: _handleRadioValueChanged,
                //   activeColor: Colors.black,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
