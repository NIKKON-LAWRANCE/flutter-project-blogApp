import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    static const Map<String, String> defaultHeader = {
    "Accept": "application/json",
  };
   Map<String ,dynamic> ?myMap;

     fetchBlogData()async{
     var url='https://apitest.hotelsetting.com/api/admin/blog-news';
     var responce1=await http.get(Uri.parse(url),headers: {
      "Accept": "application/json",
      //"Authorization": "bearer 2|2V1N1HjXJZcTvYZkmCh3zgM867XPDqMp2HXShMbj",
    }); 
     print("all data are ${responce1.body}");
    
    
  
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchBlogData();

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
      ),
    );
  }
}