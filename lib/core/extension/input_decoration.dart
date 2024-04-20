import 'package:flutter/material.dart';

abstract class MainInputDecoration {
  static InputDecoration get inputDecoration => InputDecoration(
        fillColor: Colors.grey[200], // Hafif gri renk
        filled: true,
        isDense: true,
        labelStyle: TextStyle(color: Colors.grey[400]), // Label text color
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Padding
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(10), // Köşeleri yuvarlak bir border
          borderSide: BorderSide.none, // Kenar çizgisini kaldır
        ),
        hintStyle: TextStyle(color: Colors.grey[400]), // Placeholder text color
      );
}
