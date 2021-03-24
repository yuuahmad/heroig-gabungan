import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class Control extends StatefulWidget {
  @override
  _ControlState createState() => _ControlState();
}

class _ControlState extends State<Control> {
  bool postResult = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Control'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Aktuator',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              color: Colors.blue,
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  //By default
                  LiteRollingSwitch(
                    value: true,
                    textOn: 'active',
                    textOff: 'inactive',
                    colorOn: Colors.green,
                    colorOff: Colors.red,
                    iconOn: Icons.lightbulb_outline,
                    iconOff: Icons.power_settings_new,
                    onChanged: (bool state) {
                      print('turned ${(state) ? 'on' : 'off'}');
                    },
                  ),

                  //Customized
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Cek Sistem Monitoring',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              color: Colors.blue,
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Monitoring '),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Input Debit Air',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              color: Colors.blue,
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Monitoring '),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Mode Kerja HEROIG ....',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              color: Colors.blue,
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('LOW'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('NORMAL'),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('HIGH'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
