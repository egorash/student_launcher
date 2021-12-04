import 'package:flutter/material.dart';
import 'package:students_launcher/gadget.dart';
import 'package:students_launcher/news_gadget.dart';
import 'package:students_launcher/weather_gadget.dart';

class WidgetsScreen extends StatefulWidget {
  const WidgetsScreen({Key? key}) : super(key: key);

  @override
  _WidgetsScreenState createState() => _WidgetsScreenState();
}

class _WidgetsScreenState extends State<WidgetsScreen> {
  Widget weather = const WeatherGadget();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            const SizedBox(height: 100),
            const Text(
              "Whats new?",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Gadget(
                title: "Weather",
                content: SizedBox(
                  height: 60,
                  child: weather,
                )),
            const Gadget(title: "News", content: NewsGadget()),
          ],
        ),
      ),
    );
  }
}
