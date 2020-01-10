import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shared Preferences Poc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Shared Preferences Poc Home Page'),
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
  int _counter = 0;
  SharedPreferences pref;

  void _incrementCounter() {
    setState(() {
      _counter = (_counter ?? 0) + 1;
      pref.setInt(_counter.toString(), _counter);
    });
  }

  void _readPreviousValue() {
    pref.remove(_counter.toString());
    _counter = pref.getInt((_counter - 1).toString()) ?? 0;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getPreferences();
  }

  Future<void> getPreferences() async {
    pref ??= await SharedPreferences.getInstance();
    _counter = pref.getInt(_counter.toString()) ?? 0;
  }

  void _clearCounter() async {
    await Future.forEach(pref.getKeys(), (key) async => await pref.remove(key));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: getPreferences(),
        builder: (context, _) => Center(
          child: pref == null
              ? CircularProgressIndicator()
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: pref
                      .getKeys()
                      .map((key) => Card(
                            child: Text(pref.getInt(key).toString()),
                          ))
                      .toList(),
                ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: FloatingActionButton(
              onPressed: _readPreviousValue,
              tooltip: 'Previous Value',
              child: Icon(Icons.arrow_back_ios),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: FloatingActionButton(
              onPressed: _clearCounter,
              tooltip: 'Clear',
              child: Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}
