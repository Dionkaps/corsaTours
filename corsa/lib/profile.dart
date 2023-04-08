import 'package:blurry/blurry.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

const url = 'https://www.youtube.com/watch?v=C-fKAzdTrLU';

class _ProfileState extends State<Profile> {
  late Future<String> _usernameFuture;
  final uri = Uri.parse(url);
  opUrl() async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
      children: [TextButton(onPressed: opUrl, child: Text('Open URL'))],
    );
  }
}
