import 'package:flutter/material.dart';

import 'home.dart';
import 'register.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    // Function to check login information
    bool checkLoginInfo(String username, String email, String password) {
      if (username == 'admin' &&
          email == 'admin@gmail.com' &&
          password == '12345678') {
        return true;
      } else {
        return false;
      }
    }

    void showError(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    }

    // Controllers for text fields
    final TextEditingController usernameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg.jpeg"),
              fit: BoxFit.fill,
            ),
          ),
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              // Logo
              Image.asset(
                'images/logo.png',
                height: MediaQuery.of(context).size.width / 3.0,
                width: MediaQuery.of(context).size.width / 3.0,
              ),
              const SizedBox(height: 20.0),
              // "Log In" text
              const Text(
                'تسجيل الدخول',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20.0),
              // "Log In" text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'ليس لديك حساب؟',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) {
                            return const Register();
                          }),
                        ),
                      );
                    },
                    child: const Text(
                      'قم بأنشاء حساب جديد',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20.0),
              // username Field
              const Text(
                'اسم المستخدم',
                style: TextStyle(color: Colors.grey, fontSize: 20.0),
              ),
              const SizedBox(height: 5.0),
              TextField(
                textInputAction: TextInputAction.next,
                controller: usernameController,
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              // Email Field
              const Text(
                'الايميل',
                style: TextStyle(color: Colors.grey, fontSize: 20.0),
              ),
              const SizedBox(height: 5.0),
              TextField(
                textInputAction: TextInputAction.next,
                controller: emailController,
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),
              // Password Field
              const Text(
                'كلمة السر',
                style: TextStyle(color: Colors.grey, fontSize: 20.0),
              ),
              const SizedBox(height: 5.0),
              TextField(
                textInputAction: TextInputAction.next,
                controller: passwordController,
                decoration: InputDecoration(
                  fillColor: Colors.grey,
                  filled: true,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 30.0),
              // Submit Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  String username = usernameController.text;
                  String email = emailController.text;
                  String password = passwordController.text;

                  if (checkLoginInfo(username, email, password)) {
                    // Navigate to home screen if login is successful
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) {
                          return const Home();
                        }),
                      ),
                    );
                  } else {
                    showError('UserName Or Email Or Password Is Wrong');
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'دخول',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
