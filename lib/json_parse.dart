import 'package:counter_app/service.dart';
import 'package:counter_app/user.dart';
import 'package:flutter/material.dart';

class JsonParse extends StatefulWidget {
  const JsonParse({super.key});

  @override
  State<JsonParse> createState() => _JsonParseState();
}

class _JsonParseState extends State<JsonParse> {
  List<User> _users = <User>[];
  bool loading = false;

  @override
  void initState() {
    super.initState();
    Service.getInfo().then((value) {
      setState(() {
        _users = value;
        loading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(loading ? 'User' : 'Loading...'),
      ),
      body: ListView.builder(
          itemCount: _users.length,
          itemBuilder: (context, index) {
            User user = _users[index];
            return ListTile(
              title: Text(user.title),
              subtitle: Text(user.body),
              leading: Icon(Icons.person),
              trailing: Icon(Icons.person_2),
            );
          }),
    );
  }
}
