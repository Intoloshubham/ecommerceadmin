import 'package:ecommerceadmin/screens/index.dart';
import 'package:ecommerceadmin/viewModals/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => TeamViewModel()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      // ),
      // body: Center(child: TeamPage()));
      body: Stack(
        children: [
          ClipPath(
            child: Container(
              width: MediaQuery.of(context).size.width,
              // height: 200,
              height: MediaQuery.of(context).size.height * 10,
              color: Colors.lightBlueAccent,
            ),
            clipper: CustomClipPath(),
          ),
          SizedBox(
            width: 100,
            height: 50,
          ),
          ClipPath(
            child: Container(
              width: MediaQuery.of(context).size.width,
              // height: 200,
              height: MediaQuery.of(context).size.height,
              color: Colors.lightBlue[100],
            ),
            clipper: MiddleClipPath(),
          ),
          SizedBox(
            width: 100,
            height: 50,
          ),
          TeamPage()
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  var radius = 4.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width / 50, size.height / 2);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class MiddleClipPath extends CustomClipper<Path> {
  var radius = 4.0;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, size.height * 0);
    path.lineTo(size.width, size.height / 3);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
