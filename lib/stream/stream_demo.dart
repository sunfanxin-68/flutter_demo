import 'package:flutter/material.dart';
import 'dart:async';

class StreamDemo extends StatelessWidget {
  const StreamDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
        elevation: 0.0,
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  StreamSubscription? _streamDemoSubscription;
  late StreamController<String> _streamDemo;
  late StreamSink _sinkDemo;
  late  String _data = '...';

  @override
  State<StreamDemoHome> createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  @override
  void dispose() {
    widget._streamDemo.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    print('Streamを作成する');
    // Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    //widget._streamDemo = StreamController<String>();
    widget._streamDemo = StreamController.broadcast();
    widget._sinkDemo = widget._streamDemo.sink;

    print('Stream監視を始めます');
    widget._streamDemoSubscription = widget._streamDemo.stream
        .listen(onData, onError: onError, onDone: onDone); //監視

    widget._streamDemo.stream
        .listen(onDataTwo, onError: onError, onDone: onDone);

    print('初期化完成');
  }

  void onDone() {
    print('データあるから、Done!終わったよ！');
  }

  void onError(error) {
    print('エラーだよ:$error');
  }

  void onData(String data) {
    setState(() {
     widget._data = data;
    });
    print('$data');
  }

  void onDataTwo(String data) {
    print('onDataTwo:$data');
  }

  void _pauseStream() {
    print('Pause subscription');
    widget._streamDemoSubscription?.pause();
  }

  void _resumeStream() {
    print('Resume subscription');
    widget._streamDemoSubscription?.resume();
  }

  void _cancelStream() {
    print('Cancel subscription');
    widget._streamDemoSubscription?.cancel();
  }

  void _addDataToStream() async {
    print('データをStreamに追加する');
    String data = await fetchData();
    // widget._streamDemo.sink.add(data);
    widget._sinkDemo.add(data);
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    //throw '何かエラーが出てる';
    return 'hello ~5秒経ったよ';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Text(_data),
            StreamBuilder(
              stream: widget._streamDemo.stream,
              initialData: '初期化データー',
              builder: (context, snapshot) {
                return Text('${snapshot.data}');
              },
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: Text('Add'),
                onPressed: _addDataToStream,
              ),
              ElevatedButton(
                child: Text('Pause'),
                onPressed: _pauseStream,
              ),
              ElevatedButton(
                child: Text('Resume'),
                onPressed: _resumeStream,
              ),
              ElevatedButton(
                child: Text('Cancel'),
                onPressed: _cancelStream,
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
