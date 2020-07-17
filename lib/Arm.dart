import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './logic/fire.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:location/location.dart';
import './data.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _fire = Fire();

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool armed = false;
  bool darkmode = false;
  FlutterBlue flutterBlue = FlutterBlue.instance;

  List<String> deviceids = [];
  List longcoords = [];
  List latcoords = [];

  String _email;

  Future getEmail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String uid = prefs.getString('email');

    _email = uid;
    print(_email);
  }

  @override
  void initState() {
    getEmail().then((_) {
      setState(() {});
    });

    super.initState();
  }

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
                  print('now armed');
                  // Start scanning
                  flutterBlue.startScan(
                      timeout: Duration(seconds: 1000000000000000),
                      allowDuplicates: false);

                  // Listen to scan results
                  var subscription =
                      flutterBlue.scanResults.listen((results) async {
                    Location location = new Location();

                    bool _serviceEnabled;
                    PermissionStatus _permissionGranted;
                    LocationData _locationData;
                    _locationData = await location.getLocation();
                    // do something with scan results
                    for (ScanResult r in results) {
                      if (deviceids.contains('${r.device.id}')) {
                        print("");
                      } else {
                        HapticFeedback.vibrate();
                        deviceids.add('${r.device.id}');
                        longcoords.add(_locationData.longitude);
                        latcoords.add(_locationData.latitude);
                        print(_locationData);
                        print('${r.device.id} found! rssi: ${r.rssi}');
                      }
                    }
                  });
                  subscription;
                } else {
                  armed = true;
                  print('now disarmed');
                  // Stop scanning

                  flutterBlue.stopScan();
                  _fire.pressDisarm(
                    deviceids: deviceids,
                    longcoords: longcoords,
                    latcoords: latcoords,
                    email: _email
                  );
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
                    armed ? 'Disarmed' : 'Armed',
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
