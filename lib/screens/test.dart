import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // body: SafeArea(
        // child: Column(
        //   children: <Widget>[
        //     ExpansionTileCard(
        //       title: Text('Title Field'),
        //       subtitle: Text("Subtitle Field"),
        //       children: <Widget>[
        //         Divider(
        //           thickness: 1.0,
        //           height: 1.0,
        //         ),
        //         Text("Description Here"),
        //         Text('data'),
        //       ],
        //     )
        //   ],
        // ),
        // ),
        );
  }
}
