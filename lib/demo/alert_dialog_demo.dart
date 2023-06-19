import 'package:flutter/material.dart';
import 'dart:async';

enum Action {
  Ok,
  Cancel
}

class AlertDialogDemo extends StatefulWidget {
  const AlertDialogDemo({super.key});

  @override
  _AlertDialogDemoState createState() => _AlertDialogDemoState();
}

class _AlertDialogDemoState extends State<AlertDialogDemo> {
  String _choice = 'Nothing';
  
  //メソッドはAlertDialogを開くためのメソッドです。
  Future _openAlertDialog() async {
    final action = await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) { //テキストとボタンが含まれる画面のレイアウトが作成されます
        return AlertDialog(
          title: Text('AlertDialog'),
          content: Text('確定ですか'),
          actions: <Widget>[
            TextButton(
              child: Text('取り消し'),
              onPressed: () {
                Navigator.pop(context, Action.Cancel);
              },
            ),
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.pop(context, Action.Ok);
              },
            ),
          ],
        );
      },
    );

    switch (action) {
      case Action.Ok:
        setState(() {
          _choice = 'Ok';
        });
        break;
      case Action.Cancel:
        setState(() {
          _choice = 'Cancel';
        });
        break;
      default:
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlertDialogDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('選択されたのは: $_choice'),
            SizedBox(height: 16.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  child: Text('AlertDialogを開く'),
                  onPressed: _openAlertDialog,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}