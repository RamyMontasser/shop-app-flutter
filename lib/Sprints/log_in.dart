import 'package:flutter/material.dart';
import 'sec_page.dart';


class MyLogIn extends StatefulWidget {
  const MyLogIn({super.key});

  @override
  State<MyLogIn> createState() => _MyLogInState();
}

class _MyLogInState extends State<MyLogIn> {
  bool privatePass = true;
  TextEditingController eMail = TextEditingController();
  TextEditingController password = TextEditingController();
  IconData eye = Icons.visibility_off;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(height: 20),

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
                  obscureText: privatePass,
                  controller: password,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password can't be empty";
                    } else if (value.length < 6) {
                      return "Password should be more than 6 characters";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: IconButton(
                      onPressed: passprivacy,
                      icon: Icon(eye),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(250, 40),

                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text("Account created successfully"),
                            content:  Text("welcome"),
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
                     else {
                      ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Invalid email or password'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                    }
                  },
                  child: const Text('Log in'),
                ),
              ],
            ),
          ),
        ),
    );
  }
  
  passprivacy() async {
    privatePass = !privatePass;
    if (eye == Icons.visibility) {
      eye = Icons.visibility_off;
    } else {
      eye = Icons.visibility;
    }
    setState(() {});
  }
}