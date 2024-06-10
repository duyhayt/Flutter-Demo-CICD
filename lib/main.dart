import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Image',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Random Image Generator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;
  var _imageurl = 'https://source.unsplash.com/random/';

  Widget imageprovider() {
    return Image.network(
      _imageurl,
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
    );
  }

  void _newImage() {
    setState(() {
      _imageurl = 'https://source.unsplash.com/random/$counter';
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: GestureDetector(
            child: imageprovider(),
            onTap: _newImage,
          ),
        ),
      ),
    );
  }
}
