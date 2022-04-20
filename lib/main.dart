import 'package:flutter/material.dart';
import 'package:ortalam_hesapla_2/SabitElemanlar/sabitler.dart';
import 'package:ortalam_hesapla_2/Widgets/anasayfa.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Sabitler.anaRenk,
      ),
      home: AnaSayfa(),
    );
  }
}
