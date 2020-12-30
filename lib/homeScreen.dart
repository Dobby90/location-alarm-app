import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _entries = <String>['A', 'B', 'C', 'D', 'E'];
  List<bool> _switch = [false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Location Alarm',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: _buildBody(width, height),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.access_alarms),
        onPressed: () {},
      ),
    );
  }

  Widget _buildBody(double width, double height) {
    return SafeArea(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 10.0),
        itemCount: _entries.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _entries[index],
                    style: TextStyle(fontSize: width * 0.07, color: Colors.black54),
                  ),
                  CupertinoSwitch(
                      value: _switch[index],
                      onChanged: (value) {
                        setState(() {
                          _switch[index] = value;
                        });
                      }),
                ],
              ),
            ),
          );
        },
        // separatorBuilder: (BuildContext context, int index) => const Divider(
        //   color: Colors.black54,
        // ),
      ),
    );
  }
}
