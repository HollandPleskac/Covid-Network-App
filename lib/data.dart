import 'package:flutter/material.dart';

class DataVoew extends StatefulWidget {
  @override
  _DataVoewState createState() => _DataVoewState();
}

class _DataVoewState extends State<DataVoew> {
  bool graphexpaned = true;
  bool mapexpaned = true;
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
                          'Graph',
                          style: TextStyle(
                              color: Colors.grey[100],
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: MediaQuery.of(context).size.width * 0.9,
                      decoration: BoxDecoration(
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
                          'Map',
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
                                  'https://i.insider.com/5e6f93c9c4854033994b45d2?width=1136&format=jpeg'),
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
              '20',
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
              'Random Location',
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
              'High-Probability Encounters:',
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
}
