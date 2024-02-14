import 'package:flutter/material.dart';
import 'package:untitled/comp/main_intro.dart';
import 'package:untitled/comp/main_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF341E78),
      body: Column(
        children: [
          MainInro(),
          MainList(),
        ],
      ),
    );
  }
}
