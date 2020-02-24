import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:register_login/model/user.dart';
class Service{

  String baseURL='http://192.168.1.122:4000/users/';

  Map auth;
  Future<http.Response> loginUser(String username,String password) async{
    username.trim();
    password.trim();
    var response = await http.post(baseURL+'authenticate',body: User(username: username,password: password).toLogin());
    debugPrint('Response : '+response.body);
    return response;
  }

  Future<void> registerUser(User user) async{
    var response= await http.post(baseURL+'register',body: user.toJson());

  }

  Future<void> getAll(){
    auth={
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjoxLCJ1c2VybmFtZSI6ImFiZHVsbGFoIiwicGFzc3dvcmQiOiIxMjM0NTYifSwiaWF0IjoxNTgyMzkyNzc1fQ.Nirt7JbDvuxwub69Ycfg9v40T7eWHj9BK9QgUmAxU9s',
    };
  }




}