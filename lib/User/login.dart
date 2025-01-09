import 'package:flutter/material.dart';
import 'package:gamecatalog/User/directtoLink.dart';
import 'package:gamecatalog/User/register.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:gamecatalog/database/sql_helper.dart';
import 'package:gamecatalog/User/success.dart';

class Login extends StatefulWidget {
  const Login({Key? key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isHidden = true;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  List<Map<String, dynamic>> user = [];

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  Future<void> _login() async {
    final email = _emailController.text;
    final password = _passwordController.text;

    final user = await SQLHelper.login(email, password);

    if (user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: AwesomeSnackbarContent(
            title: 'Success',
            message: 'Login Successful',
            contentType: ContentType.success,
          ),
          duration: Duration(seconds: 2),
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
        ),
      );
      await Future.delayed(Duration(seconds: 1));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Success(id: user['id'])),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: AwesomeSnackbarContent(
            title: 'Failed',
            message: 'Email or password are incorrect.',
            contentType: ContentType.failure,
          ),
          duration: Duration(seconds: 2),
          elevation: 0,
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.transparent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  child: Text('Welcome Back',
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
                SizedBox(
                  height: 100,
                ),
                Container(
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
                    onPressed: () async {
                      if (_emailController.text.isEmpty ||
                          _passwordController.text.isEmpty) {
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
                        await _login();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: EdgeInsets.only(left: 130, right: 130)),
                    child: Text('Login',
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
                        Text('Create An Account',
                            style: TextStyle(
                              color: Color(0xFF8D92A3),
                              fontSize: 15,
                            )),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register(
                                        id: null,
                                        name: null,
                                        email: null,
                                        password: null)));
                          },
                          child: Text('Sign Up',
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
}
