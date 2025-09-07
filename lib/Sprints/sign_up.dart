import 'package:flutter/material.dart';
import 'log_in.dart';
import 'sec_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController eMail = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordConf = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool privatePass1 = true;
  bool privatePass2 = true;
  IconData eye1 = Icons.visibility_off;
  IconData eye2 = Icons.visibility_off;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03,
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),

                Center(
                  child: Text(
                    'Create new account',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),

                SizedBox(height: 20),

                TextFormField(
                  controller: fullName,
                  decoration: InputDecoration(
                    focusColor: Colors.blue,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: 'Full Name',
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Full name can't be empty";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 10),

                TextFormField(
                  controller: eMail,
                  decoration: InputDecoration(
                    focusColor: Colors.blue,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: 'E-mail',
                    prefixIcon: Icon(Icons.mail),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "E-Mail can't be empty";
                    } else if (!value.contains('@')) {
                      return "E-mail should contain '@'";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 10),

                TextFormField(
                  controller: password,
                  obscureText: privatePass1,
                  decoration: InputDecoration(
                    focusColor: Colors.blue,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: IconButton(
                      onPressed: () {
                        passprivacy(1);
                      },
                      icon: Icon(eye1),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password can't be empty";
                    } else if (value.length < 6) {
                      return "Password should be more than 6 characters";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 10),

                TextFormField(
                  controller: passwordConf,
                  obscureText: privatePass2,
                  decoration: InputDecoration(
                    focusColor: Colors.blue,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: 'Confirm Password',
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: IconButton(
                      onPressed: () {
                        passprivacy(2);
                      },
                      icon: Icon(eye2),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Full name can't be empty";
                    } else if (value != password.text) {
                      return "Password doesn't match";
                    }
                    return null;
                  },
                ),

                SizedBox(height: 10),

                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      String name = fullName.text;
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Account created successfully"),
                            content: Text("welcome $name"),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const SecPage(),
                                    ),
                                  );
                                },
                                child: const Text("Close"),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(250, 40),

                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text('Sign up', style: TextStyle(fontSize: 20)),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already have an accounts'),

                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyLogIn()),
                        );
                      },
                      child: Text('Sign in'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void passprivacy(int field) {
    setState(() {
      if (field == 1) {
        privatePass1 = !privatePass1;
        eye1 = privatePass1 ? Icons.visibility_off : Icons.visibility;
      } else {
        privatePass2 = !privatePass2;
        eye2 = privatePass2 ? Icons.visibility_off : Icons.visibility;
      }
    });
  }
}
