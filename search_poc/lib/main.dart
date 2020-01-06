import 'dart:math';

import 'package:flutter/material.dart';
import 'package:search_poc/search_action_button.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Search Delegate Poc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Search Delegate Poc'),
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
  AppBar appBar;
  AppBar standardAppBar;
  AppBar searchAppBar;

  List<Map<String, dynamic>> basicData = List();
  List<Map<String, dynamic>> showData = List();

  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    standardAppBar = AppBar(
      title: Text(widget.title),
      actions: <Widget>[
        SearchActionButton(basicData),
        IconButton(
          icon: Icon(Icons.search),
          tooltip: "CustomMade AppBar",
          onPressed: () => setState(() {
            appBar = searchAppBar;
          }),
        )
      ],
    );
    searchAppBar = AppBar(
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      leading: BackButton(
        onPressed: () => setState(() {
          appBar = standardAppBar;
          _reset();
        }),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.clear),
          tooltip: "Clear",
          onPressed: _reset,
        ),
      ],
      title: TextField(
        controller: textController,
        autofocus: true,
        textInputAction: TextInputAction.done,
        onChanged: (text) {
          _updateListWithFilter(text);
        },
      ),
    );

    for (int i = 0; i < 10; i++) {
      basicData.add(
        {
          "dado 1": "Residencia ${Random().nextInt(100)}",
          "dado 2": "Bairro ${Random().nextInt(100)}",
          "dado 3": "Cidade ${Random().nextInt(100)}",
          "dado 4": "País ${Random().nextInt(100)}",
        },
      );
    }

    _reset();
    appBar = standardAppBar;
  }

  void _reset() {
    textController.text = '';
    showData = List()..addAll(basicData);
    setState(() {});
  }

  void _updateListWithFilter(String text) {
    showData = basicData.where((item) {
      return (item["dado 1"] as String).contains(text) ||
          (item["dado 2"] as String).contains(text) ||
          (item["dado 3"] as String).contains(text) ||
          (item["dado 4"] as String).contains(text);
    }).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: PocList(data: showData),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showMessageToGiu(context),
        tooltip: 'Click',
        child: Icon(Icons.thumb_up),
      ),
    );
  }

  void _showMessageToGiu(BuildContext context) {
    Scaffold.of(context).hideCurrentSnackBar();
    Scaffold.of(context).showSnackBar(
      SnackBar(content: Text("É nóis, Giu!")),
    );
  }
}

class PocList extends StatelessWidget {
  const PocList({
    Key key,
    @required this.data,
  }) : super(key: key);

  final List<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: data
            .map(
              (data) => Card(
                margin: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.4,
                  vertical: 8.0,
                ),
                child: ListTile(
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        data["dado 1"],
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        data["dado 2"],
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        data["dado 3"],
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        data["dado 4"],
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
