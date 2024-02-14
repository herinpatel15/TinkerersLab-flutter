import 'package:flutter/material.dart';
import 'package:untitled/comp/list_builder.dart';
import 'package:untitled/comp/paired_text.dart';

class MainList extends StatelessWidget {
  const MainList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
            color: Color(0xCCFFFFFF),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            )
        ),
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 10,),
            PairedTedt(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Divider(
                height: 0,
                thickness: 1,
                color: Colors.black,
              ),
            ),
            ListBuilder(),
          ],
        ),
      ),
    );
  }
}

