import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  final url = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ';

  Future<String> getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username') ?? '';
  }

  Future<int?> getKourses(String username) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('corsaUsers')
        .doc(username)
        .get();
    final data = snapshot.data();
    final kourses = data?['kourses'] as int?;
    return kourses; // return null if `kourses` field is not found
  }

  void launchUrl() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: getUsername(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          // While the username is being retrieved
          return Text('');
        }

        final username = snapshot.data!;
        return FutureBuilder<int?>(
          future: getKourses(username),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              // While the kourses are being retrieved
              return Text('');
            }

            final kourses = snapshot.data;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                        padding: EdgeInsets.only(
                          left: 20.0,
                          top: 20.0,
                        ),
                        child: Card(
                          elevation: 5,
                          child: Padding(
                          padding: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
                          child: Text('Connected as: $username')))),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5,right: 5),
                  child: FittedBox(
                      child: Text('Money saved using Corsa',style: TextStyle(fontSize: 90,fontWeight: FontWeight.bold),)),
                ),
                Expanded(
                    child: FittedBox(
                        child:
                            Text('${kourses != null ? kourses! * 1.6 : 0} €'))),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 20.0,
                        bottom: 20.0,
                      ),
                      child: Row(children: [
                        Text('Report a bug: '),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.blue,
                          ),
                          child: IconButton(
                            icon: Icon(Icons.bug_report),
                            onPressed: () => launchUrl(),
                            tooltip: 'Report a bug',
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
