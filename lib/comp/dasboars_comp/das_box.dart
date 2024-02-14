import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DasBox extends StatelessWidget {
  final String val;
  final String valName;
  DasBox({super.key, required this.valName, required this.val});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xCCFFFFFF),
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          height: 100,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() => FittedBox(
                  child: Text(
                    val,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )),
                Text(
                  valName,
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.blueGrey
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
