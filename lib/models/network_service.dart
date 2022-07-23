import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const Map<String, dynamic> temp = {};
getData(String url, {Map<String, dynamic> params = temp, post = true}) async {
  final http.Response result;
  if (post) {
    result = await http.post(Uri.parse(url), body: params);
  } else {
    result = await http.get(Uri.parse(url));
  }
  // print(result.body);
  return jsonDecode(result.body);
}

Future<String> getUid() async {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  var data = await deviceInfoPlugin.deviceInfo;
  // print(data.toMap());
  return data.toMap()['androidId'].toString();
}

showMessage(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white,
      textColor: Colors.blue,
      fontSize: 16.0);
}
