import 'package:flutter/material.dart';
import 'package:ortalam_hesapla_2/SabitElemanlar/sabitler.dart';

class OrtalamaWidget extends StatelessWidget {
  final int dersSayisi;
  final double ortalama;
  const OrtalamaWidget(
      {required this.dersSayisi, required this.ortalama, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          dersSayisi > 0 ?"Ders Sayısı $dersSayisi" : "Ders Sayısı 0",
          style: Sabitler.textStili,
        ),
        Text(
          ortalama > 0 ? "${ortalama.toStringAsPrecision(2)}" : "0.0",
          style: Sabitler.baslikStili,
        ),
        Text(
          "Ortalama",
          style: Sabitler.textStili,
        ),
      ],
    );
  }
}
