import 'package:flutter/material.dart';
import 'welcome.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'shop app',
      theme: ThemeData(
        fontFamily: 'Suwannaphum-Regular'
      ),
      home: Welcome(),
    )
    );
}

