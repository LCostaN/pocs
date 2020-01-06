import 'package:flutter/material.dart';

import 'main.dart';

class SearchActionButton extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  SearchActionButton(this.data, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.search),
      tooltip: "Search Delegate",
      onPressed: () {
        showSearch(
          context: context,
          delegate: PocSearchDelegate(data),
        );
      },
    );
  }
}

class PocSearchDelegate extends SearchDelegate {
  final List<Map<String, dynamic>> data;
  PocSearchDelegate(this.data);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    var realtimeResult = data.where((item) {
      return (item["dado 1"] as String).contains(query) ||
          (item["dado 2"] as String).contains(query) ||
          (item["dado 3"] as String).contains(query) ||
          (item["dado 4"] as String).contains(query);
    }).toList();
    return PocList(data: realtimeResult);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var realtimeResult = data.where((item) {
      return (item["dado 1"] as String).contains(query) ||
          (item["dado 2"] as String).contains(query) ||
          (item["dado 3"] as String).contains(query) ||
          (item["dado 4"] as String).contains(query);
    }).toList();
    return PocList(data: realtimeResult);
  }
}
