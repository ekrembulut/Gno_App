import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:ortalam_hesapla_2/Helper/dersler.dart';

class MyData {
  static List<Dersler> dersler = [];
  static void dersEkleyici(Dersler ders) {
    dersler.add(ders);
  }

  static double ortalamaHesaplayici() {
    int toplamKredi = 0;
    double toplamHarfNotu = 0;
    dersler.forEach((element) {
      toplamKredi = toplamKredi + element.kredi;
      toplamHarfNotu = toplamHarfNotu + (element.kredi * element.ortalama);
    });
    return toplamHarfNotu / toplamKredi;
  }

  static List<String> harfler = [
    "AA",
    "BA",
    "BB",
    "CB",
    "CC",
    "DC",
    "DD",
    "FD",
    "FF"
  ];
  static double harfToNot(String data) {
    switch (data) {
      case "AA":
        return 4.0;
      case "BA":
        return 3.5;
      case "BB":
        return 3.0;
      case "CB":
        return 2.5;
      case "CC":
        return 2.0;
      case "DC":
        return 1.5;
      case "DD":
        return 1.0;
      case "FD":
        return 0.5;
      case "FF":
        return 0.0;
      default:
        return 1;
    }
  }

  static List<DropdownMenuItem<double>> myDropDown() {
    return harfler
        .map((e) => DropdownMenuItem(
              child: Text(e),
              value: harfToNot(e),
            ))
        .toList();
  }

  static List<DropdownMenuItem<int>> dropDownKredi() {
    return krediListesi()
        .map((e) => DropdownMenuItem(
              child: Text(e.toString()),
              value: e,
            ))
        .toList();
  }

  static List<int> krediListesi() {
    return List.generate(10, ((index) => index + 1));
  }
}
