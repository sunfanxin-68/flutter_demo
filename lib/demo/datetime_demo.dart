import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class DateTimeDemo extends StatefulWidget {
  @override
  const DateTimeDemo({super.key});

  _DateTimeDemoState createState() => _DateTimeDemoState();
}

class _DateTimeDemoState extends State<DateTimeDemo> {
  DateTime selectedDate = DateTime.now(); // 現在の日付を初期値とする
  TimeOfDay selectedTime = const TimeOfDay(hour: 8, minute: 55); // 8:55を初期値とする

  Future<void> _selectDate() async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: selectedDate, // 選択済みの日付を初期値とする
      firstDate: DateTime(1990), // 選択可能な最初の日付
      lastDate: DateTime(2030), // 選択可能な最後の日付
    );

    if (date == null) return; // キャンセル時は処理を終了

    setState(() {
      selectedDate = date; // 選択された日付を反映する
    });
  }

  Future<void> _selectTime() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: selectedTime, // 選択済みの時刻を初期値とする
    );
    if (time == null) return; // キャンセル時は処理を終了

    setState(() {
      selectedTime = time; // 選択された時刻を反映する
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DateTimeDemo'), // アプリバーのタイトル
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
                InkWell(
                  onTap: _selectDate, // 日付選択の処理を実行
                  child: Row(
                    children: <Widget>[
                      Text(DateFormat.yMMMMd().format(selectedDate)), // 選択された日付を表示
                      Icon(Icons.arrow_drop_down), // ドロップダウンアイコン
                    ],
                  ),
                ),
                InkWell(
                  onTap: _selectTime, // 時刻選択の処理を実行
                  child: Row(
                    children: <Widget>[
                      Text(selectedTime.format(context)), // 選択された時刻を表示
                      Icon(Icons.arrow_drop_down), // ドロップダウンアイコン
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

