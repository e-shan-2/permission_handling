import 'dart:async';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: const Text("Request RunTime Permission in Android Flutter"),
          ),
          body: const SafeArea(
              child: Center(
            child: AppState(),
          ))),
    );
  }
}

class AppState extends StatefulWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  AppPermission createState() => AppPermission();
}

class AppPermission extends State<AppState> {
  List<String> dataValue = [
    'Unavailabe',
    'Unavailabe',
    'Unavailabe',
    'Unavailabe',
    'Unavailabe',
  ];

  Future<void> requestPermission(Permission _widget, int index) async {
    final status =await _widget.request();
    if (status == PermissionStatus.granted) {
      setState(() {
        dataValue[index] = "Granted";
      });
    } else if (status == PermissionStatus.denied) {
      setState(() {
        dataValue[index] = "Permission Denied";
      });
    } else if (status == PermissionStatus.permanentlyDenied) {
      setState(() {
        dataValue[index] = "Permanently Denied";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(10),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlue,
                padding: const EdgeInsets.all(8),
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('Microphone Permission'),
              onPressed: () {
                requestPermission(Permission.microphone, 0);
              }),
        ),
        Text(dataValue[0]),
        Container(
          margin: const EdgeInsets.all(10),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlue,
                padding: const EdgeInsets.all(8),
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('Location Permission'),
              onPressed: () {
                requestPermission(Permission.location, 1);
              }),
        ),
        Text(dataValue[1]),
        Container(
          margin: const EdgeInsets.all(10),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.lightBlue,
                padding: const EdgeInsets.all(8),
                textStyle: const TextStyle(fontSize: 20),
              ),
              child: const Text('Contacts Permission'),
              onPressed: () {
                requestPermission(Permission.contacts, 2);
              }),
        ),
        Text(dataValue[2]),
        Container(
          margin: const EdgeInsets.all(10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.lightBlue,
              padding: const EdgeInsets.all(8),
              textStyle: const TextStyle(fontSize: 20),
            ),
            child: const Text('Camera Permission'),
            onPressed: () {
              requestPermission(Permission.camera, 3);
            },
          ),
        ),
        Text(dataValue[3]),

        Container(
          margin: const EdgeInsets.all(10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Colors.lightBlue,
              padding: const EdgeInsets.all(8),
              textStyle: const TextStyle(fontSize: 20),
            ),
            child: const Text('MediaLocation Permission'),
            onPressed: () {
              requestPermission(Permission.accessMediaLocation, 4);
            },
          ),
        ),
        Text(dataValue[4]),
      ],
    ));
  }
}
 