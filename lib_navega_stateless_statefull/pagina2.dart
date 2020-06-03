import 'package:busqe/pagina3.dart';
import 'package:flutter/material.dart';

import 'main.dart';

void main() {
  runApp(PaginaDois());
}

class PaginaDois extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pagina 2',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Pagina 2'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _carregarPagina() {
    Navigator.pop(context, null);
    // Navigator.push( context, MaterialPageRoute(builder: (context) => PaginaUm()));
    //setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Voce esta na pagina 02:',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _carregarPagina,
        tooltip: 'Caregar',
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}
