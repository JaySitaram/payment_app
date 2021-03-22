import 'package:flutter/material.dart';

class UpgradeScreen extends StatefulWidget {
  @override
  _UpgradeScreenState createState() => _UpgradeScreenState();
}

class _UpgradeScreenState extends State<UpgradeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getUpgradeContent(),
    );
  }

  _getUpgradeContent() {
    return Container(
      child: Text("Hello World"),
    );
  }
}
