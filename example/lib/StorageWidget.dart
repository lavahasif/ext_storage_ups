import 'dart:async';


import 'package:ext_storage/ext_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(IpWidget());
}

class IpWidget extends StatefulWidget {
  @override
  _IpWidgetState createState() => _IpWidgetState();
}

class _IpWidgetState extends State<IpWidget> {
  String _Connecton_change = '';
  String _root = 'Unknown';
  String _IpAddress_Wifi_tetherorwifi = 'Unknown';
  String _IpAddress_Wifi = 'Unknown';
  String _IpAddress_Private = 'Unknown';
  String _IpAddress_USB_tether = 'Unknown';
  String _IpAddress_All = 'Unknown';
  String _IpAddress_Cellular2 = 'Unknown';
  String _IpAddress_Cellular1 = 'Unknown';
  String _IpAddress_Cell = 'Unknown';
  String _IpAddress_Blue_ther = 'Unknown';

  @override
  void initState() {
    super.initState();

    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String root;
    String IpAddress_Wifi_tetherorwifi;
    String IpAddress_Wifi;
    String IpAddress_Private;
    String IpAddress_USB_tether;
    String IpAddress_Cellular1;
    String IpAddress_Cellular2;
    String IpAddress_Blue_ther;
    String IpAddress_All;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      IpAddress_Wifi_tetherorwifi =
          (await ExtStorage.getExternalStoragePublicDirectory(
              ExtStorage.DIRECTORY_DOWNLOADS))!;
      root = (await ExtStorage.getExternalStorageDirectory())!;
      IpAddress_Wifi = (await ExtStorage.getExternalStoragePublicDirectory(
          ExtStorage.DIRECTORY_DOCUMENTS))!;
      IpAddress_Private = (await ExtStorage.getExternalStoragePublicDirectory(
          ExtStorage.DIRECTORY_DCIM))!;
      IpAddress_USB_tether = (await ExtStorage.getExternalStoragePublicDirectory(
          ExtStorage.DIRECTORY_MOVIES))!;
      IpAddress_Cellular1 = (await ExtStorage.getExternalStoragePublicDirectory(
          ExtStorage.DIRECTORY_PICTURES))!;
      IpAddress_Cellular2 =
          (await await ExtStorage.getExternalStoragePublicDirectory(
              ExtStorage.DIRECTORY_RINGTONES))!;
      IpAddress_Blue_ther = (await ExtStorage.getExternalStoragePublicDirectory(
          ExtStorage.DIRECTORY_RINGTONES))!;
      IpAddress_All = (await await ExtStorage.getExternalStoragePublicDirectory(
          ExtStorage.DIRECTORY_DCIM))!;
    } on PlatformException {
      IpAddress_Wifi_tetherorwifi = 'Failed to get ';
      root = 'Failed to get ';
      IpAddress_Wifi = 'Failed to get ';
      IpAddress_Private = 'Failed to get ';
      IpAddress_USB_tether = 'Failed to get ';
      IpAddress_Cellular1 = 'Failed to get ';
      IpAddress_Cellular2 = 'Failed to get ';
      IpAddress_Blue_ther = 'Failed to get ';
      IpAddress_All = 'Failed to get ';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _root = root;
      _IpAddress_Wifi_tetherorwifi = IpAddress_Wifi_tetherorwifi;
      _IpAddress_Wifi = IpAddress_Wifi;
      _IpAddress_Private = IpAddress_Private;
      _IpAddress_USB_tether = IpAddress_USB_tether;
      _IpAddress_Cellular1 = IpAddress_Cellular1;
      _IpAddress_Cellular2 = IpAddress_Cellular2;
      _IpAddress_Blue_ther = IpAddress_Blue_ther;
      _IpAddress_All = IpAddress_All;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text('Root Folder: $_root\n'),
            SizedBox(
              width: 25,
            ),
            RaisedButton(
                color: Colors.blue,
                child: Text("Copy"),
                onPressed: () => _copy(_IpAddress_Wifi_tetherorwifi))
          ],
        ),
        Row(
          children: [
            Text(' ===>: $_IpAddress_Wifi\n'),
            SizedBox(
              width: 25,
            ),
            RaisedButton(
                color: Colors.blue,
                child: Text("Copy"),
                onPressed: () => _copy(_IpAddress_Wifi))
          ],
        ),
        Row(
          children: [
            Text('===>: $_root\n'),
            SizedBox(
              width: 25,
            ),
            RaisedButton(
                color: Colors.blue,
                child: Text("Copy"),
                onPressed: () => _copy(_root))
          ],
        ),
        Text('===>: $_IpAddress_Private\n'),
        Row(
          children: [
            Text('===>: $_IpAddress_Cellular1\n'),
            SizedBox(
              width: 25,
            ),
            RaisedButton(
                color: Colors.blue,
                child: Text("Copy"),
                onPressed: () => _copy(_IpAddress_Cellular1))
          ],
        ),
        Text('===>: $_IpAddress_Cellular2\n'),
        Row(
          children: [
            Text('===>: $_IpAddress_USB_tether\n'),
            SizedBox(
              width: 25,
            ),
            RaisedButton(
                color: Colors.blue,
                child: Text("Copy"),
                onPressed: () => _copy(_IpAddress_USB_tether))
          ],
        ),
        Row(
          children: [
            Text('===>: $_IpAddress_Blue_ther\n'),
            RaisedButton(
                color: Colors.blue,
                child: Text("Copy"),
                onPressed: () => _copy(_IpAddress_Blue_ther))
          ],
        ),
        Text('===>: $_IpAddress_All\n'),
      ],
    );
  }

  void _copy(String ipAddress_Wifi) {
    var clipboardData = ClipboardData(text: ipAddress_Wifi);

    Clipboard.setData(clipboardData);
  }
}
