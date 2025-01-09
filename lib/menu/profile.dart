import 'package:flutter/material.dart';
import 'package:gamecatalog/database/sql_helper.dart';
import 'package:gamecatalog/main.dart';
import 'package:gamecatalog/content/editProfile.dart';

class ProfilePage extends StatefulWidget {
  final int? id;
  const ProfilePage({
    super.key,
    required this.id,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isHidden = true;
  String _name = '';
  String _email = '';
  String _password = '';

  Future<void> _loadUserData(int id) async {
    Map<String, dynamic> userData = await SQLHelper.readUser(id);
    if (userData.isNotEmpty) {
      setState(() {
        _name = userData['name'];
        _email = userData['email'];
        _password = userData['password'];
      });
    }
  }

  @override
  void initState() {
    _loadUserData(widget.id!);
    super.initState();
  }

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.1),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xFF15244D),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                spreadRadius: 2,
                blurRadius: 7,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: AppBar(
            actions: [
              Image.asset(
                'images/Vector/icon_GameKatalog_home.png',
                height: 80,
                width: 80,
              ),
            ],
            backgroundColor: Color(0xFF15244D),
            elevation: 0,
            title: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Profile',
                  style: TextStyle(
                    color: Color(0xFF1E90B5),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'View User Profile',
                  style: TextStyle(
                    color: Color(0xFF8D92A3),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFF182641),
      body: Column(
        children: [
          Container(
              margin: const EdgeInsets.only(top: 45.0, left: 20.0),
              alignment: Alignment.centerLeft,
              child: Text('Name',
                  style: TextStyle(color: Color(0xFF1E90B5), fontSize: 16))),
          Container(
            margin: EdgeInsets.only(top: 15, left: 20, right: 20),
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.06,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xFF131C35)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                spacing: 10,
                children: [
                  Icon(Icons.person, color: Color(0xFF8D92A3)),
                  Text(
                    _name.isNotEmpty ? _name : 'Loading...',
                    style: TextStyle(color: Color(0xFF8D92A3)),
                  ),
                ],
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 20.0, left: 20.0),
              alignment: Alignment.centerLeft,
              child: Text('Email',
                  style: TextStyle(color: Color(0xFF1E90B5), fontSize: 16))),
          Container(
            margin: EdgeInsets.only(top: 15, left: 20, right: 20),
            width: double.infinity,
            height: MediaQuery.sizeOf(context).height * 0.06,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xFF131C35)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                spacing: 10,
                children: [
                  Icon(Icons.email, color: Color(0xFF8D92A3)),
                  Text(
                    _email.isNotEmpty ? _email : 'Loading...',
                    style: TextStyle(color: Color(0xFF8D92A3)),
                  ),
                ],
              ),
            ),
          ),
          Container(
              margin: const EdgeInsets.only(top: 20.0, left: 20.0),
              alignment: Alignment.centerLeft,
              child: Text('Password',
                  style: TextStyle(color: Color(0xFF1E90B5), fontSize: 16))),
          Container(
            height: MediaQuery.sizeOf(context).height * 0.06,
            margin: EdgeInsets.only(top: 15, left: 20, right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xFF131C35)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 10,
                    children: [
                      Icon(Icons.lock, color: Color(0xFF8D92A3)),
                      Text(
                        _isHidden
                            ? '●●●●●●●●'
                            : _password.isNotEmpty
                                ? _password
                                : 'Loading...',
                        style: TextStyle(color: Color(0xFF8D92A3)),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(
                      _isHidden ? Icons.visibility_off : Icons.visibility,
                      color: Color(0xFF8D92A3),
                    ),
                    onPressed: _toggleVisibility,
                    padding: EdgeInsets.zero,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 50),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.9,
            height: MediaQuery.sizeOf(context).height * 0.06,
            child: OutlinedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Editprofile(
                      id: widget.id,
                      name: _name,
                      email: _email,
                      password: _password,
                    ),
                  ),
                );
                if (result == true) {
                  _loadUserData(widget.id!);
                }
              },
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: BorderSide(color: Color(0xFFEE8924), width: 1),
                backgroundColor: Colors.transparent,
              ),
              child: Text(
                'Edit Profile',
                style: TextStyle(
                  color: Color(0xFFEE8924),
                  fontSize: 16,
                ),
              ),
            ),
          ),
          SizedBox(height: 25),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.9,
            height: MediaQuery.sizeOf(context).height * 0.06,
            child: OutlinedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => MainApp()));
              },
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: BorderSide(color: Color(0xFFEB0029), width: 1),
                backgroundColor: Colors.transparent,
              ),
              child: Text(
                'Logout',
                style: TextStyle(
                  color: Color(0xFFEB0029),
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
