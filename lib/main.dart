//HW1 code is here: Justin Boyer 0ct 8, 2022
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'HW1 : Hello World'),
    );
  }
}
//Page 1
class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title:  Text(widget.title)
          ),
        body: const Center(
            child: NavText(pageText: 'Page 1', navPage: SecondPage(title: "Second Page"),),
        ),
      );
  }
}

//Page 2
class SecondPage extends StatefulWidget {
  const SecondPage({super.key, required this.title});
  final String title;

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:  Text(widget.title)
      ),
      body: const Center(
        child: NavText(pageText: 'Page 2', navPage: HomePage(title: 'HW1 : Hello World')),
      ),
    );
  }
}

//Handle Navigation
class NavText extends StatefulWidget {
  const NavText({super.key, required this.pageText, required this.navPage});
  final String pageText;
  final Widget navPage;

  @override
  State<NavText> createState() => _NavTextState();
}
  
class _NavTextState extends State<NavText> {
  void _navigate() {
    Navigator.of(context).push(
        MaterialPageRoute<void>(
            builder: (context){
              return widget.navPage;
            }
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(widget.pageText),
        ),
        Expanded(
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              onPressed: _navigate,
            )
        ),
      ]
    );
  }
}
