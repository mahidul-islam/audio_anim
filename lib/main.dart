import 'package:audio/animals/cow.dart';
import 'package:audio/animals/dog.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const CowPage()));
              },
              color: const Color(0Xffdf9898),
              child: const Text(
                'Cow',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                ),
              ),
            ),
          ),
          Expanded(
            child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const DogPage()));
              },
              color: const Color(0Xff83d9ae),
              child: const Text(
                'Dog',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
