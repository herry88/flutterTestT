import 'package:flutter/material.dart';
import 'package:fluttertest/constants.dart';
import 'package:fluttertest/data/models/auth.dart';

import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _auth = Provider.of<AuthModel>(context, listen: true);
    return Drawer(
      child: SafeArea(
        // color: Colors.grey[50],
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text(
                _auth.user.firstname + " " + _auth.user.lastname,
                textScaleFactor: textScaleFactor,
                maxLines: 1,
              ),
              subtitle: Text(
                _auth.user.id.toString(),
                textScaleFactor: textScaleFactor,
                maxLines: 1,
              ),
              // onTap: () {
              //   Navigator.of(context).popAndPushNamed("/myaccount");
              // },
            ),
            Divider(),

            ListTile(
              leading: Icon(Icons.open_in_browser),
              title: Text(
                'GetDat',
                textScaleFactor: textScaleFactor,
              ),
              onTap: () {
                Navigator.of(context).popAndPushNamed("/get");
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text(
                'Logout',
                textScaleFactor: textScaleFactor,
              ),
              onTap: () => _auth.logout(),
            ),
          ],
        ),
      ),
    );
  }
}