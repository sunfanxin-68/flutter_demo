import 'package:flutter/material.dart';

class CheckboxDemo extends StatefulWidget {
  const CheckboxDemo({Key? key});

  @override
  _CheckboxDemoState createState() => _CheckboxDemoState();
}

class _CheckboxDemoState extends State<CheckboxDemo> {
  bool _checkboxItemA = true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CheckboxDemo'), // タイトルバーに表示されるテキスト
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CheckboxListTile(
              value: _checkboxItemA, // チェックボックスの選択状態
              onChanged: (value) { // チェックボックスの状態が変更された時のコールバック
                setState(() {
                  _checkboxItemA = value!;
                });
              },
              title: const Text('Checkbox Item A'), // チェックボックスのタイトル
              subtitle: const Text('Description'), // チェックボックスのサブタイトル
              secondary: const Icon(Icons.bookmark), // チェックボックスのサブタイトルの前に表示されるアイコン
              selected: _checkboxItemA, // チェックボックスが選択された状態かどうか
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Checkbox(
                //   value: _checkboxItemA,
                //   onChanged: (value) {
                //     setState(() {
                //       _checkboxItemA = value;
                //     });
                //   },
                //   activeColor: Colors.black,
                // ),
              ],
            ),
          ],
        ),
      )
    );
  }
}
