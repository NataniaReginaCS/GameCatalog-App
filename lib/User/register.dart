import 'package:flutter/material.dart';
import 'package:gamecatalog/User/directtoLink.dart';
import 'package:gamecatalog/User/login.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:gamecatalog/database/sql_helper.dart';

class Register extends StatefulWidget {
  const Register(
      {super.key,
      required this.id,
      required this.name,
      required this.email,
      required this.password});

  final String? name, email, password;
  final int? id;

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool _isHidden = true;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.id != null) {
      _nameController.text = widget.name!;
      _emailController.text = widget.email!;
      _passwordController.text = widget.password!;
      _confirmPasswordController.text = widget.password!;
    }

    return Scaffold(
      backgroundColor: Color(0xFF15244D),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 80),
                  child: Text('Register',
                      style: TextStyle(
                          color: Color(0xFF1E90B5),
                          fontSize: 36,
                          fontWeight: FontWeight.w900)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xFF131C35)),
                  child: TextField(
                    controller: _nameController,
                    style: TextStyle(color: Color(0xFF8D92A3), fontSize: 15),
                    decoration: InputDecoration(
                      hintText: 'Username',
                      hintStyle:
                          TextStyle(color: Color(0xFF8D92A3), fontSize: 15),
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
                  margin: EdgeInsets.only(top: 35, left: 20, right: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xFF131C35)),
                  child: TextField(
                    controller: _emailController,
                    style: TextStyle(color: Color(0xFF8D92A3), fontSize: 15),
                    decoration: InputDecoration(
                      hintText: 'email@gmail.com',
                      hintStyle:
                          TextStyle(color: Color(0xFF8D92A3), fontSize: 15),
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
                  margin: EdgeInsets.only(top: 35, left: 20, right: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xFF131C35)),
                  child: TextField(
                    controller: _passwordController,
                    obscureText: _isHidden,
                    style: TextStyle(color: Color(0xFF8D92A3), fontSize: 15),
                    decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle:
                            TextStyle(color: Color(0xFF8D92A3), fontSize: 15),
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
                  margin: EdgeInsets.only(top: 35, left: 20, right: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Color(0xFF131C35)),
                  child: TextField(
                    controller: _confirmPasswordController,
                    obscureText: _isHidden,
                    style: TextStyle(color: Color(0xFF8D92A3), fontSize: 15),
                    decoration: InputDecoration(
                        hintText: 'Confirm Password',
                        hintStyle:
                            TextStyle(color: Color(0xFF8D92A3), fontSize: 15),
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
                SizedBox(
                  height: 52,
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  height: MediaQuery.sizeOf(context).height * 0.06,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF224C8F), Color(0xFF22D1EE)],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent),
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
                          _confirmPasswordController.text.isEmpty) {
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
                              message:
                                  'Register Successful, Please Login to Continue',
                              contentType: ContentType.success,
                            ),
                            duration: Duration(seconds: 2),
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                          ),
                        );
                        if (widget.id == null) {
                          await addUser();
                        }
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => Login()));
                      }
                    },
                    child: Text('Create Account',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 60),
                    child: Text('- OR Continue with -',
                        style: TextStyle(
                          color: Color(0xFF8D92A3),
                          fontSize: 12,
                        )),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: IconButton(
                          icon: Image.asset('images/Vector/Google.png'),
                          onPressed: () {
                            Direct.launchURL('https://www.google.com');
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: IconButton(
                          icon: Image.asset('images/Vector/Facebook.png'),
                          onPressed: () {
                            Direct.launchURL('https://www.facebook.com');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 30),
                          child: Text('I Already Have an Account',
                              style: TextStyle(
                                color: Color(0xFF8D92A3),
                                fontSize: 15,
                              )),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()));
                          },
                          child: Text('Login',
                              style: TextStyle(
                                color: Color(0xFF1E90B5),
                                fontSize: 15,
                              )),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> addUser() async {
    await SQLHelper.addUser(
        _nameController.text, _emailController.text, _passwordController.text);
  }
}
