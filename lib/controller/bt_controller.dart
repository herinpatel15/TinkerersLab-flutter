import 'package:bluetooth_classic/bluetooth_classic.dart';
import 'package:bluetooth_classic/models/device.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BtController extends GetxController{
  // bluetooth object
  final _bt = BluetoothClassic();

  // all string var
  String platformVersion = 'Unknown';
  RxString errors = 'err'.obs;
  String data = '';
  RxString deviceAddress = ''.obs;

  // all int var
  RxInt deviceStatus = Device.disconnected.obs;

  // all list var
  RxList<Device> pairedDevices = <Device>[].obs;
  // RxList<String> val = <String>[].obs;
  RxList<String> val = <String>['0.0', '0.0', '0.0', '0.0', '0.0','0.0', '0.0', '0', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0', '0.0'].obs;
  final List<int> _dataBuffer = [];

  // init function
  @override
  void onInit(){
    super.onInit();

    // all init function
    _permissionBT();
    _initPlatformState();
    btStatus();
    getBtPairedDevice();
  }

  // permission function
  Future<void> _permissionBT() async {
    await _bt.initPermissions();
  }

  // platform state function
  Future<void> _initPlatformState() async {
    String platformVersion;
    try{
      platformVersion = await _bt.getPlatformVersion() ?? 'unknown platform version';
    } on PlatformException {
      platformVersion = 'failed to get platform version...';
    }
    platformVersion = platformVersion;
  }

  // bluetooth status function
  void btStatus() {
    _bt.onDeviceStatusChanged().listen((event) {
      deviceStatus.value = event;
    });
  }

  // get paired device function
  Future<void> getBtPairedDevice() async {
    try{
      pairedDevices.value = await _bt.getPairedDevices();
    } catch (err) {
      errors.value = 'paired device problem';
    }
  }

  // connect device function
  Future<void> connectBtDevice(add) async {
    try{
      deviceAddress == add ? deviceAddress.value : deviceAddress.value = add.toString();
      await _bt.connect(add, "00001101-0000-1000-8000-00805f9b34fb");

      // add read function to read data
      btReadData();
    } catch (err) {
      errors.value = 'connection problem...';
    }
  }

  // disconnect device function
  Future<void> disconnectBtDevice() async {
    try{
      deviceStatus == Device.connected ? await _bt.disconnect() : null;
    } catch(err) {
      errors.value = 'disconnect device problem...';
    }
  }

  // write data function
  Future<void> btWriteData() async {
    try{
      await _bt.write('1\r\n');
    } catch (err) {
      errors.value = 'write data problem...';
    }
  }

  // read data function
  void btReadData() {
    // try{
    //   _bt.onDeviceDataReceived().listen((event) {
    //     _dataBuffer.addAll(event);
    //     while(_proDataBuffer()) {}
    //   });
    // } catch (err) {
    //   errors.value = 'read data problem...';
    // }
    _bt.onDeviceDataReceived().listen((event) {
      _dataBuffer.addAll(event);
      while(_proDataBuffer()) {}
    });
  }

  // data buffer function
  bool _proDataBuffer() {
    int newlineIndex = _dataBuffer.indexOf(10);
    if (newlineIndex != -1) {
      List<int> msg = _dataBuffer.sublist(0, newlineIndex + 1);
      data = String.fromCharCodes(msg).trim();
      if(data.trim().isEmpty){
        _dataBuffer.removeRange(0, newlineIndex + 1);
        return true;
      } else {
        val.value = data.split(',');
        // print('object');
        // print(data);
        _dataBuffer.removeRange(0, newlineIndex + 1);
        return true;
      }
    }
    return false;
  }


}