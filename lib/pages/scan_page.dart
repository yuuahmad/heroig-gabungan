import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class Scan extends StatefulWidget {
  @override
  _ScanState createState() => _ScanState();
}

class _ScanState extends State<Scan> {
  Uint8List bytes = Uint8List(0);
  TextEditingController _outputController;
  @override
  initState() {
    super.initState();
    this._outputController = new TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('halaman scan'),
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: this._outputController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'kode barcode anda akan ada disini',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 7, vertical: 15),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _scan,
                  child: Text('scan dari kamera'),
                ),
                SizedBox(
                  width: 20,
                ),
                ElevatedButton(
                  onPressed: _scanPhoto,
                  child: Text('scan dari galeri'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future _scan() async {
    await Permission.camera.request();
    String barcode = await scanner.scan();
    if (barcode == null) {
      print('nothing return.');
    } else {
      this._outputController.text = barcode;
    }
  }

  Future _scanPhoto() async {
    await Permission.storage.request();
    String barcode = await scanner.scanPhoto();
    this._outputController.text = barcode;
  }
}
