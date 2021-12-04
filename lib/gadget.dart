import 'package:flutter/material.dart';

class Gadget extends StatefulWidget {
  final String title;
  final Widget content;
  const Gadget({Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  _GadgetState createState() => _GadgetState();
}

class _GadgetState extends State<Gadget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.title),
        subtitle: Padding(
          padding: const EdgeInsets.all(16.0),
          child: widget.content,
        ),
      ),
    );
  }
}
