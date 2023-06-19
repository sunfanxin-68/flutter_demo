import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  const ChipDemo({super.key});

  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = [
    'Apple',
    'Banana',
    'Lemon',
  ];

  String _action = 'Nothing';
  List<String> _selected = [];
  String _choice = 'Lemon';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ChipDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              spacing: 8.0,
              runSpacing: 14.0,
              children: <Widget>[
                const Chip(
                  label: Text('Life'),
                ),
                // SizedBox(width: 10.0,),
                Chip(
                  label: Text('Sunset'),
                  backgroundColor: Colors.orange,
                ),
                // SizedBox(width: 10.0,),
                Chip(
                  label: Text('third'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text('3'),
                  ),
                ),
                //SizedBox(width: 8.0,),
                const Chip(
                  label: Text('fourth'),
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://global-uploads.webflow.com/5c95072393140f36ecc22e60/6390bf4af43ebc3b8ce6f57d_1680x882howtoAproach2%20(1).png'),
                  ),
                ),
                Chip(
                  label: Text('city'),
                  onDeleted: () {},
                  deleteIcon: Icon(Icons.delete),
                  deleteIconColor: Colors.redAccent,
                  deleteButtonTooltipMessage: 'このタグを削除する',
                ),
                const Divider(
                  color: Colors.grey,
                  height: 32.0,
                  // indent: 32.0,
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return Chip(
                      label: Text(tag),
                      onDeleted: () {
                        setState(() {
                          _tags.remove(tag);
                        });
                      },
                    );
                  }).toList(),
                ),
              ],
            ),
            const Divider(
              color: Colors.grey,
              height: 32.0,
              // indent: 32.0,
            ),
            SizedBox(
              width: double.infinity,
              child: Text('ActionChip: $_action'),
            ),
            Wrap(
              spacing: 8.0,
              children: _tags.map((tag) {
                return ActionChip(
                  label: Text(tag),
                  onPressed: () {
                    setState(() {
                      _action = tag;
                    });
                  },
                );
              }).toList(),
            ),
            Divider(
              color: Colors.grey,
              height: 32.0,
              // indent: 32.0,
            ),
            Container(
              width: double.infinity,
              child: Text('FilterChip: ${_selected.toString()}'),
            ),
            Wrap(
              spacing: 8.0,
              children: _tags.map((tag) {
                return FilterChip(
                  label: Text(tag),
                  selected: _selected.contains(tag),
                  onSelected: (value) {
                    setState(() {
                      if (_selected.contains(tag)) {
                        _selected.remove(tag);
                      } else {
                        _selected.add(tag);
                      }
                    });
                  },
                );
              }).toList(),
            ),
            Divider(
              color: Colors.grey,
              height: 32.0,
              // indent: 32.0,
            ),
            Container(
              width: double.infinity,
              child: Text('ChoiceChip: $_choice'),
            ),
            Wrap(
              spacing: 8.0,
              children: _tags.map((tag) {
                return ChoiceChip(
                  label: Text(tag),
                  selectedColor: Colors.blue,
                  selected: _choice == tag,
                  onSelected: (value) {
                    setState(() {
                      _choice = tag;
                    });
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.restore),
        onPressed: () {
          setState(() {
            _tags = [
              'りんご',
              'バナナ',
              'レモン',
            ];
            _selected = [];

            _choice = 'Lemon';
          });
        },
      ),
    );
  }
}
