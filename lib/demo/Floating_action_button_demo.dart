import 'package:flutter/material.dart';

class FloatingActionButtonDemo extends StatelessWidget {
  const FloatingActionButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget floatingActionButton = FloatingActionButton(
      onPressed: () {},
      elevation: 0.0,
      child: const Icon(Icons.add),
      backgroundColor: Colors.orange,
      // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
    );

    final Widget _floatingActionButtonExtended = FloatingActionButton.extended(
      onPressed: () {},
      icon: Icon(Icons.add),
      label: Text('プラス'),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('FloatingActionButtonDemo'),
        elevation: 0.0,
      ),
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80.0,
        ),
        shape: const CircularNotchedRectangle(),
      ),
    );
  }
}