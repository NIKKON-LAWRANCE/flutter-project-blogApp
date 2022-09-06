import 'dart:convert';

import 'package:blogapp/home-page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

Map<String ,dynamic> ?myMap;
  signinInfo() async {
    var map = Map<String, dynamic>();
    //myprefarence = await SharedPreferences.getInstance();

    map["email"] = email.text.toString();
    map["password"] = password.text.toString();

    var respons = await http.post(
      Uri.parse("https://apitest.hotelsetting.com/api/login"),
      body: map,
      // headers: CustomHttpRequest.defaultHeader
    );

    print("${respons.body}");

    final data = jsonDecode(respons.body);
    myMap=Map<String,dynamic>.from(data);
    print("map is $myMap");
    if(myMap!["data"]["token"] !=null){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
    }
    else{
      print("Email or password not match");
    }
  
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("login")),
      body: Column(
        children: [
          TextFormField(
            controller: email,
          ),
          TextFormField(
            controller: password,
          ),
          ElevatedButton(onPressed: () {signinInfo();}, child: Text("login"))
        ],
      ),
    );
  }
}
