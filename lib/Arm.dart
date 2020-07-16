import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:uuid/uuid.dart';

import './data.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool armed = false;
  bool darkmode = false;
  FlutterBlue flutterBlue = FlutterBlue.instance;

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: darkmode ? Colors.white : Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (armed) {
                  armed = false;
                  flutterBlue.startScan(timeout: Duration(seconds: 4));
                  // ignore: cancel_subscriptions
                  var subscription = flutterBlue.scanResults.listen((results) {
                    // do something with scan results
                    for (ScanResult r in results) {
                      print('${r.device.name} found! rssi: ${r.rssi}');
                    }
                  });
                  subscription;
                } else {
                  armed = true;
                }
              });
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.65,
                    height: MediaQuery.of(context).size.width * 0.65,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: darkmode ? Colors.grey[200] : Colors.grey[900]),
                  ),
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    height: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: armed ? Colors.red[400] : Colors.blue[200]),
                  ),
                ),
                Center(
                  child: Text(
                    armed ? 'Disarm' : 'Arm',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DataVoew(),
                    // Pass the arguments as part of the RouteSettings. The
                    // DetailScreen reads the arguments from these settings.
                    settings: RouteSettings(
                      arguments: darkmode,
                    ),
                  ),
                );
              },
              child: Container(
                width: 150,
                height: 45,
                child: Center(
                  child: Text(
                    'Data',
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: darkmode ? Colors.grey[200] : Colors.grey[900]),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (darkmode) {
              darkmode = false;
            } else {
              darkmode = true;
            }
          });
        },
        child: Icon(
          Icons.navigation,
          color: darkmode ? Colors.white : Colors.black,
        ),
        backgroundColor: darkmode ? Colors.black : Colors.white,
      ),
    );
  }
}
