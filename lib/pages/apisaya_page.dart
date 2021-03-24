import 'package:flutter/material.dart';

class ApiSaya extends StatefulWidget {
  final String apiHeroig = ('http://heroig.iteraiothme.com/api/123456789');
  ApiSaya({Key key}) : super(key: key);

  @override
  _ApiSayaState createState() => _ApiSayaState();
}

class _ApiSayaState extends State<ApiSaya> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ini api heroig'),
      ),
    );
  }
}
