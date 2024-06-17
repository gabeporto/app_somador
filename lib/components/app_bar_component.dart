import 'package:flutter/material.dart';

AppBar appBar() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(1.0),
          child: Image.asset(
            'assets/images/logo.jpeg',
            height: 35,
          ),
        ),
        const SizedBox(width: 10),
        const Text('Somador'),
      ],
    ),
    automaticallyImplyLeading: false,
    backgroundColor: Colors.blue,
    foregroundColor: Colors.white,
  );
}
