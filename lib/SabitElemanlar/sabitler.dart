import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler {
  static MaterialColor anaRenk = Colors.indigo;
  static Color ikincilRenk = Color.fromRGBO(29, 92, 99, 0.3);
  static TextStyle baslikStili = GoogleFonts.lato(
    color: anaRenk,
    fontSize: 48,
    fontWeight: FontWeight.w900,
  );
  static TextStyle fontStili = GoogleFonts.lato(
    color: anaRenk,
    fontSize: 32,
    fontWeight: FontWeight.w900,
  );
  static TextStyle textStili = GoogleFonts.lato(
    color: anaRenk,
    fontSize: 16,
    fontWeight: FontWeight.w900,
  );
  static BorderRadius mainBorder = BorderRadius.circular(24);
}
