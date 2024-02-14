import 'package:flutter/material.dart';

class AppbarComp extends StatelessWidget {
  final String dName;
  AppbarComp({super.key, required this.dName});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const FittedBox(
        child: Text(
          'Tinkerers Lab',
          style: TextStyle(
            fontFamily: 'Archivo Black',
            color: Colors.white,
            fontSize: 10,
          ),
        ),
      ),
      subtitle: Text(
        dName,
        style: const TextStyle(
          color: Color(0xCCFF6C00),
        ),
      ),
    );
  }
}
