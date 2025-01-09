import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:gamecatalog/database/sql_helper.dart';

class Editprofile extends StatefulWidget {
  const Editprofile(
      {super.key,
      required this.id,
      required this.name,
      required this.email,
      required this.password});

  final int? id;
  final String? name, email, password;

  @override
  State<Editprofile> createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  bool _isHidden = true;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.name != null) {
      _nameController.text = widget.name!;
      _emailController.text = widget.email!;
      _passwordController.text = widget.password!;
      _confirmPasswordController.text = widget.password!;
    }
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
                  'Edit Profile',
                  style: TextStyle(
                    color: Color(0xFF1E90B5),
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Edit User Profile',
                  style: TextStyle(
                    color: Color(0xFF8D92A3),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_circle_left_outlined,
                color: Color(0xFF1E90B5),
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xFF182641),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(top: 45.0, left: 20.0),
                alignment: Alignment.centerLeft,
                child: Text('Name',
                    style: TextStyle(color: Color(0xFF1E90B5), fontSize: 16))),
            Container(
              margin: EdgeInsets.only(top: 15, left: 20, right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xFF131C35)),
              child: TextField(
                controller: _nameController,
                style: TextStyle(color: Color(0xFF8D92A3), fontSize: 15),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Color(0xFF8D92A3)),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Color(0xFF8D92A3),
                  ),
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
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xFF131C35)),
              child: TextField(
                controller: _emailController,
                style: TextStyle(color: Color(0xFF8D92A3), fontSize: 15),
                decoration: InputDecoration(
                  hintStyle: TextStyle(color: Color(0xFF8D92A3)),
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: EdgeInsets.all(15),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Color(0xFF8D92A3),
                  ),
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 20.0, left: 20.0),
                alignment: Alignment.centerLeft,
                child: Text('Password',
                    style: TextStyle(color: Color(0xFF1E90B5), fontSize: 16))),
            Container(
              margin: EdgeInsets.only(top: 15, left: 20, right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xFF131C35)),
              child: TextField(
                controller: _passwordController,
                obscureText: _isHidden,
                style: TextStyle(color: Color(0xFF8D92A3), fontSize: 15),
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Color(0xFF8D92A3)),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.all(15),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color(0xFF8D92A3),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isHidden ? Icons.visibility_off : Icons.visibility,
                        color: Color(0xFF8D92A3),
                      ),
                      onPressed: _toggleVisibility,
                    )),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 20.0, left: 20.0),
                alignment: Alignment.centerLeft,
                child: Text('Confirm Password',
                    style: TextStyle(color: Color(0xFF1E90B5), fontSize: 16))),
            Container(
              margin: EdgeInsets.only(top: 15, left: 20, right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xFF131C35)),
              child: TextField(
                controller: _confirmPasswordController,
                obscureText: _isHidden,
                style: TextStyle(color: Color(0xFF8D92A3), fontSize: 15),
                decoration: InputDecoration(
                    hintStyle: TextStyle(color: Color(0xFF8D92A3)),
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    contentPadding: EdgeInsets.all(15),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Color(0xFF8D92A3),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isHidden ? Icons.visibility_off : Icons.visibility,
                        color: Color(0xFF8D92A3),
                      ),
                      onPressed: _toggleVisibility,
                    )),
              ),
            ),
            SizedBox(height: 50),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.9,
              height: MediaQuery.sizeOf(context).height * 0.06,
              child: OutlinedButton(
                onPressed: () async {
                  if (_passwordController.text !=
                      _confirmPasswordController.text) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: AwesomeSnackbarContent(
                          title: 'Failed',
                          message:
                              'Password and Confirm Password must be the same',
                          contentType: ContentType.failure,
                        ),
                        duration: Duration(seconds: 2),
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                      ),
                    );
                  } else if (_nameController.text.isEmpty ||
                      _passwordController.text.isEmpty ||
                      _emailController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: AwesomeSnackbarContent(
                          title: 'Warning',
                          message: 'Please fill all the fields',
                          contentType: ContentType.warning,
                        ),
                        duration: Duration(seconds: 2),
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: AwesomeSnackbarContent(
                          title: 'Successful ',
                          message: 'Edit Successful.',
                          contentType: ContentType.success,
                        ),
                        duration: Duration(seconds: 2),
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                      ),
                    );
                    await editUser(widget.id!);
                    Navigator.pop(context, true);
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Color(0xFF0C731C),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> editUser(int id) async {
    await SQLHelper.editUser(id, _nameController.text, _emailController.text,
        _passwordController.text);
  }
}
