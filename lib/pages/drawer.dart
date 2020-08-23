import 'package:flutter/material.dart';
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _createHeader(),
          _createDrawerItem(icon: Icons.face, text: 'Detect your face mask',),
          _createDrawerItem(icon: Icons.library_books, text: 'Live news',),
          _createDrawerItem(icon: Icons.map, text: 'Track nearest victims',),
          _createDrawerItem(icon: Icons.web, text: 'Visit our Website',),
          _createDrawerItem(icon: Icons.account_box, text: 'Talk to our bot',),
          Divider(),
          _createDrawerItem(icon: Icons.group, text: 'Know us'),
          _createDrawerItem(icon: Icons.info, text: 'About'),
          _createDrawerItem(icon: Icons.attach_money, text: 'Donate us'),
          Divider(),
          _createDrawerItem(icon: Icons.bug_report, text: 'Report an issue'),
          ListTile(
            title: Text('0.0.1'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
Widget _createHeader() {
  return DrawerHeader(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: <Color>[

            Colors.teal[100],
            Colors.lightBlue[400]
          ])
      ),
      child: Container(
        child: Column(
          children: <Widget>[
            Material(
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
              elevation: 10,
              child: Padding(padding: EdgeInsets.all(8.0),
                child: Image.asset("assets/cv.jpg", height: 40, width: 40),
              ),
            ),
            Text('Covid-19', style: TextStyle(color: Colors.white, fontSize: 25.0),)
          ],
        ),
      ));
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