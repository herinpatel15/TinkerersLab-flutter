import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/comp/dasboars_comp/appbar_comp.dart';
import 'package:untitled/controller/bt_controller.dart';
import 'package:bluetooth_classic/models/device.dart';

class DasboardPage extends StatelessWidget {
  final String dName;
  DasboardPage({super.key, required this.dName});

  BtController bt = Get.find();

  Color bgColor = Color(0xFF341E78);
  Color hiColor = Color(0xCCFF6C00);

  final double tempFont = 18;

  // convert HH:MM:SS format function
  String formatMilliseconds(int milliseconds) {
    // Create a Duration object using the milliseconds
    Duration duration = Duration(milliseconds: milliseconds);

    // Extract hours, minutes, and seconds from the duration
    int hours = duration.inHours;
    int minutes = (duration.inMinutes % 60);
    int seconds = (duration.inSeconds % 60);

    // Format the time as "hh:mm:ss"
    String formattedTime =
        '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        iconTheme: IconThemeData(color: hiColor),
        title: AppbarComp(dName: dName,),
        actions: [
          Obx(() => IconButton(
              onPressed: () {
                (bt.deviceStatus == Device.connected)
                    ? bt.disconnectBtDevice()
                    : bt.connectBtDevice(bt.deviceAddress.toString());
              },
              icon: (bt.deviceStatus == Device.connected) ?
              Icon(Icons.bluetooth_disabled, color: Color(0xCCFF6C00),) :
              Icon(Icons.bluetooth, color: Color(0xCCFF6C00),),
          )),
          IconButton(onPressed: () => bt.btWriteData(), icon: Icon(Icons.file_copy_outlined, color: Color(0xCCFF6C00),))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xCCFFFFFF),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    height: 100,
                    // color: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() => FittedBox(
                            child: Text(
                              '${bt.val[0] ?? '0.0'} V',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),),

                          // const SizedBox(height: 5,),
                          const Text(
                            'voltage',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.blueGrey
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xCCFFFFFF),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    height: 100,
                    // color: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() => FittedBox(
                            child: Text(
                              '${bt.val[1] ?? '0.0'} A',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),),
                          // const SizedBox(height: 5,),
                          const Text(
                            'current',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.blueGrey
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xCCFFFFFF),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    height: 100,
                    // color: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() => FittedBox(
                            child: Text(
                              '${bt.val[2] ?? '0.0'} W',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),),
                          // const SizedBox(height: 5,),
                          const Text(
                            'Power',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.blueGrey
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xCCFFFFFF),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    height: 100,
                    // color: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() => FittedBox(
                            child: Text(
                              '${bt.val[3] ?? '0.0'} Ah',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),),
                          // const SizedBox(height: 5,),
                          const Text(
                            'Dis. Capacity',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.blueGrey
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xCCFFFFFF),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    height: 100,
                    // color: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() => FittedBox(
                            child: Text(
                              '${bt.val[4] ?? '0.0'} Wh',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),),
                          // const SizedBox(height: 5,),
                          const Text(
                            'Dis. Energy',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.blueGrey
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xCCFFFFFF),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    height: 100,
                    // color: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() => FittedBox(
                            child: Text(
                              '${bt.val[5] ?? '0.0'} km/h',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),),
                          // const SizedBox(height: 5,),
                          const Text(
                            'Speed',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.blueGrey
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xCCFFFFFF),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    height: 100,
                    // color: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() => FittedBox(
                            child: Text(
                              '${bt.val[6] ?? '0.0'} km',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),),
                          // const SizedBox(height: 5,),
                          const Text(
                            'Distance',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.blueGrey
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xCCFFFFFF),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    height: 100,
                    // color: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(() => FittedBox(
                            child: Text(
                              // '${bt.val[6] ?? '0.0'}',
                              formatMilliseconds(int.parse(bt.val[7]) ?? 0),
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),),
                          // const SizedBox(height: 5,),
                          const Text(
                            'Time',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.blueGrey
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 250,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xCCFFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Center(
                      child: Text(
                        'Temperature',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FittedBox(
                              child: Obx(() => Text(
                                'T1 : ${bt.val[8] ?? '0.0'}°C',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: tempFont,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                            ),

                            const SizedBox(height: 10,),

                            FittedBox(
                              child: Obx(() => Text(
                                'T2 : ${bt.val[9] ?? '0.0'}°C',
                                style: TextStyle(
                                    fontSize: tempFont,
                                    fontWeight: FontWeight.w500
                                ),
                              )),
                            ),

                            const SizedBox(height: 10,),

                            FittedBox(
                              child: Obx(() => Text(
                                'T3 : ${bt.val[10] ?? '0.0'}°C',
                                style: TextStyle(
                                    fontSize: tempFont,
                                    fontWeight: FontWeight.w500
                                ),
                              )),
                            ),

                            const SizedBox(height: 10,),

                            FittedBox(
                              child: Obx(() => Text(
                                'T4 : ${bt.val[11] ?? '0.0'}°C',
                                style: TextStyle(
                                    fontSize: tempFont,
                                    fontWeight: FontWeight.w500
                                ),
                              )),
                            ),

                            // TempComp(tempName: 'Tempreture1', tempVal: bt.val[8] ?? '0.0',),
                            // TempComp(tempName: 'Tempreture2', tempVal: bt.val[9] ?? '0.0',),
                            // TempComp(tempName: 'Tempreture3', tempVal: bt.val[10] ?? '0.0',),
                            // TempComp(tempName: 'Tempreture4', tempVal: bt.val[11] ?? '0.0',),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FittedBox(
                              child: Obx(() => Text(
                                'T5 : ${bt.val[12] ?? '0.0'}°C',
                                style: TextStyle(
                                    fontSize: tempFont,
                                    fontWeight: FontWeight.w500
                                ),
                              )),
                            ),

                            const SizedBox(height: 10,),

                            FittedBox(
                              child: Obx(() => Text(
                                'T6 : ${bt.val[13] ?? '0.0'}°C',
                                style: TextStyle(
                                    fontSize: tempFont,
                                    fontWeight: FontWeight.w500
                                ),
                              )),
                            ),

                            const SizedBox(height: 10,),

                            FittedBox(
                              child: Obx(() => Text(
                                'T7 : ${bt.val[14] ?? '0.0'}°C',
                                style: TextStyle(
                                    fontSize: tempFont,
                                    fontWeight: FontWeight.w500
                                ),
                              )),
                            ),

                            const SizedBox(height: 10,),

                            FittedBox(
                              child: Obx(() => Text(
                                'T8 : ${bt.val[15] ?? '0.0'}°C',
                                style: TextStyle(
                                    fontSize: tempFont,
                                    fontWeight: FontWeight.w500
                                ),
                              )),
                            ),
                            // TempComp(tempName: 'Tempreture5', tempVal: bt.val[12] ?? '0.0',),
                            // TempComp(tempName: 'Tempreture6', tempVal: bt.val[13] ?? '0.0',),
                            // TempComp(tempName: 'Tempreture7', tempVal: bt.val[14] ?? '0.0',),
                            // TempComp(tempName: 'Tempreture8', tempVal: bt.val[15] ?? '0.0',),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
