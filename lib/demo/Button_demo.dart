import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({Key? key});

  @override
  Widget build(BuildContext context) {
    final Widget floatingActionButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          onPressed: () {},
          child: Text('Button', style: TextStyle(color: Colors.white)),
        ),
        ElevatedButton.icon(
          icon: Icon(Icons.add_a_photo),
          label: Text('button2'),
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            textStyle: TextStyle(color: Colors.white),
            side: const BorderSide(color: Colors.green),
          ),
        )
      ],
    );

    final Widget elevatedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          child: Text('Buttton'),
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color.fromARGB(255, 36, 4, 167),
            foregroundColor: Colors.white,
            side: const BorderSide(color: Colors.orange),
            // shape: BeveledRectangleBorder(
            //   borderRadius: BorderRadius.circular(5.0),
            // ),
            shape: StadiumBorder(),
            elevation: 0.0,
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        ElevatedButton.icon(
          icon: Icon(Icons.ac_unit_sharp),
          label: Text('Buttton'),
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            foregroundColor: Colors.white,
            elevation: 12.0,
          ),
        ),
      ],
    );

    final Widget fixedWidthButtonDemo = Container(
      width: 130.0,
      child: OutlinedButton(
        onPressed: () {},
        style: ButtonStyle(
          side: MaterialStateProperty.all(BorderSide(color: Colors.black)),
          foregroundColor: MaterialStateProperty.all(Colors.black),
          overlayColor: MaterialStateProperty.all(Colors.grey[100]),
        ),
        child: const Text('OutlinedButton'),
      ),
    );

    final Widget expandedButtonDemo = Row(
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              side: const BorderSide(
                color: Colors.black,
              ),
              foregroundColor: Colors.black,
            ),
            child: const Text('Button'),
          ),
        ),
        SizedBox(width: 16.0),
        Expanded(
          flex: 2,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              side: const BorderSide(
                color: Colors.black,
              ),
              foregroundColor: Colors.black,
            ),
            child: const Text('Button'),
          ),
        ),
      ],
    );

      return Scaffold(
      appBar: AppBar(
        title: const Text('ButtonDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            floatingActionButtonDemo,
            elevatedButtonDemo,
            fixedWidthButtonDemo,
            expandedButtonDemo,
            
          ],
        ),
      ),
    );
  }
}