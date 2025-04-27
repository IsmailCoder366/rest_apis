import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rest_apis/models/PostModels.dart';
import 'package:http/http.dart' as http;


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  List<dynamic> postList = [];
  Future<List<dynamic>> getPostApi () async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    var data = jsonDecode(response.body.toString());

    if(response.statusCode == 200){
      for(var i in data){
        postList.add(PostModels.fromJson(i));
      }
      return postList;
    }
    else{
        return postList;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Api Tutorial'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getPostApi(),
                builder: (context, snapshot)
            {
            if(!snapshot.hasData){
              return Text('loading');
            }
            else
              {
                return ListView.builder(
                    itemCount: postList.length,
                    itemBuilder: (context, index)
                {
                  return Card(
                    color: Colors.grey,

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Title',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                          Text(postList[index].title.toString(),),
                          Text('Body',style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),

                          Text(postList[index].body.toString()),
                        ],
                      ),
                    ),
                  );
                }
                );
              }
            }
            ),
          )
        ],
      ),
    );
  }
}
