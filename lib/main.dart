import 'package:covid_network_app/Arm.dart';
import 'package:covid_network_app/data.dart';
import 'package:flutter/material.dart';

import './login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(),
    );
  }
}
