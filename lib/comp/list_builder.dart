import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/controller/bt_controller.dart';
import 'package:untitled/pages/dasboard_page.dart';

class ListBuilder extends StatelessWidget {
  ListBuilder({super.key});

  BtController bt = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
      shrinkWrap: true,
      itemCount: bt.pairedDevices.length,
      itemBuilder: (context, index){
        return ListTile(
          onTap: () {
            bt.connectBtDevice(bt.pairedDevices[index].address);
            Get.to(DasboardPage(dName: bt.pairedDevices[index].name.toString()));
          },
          leading: const Icon(Icons.bluetooth),
          title: Text(
            bt.pairedDevices[index].name.toString()
                ?? bt.pairedDevices[index].address.toString(),
          ),
        );
      },
    ));
  }
}
