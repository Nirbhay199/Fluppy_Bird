import 'package:flutter/material.dart';

import 'latout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'fluppy bird Demo',
      home: getlay_out(),
    );
  }
}
