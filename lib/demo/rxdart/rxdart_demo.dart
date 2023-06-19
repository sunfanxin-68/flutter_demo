import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxDartDemo extends StatelessWidget {
  const RxDartDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDartDemo'),
        elevation: 0.0,
      ),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  late PublishSubject<String> _textFieldSubject;
  @override
  void initState() {
    super.initState();

    _textFieldSubject = PublishSubject<String>();
    _textFieldSubject
        .map((item) => 'map: $item')
       //.where((item) => item.length > 9)
       //.debounceTime(const Duration(milliseconds: 500) as Stream Function(String event))
        .listen((data) => print(data));
    

    //_textFieldSubject.close();

    //Stream<String> _stream =
    // Stream.fromIterable(['hello~~', 'こんにちはこんばんは']);
    // Stream.fromFuture(Future.value('hello ~Futureメソッド'));
    // Stream.fromIterable(['hello', 'これもできる']);
    //  Stream.value('hello ~justをvalueに変わった');
    //Stream.periodic(Duration(seconds: 1), (x) => x.toString());

    //_stream.listen(print);
    //PublishSubject<String> _subject = PublishSubject<String>();
    //BehaviorSubject<String> _subject = BehaviorSubject<String>();
    // ReplaySubject<String> _subject = ReplaySubject<String>(maxSize: 3);

    // _subject.add('hello');
    // _subject.add('hola');
    // _subject.add('hi');
    // _subject.listen((data) => print('listen 1: $data'));
    // _subject.listen((data) => print('listen 2: ${data.toUpperCase()}'));

    // _subject.close();
  }

  @override
  void dispose() {
    super.dispose();
    _textFieldSubject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.black,
      ),
      child: TextField(
        onChanged: (value) {
          _textFieldSubject.add('input: $value');
        },
        onSubmitted: (value) {
          _textFieldSubject.add('submit: $value');
        },
        decoration: const InputDecoration(
          labelText: 'Title',
          filled: true,
        ),
      ),
    );
  }
}
