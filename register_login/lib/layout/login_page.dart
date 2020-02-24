import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:register_login/layout/home_page.dart';
import 'package:register_login/layout/register_page.dart';
import 'package:register_login/utils/service.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  Service _service;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  String username;
  String password;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    username = null;
    password = null;
    _service = Service();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: loginBody(),
    );
  }

  loginBody() {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 20),
              child: TextFormField(
                onSaved: (inputUsername) {
                  setState(() {
                    username = inputUsername;
                  });
                },
                controller: usernameController,
                decoration: InputDecoration(
                    hintText: 'Username',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey))),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: TextFormField(
                onSaved: (inputPassword) {
                  setState(() {
                    password = inputPassword;
                  });
                },
                controller: passwordController,
                decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey))),
                obscureText: true,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: RaisedButton(
                    color: Colors.green,
                    onPressed: () {
                      /*Forward Register Page*/
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Register()));
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: RaisedButton(
                    color: Colors.green,
                    onPressed: () {
                      /*Get Data initialize*/
                      _formKey.currentState.save();
                      _service.loginUser(username, password).then((response) {
                        if (response.statusCode == 200) {

                          debugPrint(response.body);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomePage()));
                        }
                      });
                      // debugPrint('User Trying to Login $username Password $password');

                      /*Login Service Call*/
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
