  import 'package:flutter/material.dart';

IconButton buttonCart(
      {required void Function()? onPressed, required IconData icon}) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }