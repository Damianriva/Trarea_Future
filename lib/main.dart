import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Future<String> _cargarDatos() async {
    await Future.delayed(Duration(seconds: 5));
    return await rootBundle.loadString('assets/datos.txt');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tarea Future"),
        ),
        body: FutureBuilder(
            future: _cargarDatos(),
            // ignore: missing_return
            builder: (contex, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasError) {
                return Center(
                    child: Text('ERROR: ${snapshot.error.toString()}'));
              }
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
                return Center(child: Text(snapshot.data));
              }
            }),
      ),
    );
  }
}
