import 'package:blurry/blurry.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late Future<String> _usernameFuture;

  @override
  void initState() {
    super.initState();
    _usernameFuture = _getUsername();
  }

  Future<String> _getUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('username') ??
        ''; // Return empty string if username is null
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FutureBuilder(
          future: _usernameFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    child: Text(
                      snapshot.data ?? '',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.edit_square,
                        color: Color.fromARGB(122, 0, 0, 0),
                      ),
                      onPressed: () {
                        setState(() {
                          Blurry.warning(
                                  title: 'Confirm',
                                  description: 'Eisai sigouros?',
                                  confirmButtonText: 'Confirm',
                                  onConfirmButtonPressed: () {})
                              .show(context);
                        });
                      })
                ],
              ); // Show empty string if data is null
            } else {
              return CircularProgressIndicator();
            }
          },
        )
      ],
    );
  }
}
