import 'package:extensible_poc/custom_panel.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Expansion Panel POC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(title: 'Expansion Panel POC'),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;
  List<ExpansionPanel> children;

  void _incrementCounter() {
    setState(() {
      _counter += 10;
      children = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          bottom: TabBar(
            tabs: <Widget>[
              Center(child: Text("ExpansionPanel")),
              Center(child: Text("CustomPanel")),
            ],
          ),
        ),
        body: SafeArea(
          minimum: const EdgeInsets.only(bottom: 60.0),
          child: Builder(
            builder: (context) => TabBarView(
              children: [
                SingleChildScrollView(
                  child: ExpansionPanelList(
                    animationDuration: const Duration(milliseconds: 300),
                    expansionCallback: (index, isExpanded) {
                      var panel = children[index];
                      children[index] = ExpansionPanel(
                        body: panel.body,
                        headerBuilder: panel.headerBuilder,
                        canTapOnHeader: true,
                        isExpanded: !isExpanded,
                      );

                      Scaffold.of(context).hideCurrentSnackBar();
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "You ${isExpanded ? "opened" : "closed"} the card number ${index + 1}",
                          ),
                        ),
                      );

                      setState(() {});
                    },
                    children: children ??= generateExpansionChildren(_counter),
                  ),
                ),
                ListView.builder(
                  itemCount: _counter,
                  itemBuilder: (context, i) => CustomPanel(
                    header: Text("Panel ${i + 1}"),
                    body: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text("Texto 1"),
                        Text("Texto 2"),
                      ],
                    ),
                    expandedCallback: (expanded) {
                      Scaffold.of(context).hideCurrentSnackBar();
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "You ${expanded ? "opened" : "closed"} the card number ${i + 1}",
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  List<ExpansionPanel> generateExpansionChildren(int itemCount) {
    var list = List<ExpansionPanel>();
    for (int i = 0; i < itemCount; i++) {
      list.add(
        ExpansionPanel(
          canTapOnHeader: true,
          headerBuilder: (context, isExpanded) {
            return Container(
              padding: const EdgeInsets.all(8.0),
              color: Colors.white,
              child: Text("Expansion Panel ${i + 1}"),
            );
          },
          body: Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.grey.shade200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Texto 1"),
                Text("Texto 2"),
              ],
            ),
          ),
        ),
      );
    }
    return list;
  }
}
