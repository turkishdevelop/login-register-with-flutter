import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:register_login/model/user.dart';
import 'package:register_login/utils/service.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final genderController = TextEditingController();
  File _image;

  Service service;
  String username, password, email, name, gender;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    service = Service();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,
      ),
      body: _registerPage(),
    );
  }

  _registerPage() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextFormField(
              onSaved: (inputUsername) {
                setState(() {
                  username = inputUsername;
                });
              },
              decoration: InputDecoration(
                  hintText: 'Username',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
              controller: usernameController,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextFormField(
              onSaved: (inputPassword) {
                setState(() {
                  password = inputPassword;
                });
              },
              decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
              controller: passwordController,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextFormField(
              onSaved: (inputEmail) {
                setState(() {
                  email = inputEmail;
                });
              },
              decoration: InputDecoration(
                  hintText: 'Email',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
              controller: emailController,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextFormField(
              onSaved: (inputName) {
                setState(() {
                  name = inputName;
                });
              },
              decoration: InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
              controller: nameController,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 10),
            child: TextFormField(
              onSaved: (inputGender) {
                setState(() {
                  gender = inputGender;
                });
              },
              decoration: InputDecoration(
                  hintText: 'Gender',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
              controller: genderController,
            ),
          ),
          CircleAvatar(
            maxRadius: 50,
            minRadius: 20,
            backgroundImage: FileImage(_image),

          ),
          IconButton(
              icon: Icon(
                Icons.camera_alt,
                color: Colors.red,
              ),
              onPressed: () {
                debugPrint('clicked picture choose');
                getImage();
              }),
          IconButton(
              icon: Icon(
                Icons.attach_file,
                color: Colors.red,
              ),
              onPressed: () {
                debugPrint('clicked picture choose');
                chooseFromGallery();
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 20, top: 20),
                child: RaisedButton(
                  onPressed: () {
                    /*Clear Form Data*/
                    nameController.clear();
                    emailController.clear();
                    usernameController.clear();
                    passwordController.clear();
                    genderController.clear();
                  },
                  child: Text(
                    'Clear Form',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 20, top: 20),
                child: RaisedButton(
                  onPressed: () {
                    /*Register Operation Apply*/
                    _formKey.currentState.save();
                    String fileName = _image.path.split('/').last;
                    String base64Image = base64Encode(_image.readAsBytesSync());

                    service.registerUser(User(
                        username: username,
                        password: password,
                        gender: gender,
                        name: name,
                        email: email,
                        profilePicutre: base64Image,
                        profilePictureFileName: "$username __" + fileName,
                        id: 1));
                  },
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.green,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future chooseFromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }
}
