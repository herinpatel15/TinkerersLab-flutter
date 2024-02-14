import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/bt_controller.dart';

class PairedTedt extends StatelessWidget {
  PairedTedt({super.key});

  BtController bt = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Paired Device',
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
          IconButton(onPressed: () => bt.getBtPairedDevice(), icon: const Icon(Icons.refresh, color: Colors.black,)),
        ],
      ),
    );
  }
}
