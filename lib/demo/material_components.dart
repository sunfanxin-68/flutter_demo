import 'package:flutter/material.dart';
import './Button_demo.dart';
import './Floating_action_button_demo.dart';
import './popup_menu_button_demo.dart';

class MaterialComponents extends StatelessWidget {
  const MaterialComponents({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaterialComponents'),
        elevation: 0.0,
      ),
      body: ListView(
        children: const <Widget>[
          ListItem(title: 'PopupMenuButton',page: PopupMenuButtonDemo(),),
          ListItem(title: 'Button',page: ButtonDemo(), ),
          ListItem(title: 'FloatingActionButton',page: FloatingActionButtonDemo(),
          ),
        ],
      ),
    );
  }
}



class _WidgetDemo extends StatelessWidget {
  const _WidgetDemo({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('_WidgetDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[],
              )
            ]),
      ),
    );
  }
}



class ListItem extends StatelessWidget {
  const ListItem({Key? key, required this.title, required this.page});
  final String title;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
