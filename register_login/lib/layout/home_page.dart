import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:register_login/model/user.dart';

class HomePage extends StatefulWidget {


  HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                /*Logout Operation*/
              })
        ],
      ),
    );
  }

  homeBody() {
    return Container(
      child: Column(
        children: <Widget>[

        ],
      ),
    );
  }
}
