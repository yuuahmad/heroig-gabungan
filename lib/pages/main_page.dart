import 'package:flutter/material.dart';
import 'package:heroig/pages/apisaya_page.dart';
import 'package:heroig/pages/control_page.dart';
import 'package:heroig/pages/latapi_page.dart';
import 'package:heroig/pages/monitor_page.dart';
import 'package:heroig/pages/scan_page.dart';
import 'package:heroig/pages/statistics_page.dart';

import 'package:provider/provider.dart';
import 'package:heroig/services/auth_services.dart';

import 'control_page.dart';
import 'monitor_page.dart';
import 'scan_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HEROIGST'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MenuIcon(
                  icon: Icons.monitor,
                  iconColor: Colors.blueGrey,
                  label: 'Monitoring',

                  /// kita tambahin properties onPress yang fungsinya untuk extends ke halaman monitoring
                  onPress: () {
                    /// pake push biasa,
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Monitor()));
                  },
                ),
                MenuIcon(
                  icon: Icons.settings_remote,
                  iconColor: Colors.red,
                  label: 'Controlling',

                  /// kita tambahin properties onPress yang fungsinya untuk extends ke halaman monitoring
                  onPress: () {
                    /// pake push biasa,
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Control()));
                  },
                ),
                MenuIcon(
                  icon: Icons.add,
                  iconColor: Colors.lightGreen,
                  label: 'Add Device',
                  onPress: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Scan()));
                  },
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MenuIcon(
                  icon: Icons.schedule,
                  iconColor: Colors.brown,
                  label: 'Track Record',
                ),
                MenuIcon(
                  icon: Icons.note,
                  iconColor: Colors.red,
                  label: 'About HEROIG',
                ),
              ],
            )
          ],
        ),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            _createHeader(),
            _createDrawerItem(
                icon: Icons.camera,
                text: 'Scan Alat',
                onTap: () {
                  _pushPage(context, Scan());
                }),
            _createDrawerItem(
                icon: Icons.remove_red_eye,
                text: 'Monitor Alat',
                onTap: () {
                  _pushPage(context, Monitor());
                }),
            _createDrawerItem(
                icon: Icons.switch_left,
                text: 'Kontrol Alat',
                onTap: () {
                  _pushPage(context, Control());
                }),
            _createDrawerItem(
                icon: Icons.bar_chart,
                text: 'Statistik Penggunaan',
                onTap: () {
                  _pushPage(context, Statistic());
                }),
            _createDrawerItem(
                icon: Icons.wysiwyg_sharp,
                text: 'Latihan Api',
                onTap: () {
                  _pushPage(context, Latapi());
                }),
            _createDrawerItem(
                icon: Icons.wysiwyg_sharp,
                text: 'Api Heroig',
                onTap: () {
                  _pushPage(context, ApiSaya());
                }),
            Divider(),
            _createDrawerItem(
                icon: Icons.outbox,
                text: 'Keluar Akun',
                onTap: () {
                  context.read<AuthServices>().signOut();
                })
          ],
        ),
      ),
    );
  }

  Widget _createHeader() {
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: Center(
          child: Text(
        'Menu Heroig',
        style: TextStyle(fontSize: 30),
      )),
    );
  }

  Widget _createDrawerItem(
      {IconData icon, String text, GestureTapCallback onTap}) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}

void _pushPage(BuildContext context, Widget page) {
  Navigator.of(context).pop();
  Navigator.of(context).push(
    MaterialPageRoute<void>(builder: (_) => page),
  );
}

class MenuIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String label;

  ///tambahin variable onPress
  final Function onPress;

  /// inisiasi onpress pada construcrtor
  MenuIcon({this.icon, this.iconColor, this.label, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: iconColor.withOpacity(.2),
            borderRadius: BorderRadius.circular(10.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /// kita bungkus container dengan widget gestur detector, fungsinya biar bisa di klik container nya
            GestureDetector(
              onTap: onPress,
              child: Container(
                  child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(icon, color: iconColor),
              )),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(label)
          ],
        ));
  }
}
