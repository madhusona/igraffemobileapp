import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../constants.dart';


class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
    );
  }
}

Future<List<Post>> fetchPosts(http.Client client) async {
  final response = await client.get('https://jsonplaceholder.typicode.com/posts');
  //print(response.body);
  return compute(parsePosts, response.body);
}

List<Post> parsePosts(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Post>((json) => Post.fromJson(json)).toList();
}

class PatientListHome extends StatelessWidget {
  final String title;

  PatientListHome({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FutureBuilder<List<Post>>(
        future: fetchPosts(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? CustomListView1(posts: snapshot.data)
              : Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class CustomListView extends StatelessWidget {
  final List<Post> posts;

  CustomListView({Key key, this.posts}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: posts.length,
          padding: const EdgeInsets.all(15.0),
          itemBuilder: (context, position) {
            return Column(
              children: <Widget>[
                Divider(height: 10.0),
                ListTile(
                  title: Text(
                    '${posts[position].title}',
                    style: TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                  subtitle: Text(
                    '${posts[position].body}',
                    style: new TextStyle(
                      fontSize: 18.0,
                      fontStyle: FontStyle.italic,
                    ),
                  ),

                  onTap: () => { Navigator.of(context).pushNamed('/patientdetail',arguments:posts[position].id.toString())},

                ),
              ],
            );
          }),
    );
  }

  void _onTapItem(BuildContext context, dynamic post) {
    Scaffold
        .of(context)
        .showSnackBar(new SnackBar(content: new Text(post.id.toString() + ' - ' + post.title)));
  }
}

class CustomListView1 extends StatelessWidget {
  final List<Post> posts;

  CustomListView1({Key key, this.posts}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: new EdgeInsets.symmetric(vertical: 10.0),
      child: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context,position){
        return Card(
          elevation: 8.0,
         margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
           // decoration: BoxDecoration(color: Color.fromRGBO(64, 75, 96, .9)),
            child: ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                leading: Container(
                  padding: EdgeInsets.only(right: 12.0),
                  decoration: new BoxDecoration(
                      border: new Border(
                          right: new BorderSide(width: 1.0, color: Colors.white24))),
                  child: Icon(Icons.face, color: textboxcolor1),
                ),
                title: Text(
                  '${posts[position].title}',
                  style: TextStyle(color: textboxcolor1, fontWeight: FontWeight.bold),
                ),
                // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),


                trailing:
                Icon(Icons.keyboard_arrow_right, color: textboxcolor1, size: 30.0)),
          ),

        );
      }),
    );
  }
}
