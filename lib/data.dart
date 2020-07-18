import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DataVoew extends StatefulWidget {
  @override
  _DataVoewState createState() => _DataVoewState();
}

class _DataVoewState extends State<DataVoew> {
  bool graphexpaned = true;
  bool mapexpaned = true;
  List deviceids;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  if (graphexpaned) {
                    graphexpaned = false;
                  } else {
                    graphexpaned = true;
                  }
                });
              },
              child: Container(
                child: Center(
                  child: Text(
                    graphexpaned ? 'View Map' : 'View Graph',
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                height: 40,
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          graphexpaned
              ? Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (graphexpaned) {
                          graphexpaned = false;
                        } else {
                          graphexpaned = true;
                        }
                      });
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          '',
                          style: TextStyle(
                              color: Colors.grey[100],
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://appdividend.com/wp-content/uploads/2018/09/Charts-in-Angular-6.png'),
                              fit: BoxFit.cover),
                          color: Colors.red[300],
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                )
              : Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        if (graphexpaned) {
                          graphexpaned = false;
                        } else {
                          graphexpaned = true;
                        }
                      });
                    },
                    child: Container(
                      child: Center(
                        child: Text(
                          '',
                          style: TextStyle(
                              color: Colors.grey[100],
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://www.google.com/maps/vt/data=dCKg3mxvEQvLHvPkNutVFa-jXZG-JcLcG7e99qQbtQYTBvjvNVLla9xOedlS902vq5ku46vMzNF-Ki0Q-l2iu7vW8TqXX1Rlc5ZFIrqlXkq8dZcWs0NiYECd6w8IKhHbUTg0TPTZgbx4nGUoP2djUWv3qTlCngkTbXAPO1w0qV23lke05YV1'),
                              fit: BoxFit.cover),
                          color: Colors.red[300],
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(
              'Encounters(Today):',
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 20,
                  fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(
              '22',
              style: TextStyle(
                  color: Colors.grey[100],
                  fontSize: 24,
                  fontWeight: FontWeight.w300),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Divider(
              color: Colors.grey[900],
              thickness: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(
              'Hot Spots:',
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 20,
                  fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(
              'Mountain House',
              style: TextStyle(
                  color: Colors.grey[100],
                  fontSize: 24,
                  fontWeight: FontWeight.w300),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
            child: Divider(
              color: Colors.grey[900],
              thickness: 2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(
              'High Risk Trip:',
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 20,
                  fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Text(
              '2',
              style: TextStyle(
                  color: Colors.grey[100],
                  fontSize: 24,
                  fontWeight: FontWeight.w300),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context);
        },
        label: Text(
          'Back',
          style: TextStyle(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.w800),
        ),
        backgroundColor: Colors.red[200],
      ),
    );
  }
/*
  Widget listofencounters(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection("Logs").snapshots(),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? Text('PLease Wait')
              : ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot products = snapshot.data.documents[index];
                    var now = DateTime.now();
                    var formatter = new DateFormat('yyyy-MM-dd');
                    String formattedDate = formatter.format(now);
                    String date = formattedDate;
                    String todaysdatefirestore = products['name'];

                    if (todaysdatefirestore == date) {
                      return ListTile(
                        title: products['encounters'],
                      );
                    }
                  },
                );
        });
  }

  Widget helped(BuildContext context) {
    return new StreamBuilder(
        stream: Firestore.instance.collection("Logs").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return new Text("Loading");
          } else {
            Map<String, dynamic> documentFields = snapshot.data.data;
            var now = DateTime.now();
            var formatter = new DateFormat('yyyy-MM-dd');
            String formattedDate = formatter.format(now);
            String date = formattedDate;
            String todaysdatefirestore = documentFields['date'];
            int counter = 0;
            if (todaysdatefirestore == formattedDate) {
              documentFields['encounters'].forEach((element) {
                counter++;
              });
            }
            return Text("${counter}");
          }
        });
  }
  */
}
