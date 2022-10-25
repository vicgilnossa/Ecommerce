import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InputDecorations {
  static InputDecoration authInputDecoration({
    required final String hintText,
    required final String labelText,
  }) {
    return InputDecoration(
      filled: true,
      fillColor: Color(0xffF1F1F4),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
        color: Colors.white,
      )),
      focusedBorder:
          const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      hintText: hintText,
      labelText: labelText,
      labelStyle: GoogleFonts.poppins(
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w500,
          fontSize: 12,
          color: const Color(0xff313C58)),
    );
  }
}
