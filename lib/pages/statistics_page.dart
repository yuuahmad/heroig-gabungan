import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Statistic extends StatefulWidget {
  Statistic({Key key}) : super(key: key);

  @override
  _StatisticState createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('halaman Statistic'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [Boxsaya('coba saya')],
          ),
        ),
      ),
    );
  }
}

class Boxsaya extends StatelessWidget {
  final String judulteks;
  Boxsaya(this.judulteks);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        width: double.infinity,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.blue),
        child: Container(
          color: const Color(0xff232040),
          child: Center(
            child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: Container(
                  width: 100,
                  height: 20,
                  color: Colors.black,
                )),
          ),
        ));
  }
}
