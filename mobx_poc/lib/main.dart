import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:mobx_poc/stores/hero_store.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MobX Poc',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          body1: TextStyle(
            fontSize: 20.0,
          ).apply(fontSizeFactor: 1.5),
        ),
      ),
      home: HomePage(title: 'MobX Poc'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HeroStore hero;
  ScrollController controller = ScrollController(
    keepScrollOffset: false,
  );

  @override
  void initState() {
    super.initState();
    hero = HeroStore();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => Scaffold(
        appBar: AppBar(
          backgroundColor: hero.isDead ? Colors.red : Colors.blue,
          title: Text(widget.title),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 16.0),
              SizedBox(
                width: 500,
                child: Text(
                  "My Hero",
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              Image.network(hero.model.imageUrl),
              const SizedBox(height: 16.0),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: 200,
                    child: Text("Hero's Name:"),
                  ),
                  SizedBox(
                    width: 300,
                    child: Center(child: Text(hero.model.name)),
                  ),
                ],
              ),
              const Divider(
                indent: 150,
                endIndent: 150,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: 200,
                    child: Text("Super Power:"),
                  ),
                  SizedBox(
                    width: 300,
                    child: Center(child: Text(hero.model.power)),
                  ),
                ],
              ),
              const Divider(
                indent: 150,
                endIndent: 150,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    width: 200,
                    child: Text("HP:"),
                  ),
                  SizedBox(
                    width: 300,
                    child: Center(child: Text("${hero.model.hp}")),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              SizedBox(
                width: 500,
                child: Text(
                  "Attack Log",
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              Flexible(
                child: SizedBox(
                  width: 500,
                  child: ListView.builder(
                    controller: controller,
                    shrinkWrap: true,
                    itemCount: hero.log.length,
                    itemBuilder: (context, i) => Text(hero.log[i]),
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.fullscreen_exit),
          tooltip: "Attack Hero",
          backgroundColor: hero.isDead ? Colors.red : Colors.blue,
          onPressed: hero.isDead
              ? hero.reset
              : () => hero.takeDamage(Random().nextInt(10) + 1),
        ),
      ),
    );
  }
}
