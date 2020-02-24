import 'package:flutter/material.dart';
import 'package:register_login/layout/login_page.dart';

void main() {
  runApp(Start());
}

class Start extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'RegisterApp',
      home: Login(),
      theme: ThemeData(primaryColor: Colors.green,accentColor: Colors.red),

    );
  }
}
