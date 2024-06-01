import 'package:flutter/material.dart';
import 'package:flutter_reto002/pages/correos_page.dart';

void main() {
  runApp(MaterialApp(
     theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    home: CorreosPage(),
    debugShowCheckedModeBanner: false,
  ));
}