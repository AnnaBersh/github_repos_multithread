import 'package:flutter/material.dart';

import 'palette.dart';

const fontFamily = 'Montserrat Alternates';

class Styles {
  Styles._();

  //MainGreen
  static const s12MainGreenW500 = TextStyle(
    color: Palette.mainGreen,
    fontWeight: FontWeight.w500,
    fontSize: 12.0,
  );

  static const s14MainGreenW700 = TextStyle(
    color: Palette.mainGreen,
    fontWeight: FontWeight.w700,
    fontSize: 14.0,
  );

  static const s18MainGreenW800 = TextStyle(
    color: Palette.mainGreen,
    fontWeight: FontWeight.w800,
    fontSize: 18.0,
  );

  //Gray
  static const s14TextGrayW500Ital = TextStyle(
    color: Palette.textGray80,
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
    fontStyle: FontStyle.italic,
  );

  static const s16TextGrayW700 = TextStyle(
    color: Palette.textGray80,
    fontWeight: FontWeight.w700,
    fontSize: 16.0,
  );

  static const s18TextGrayW700 = TextStyle(
    color: Palette.textGray80,
    fontWeight: FontWeight.w700,
    fontSize: 18.0,
  );
}
