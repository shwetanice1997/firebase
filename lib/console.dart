import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

String output;
String input;

class _MyAppState extends State<MyApp> {
  exec() async {
    var url = "http://192.168.43.98/cgi-bin/web.py?x=$input";
    var response = await http.get(url);
    var r = response.body;

    setState(() {
      output = r;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Linux Command Terminal"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.history),
              onPressed: () {
                Navigator.pushNamed(context, 'home');
              })
        ],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(10),
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Text(
                "Welcome To Terminal",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Card(
                child: TextField(
                  onChanged: (value) {
                    input = value;
                  },
                  style: TextStyle(
                    fontSize: 20,
                  ),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    hintText: 'Command',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    contentPadding: EdgeInsets.all(10),
                    prefixIcon: Icon(Icons.arrow_forward),
                  ),
                ),
              ),
              Material(
                borderRadius: BorderRadius.circular(50),
                child: MaterialButton(
                  elevation: 80,
                  color: Colors.green,
                  onPressed: exec,
                  child: Text("Run"),
                ),
              ),
              Text('\n'),
              Text(output ?? "Output"),
            ],
          ),
        ),
      ),
    );
  }
}
/*
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class MyConsole extends StatefulWidget {
  @override
  _MyConsoleState createState() => _MyConsoleState();
}
class _MyConsoleState extends State<MyConsole> {
  String cmd;
  String output;
  mydata() async {
    var url = "http://192.168.43.98/cgi-bin/web1.py?x=$cmd";
    var r = await http.get(url);
    var sc = r.body;
    setState(() {
      output = sc;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('Console'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Command',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onChanged: (val) {
                cmd = val;
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Card(
            child: FlatButton(onPressed: mydata, child: Text('Click')),
          )
        ],
      ),
    );
  }
}
*/