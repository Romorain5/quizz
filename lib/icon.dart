import 'package:flutter/material.dart';

Icon getIcon(bool) {
  if (bool) {
    return Icon(
      Icons.check,
      color: Colors.green,
    );
  } else {
    return Icon(
      Icons.close,
      color: Colors.red,
    );
  }
}
