import 'package:flutter/material.dart';

class CustomPanel extends StatefulWidget {
  CustomPanel({
    Key key,
    @required this.body,
    @required this.header,
    this.isExpanded,
    this.expandedCallback,
  }) : super(key: key);

  final bool isExpanded;
  final Widget header;
  final Widget body;
  final void Function(bool) expandedCallback;

  @override
  _CustomPanelState createState() => _CustomPanelState();
}

class _CustomPanelState extends State<CustomPanel>
    with SingleTickerProviderStateMixin {
  bool isExpanded;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.isExpanded ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Material(
            color: Colors.white,
            child: InkWell(
              onTap: () {
                setState(() {
                  isExpanded = !isExpanded;
                  widget.expandedCallback(isExpanded);
                });
              },
              child: Container(
                margin: isExpanded
                    ? const EdgeInsets.symmetric(vertical: 8)
                    : EdgeInsets.zero,
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 16.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    widget.header,
                    Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                    ),
                  ],
                ),
              ),
            ),
          ),
          isExpanded
              ? Container(
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.grey.shade100,
                  child: widget.body,
                )
              : Container(),
        ],
      ),
    );
  }
}
