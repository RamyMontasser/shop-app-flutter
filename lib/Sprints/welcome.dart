import 'package:flutter/material.dart';
import 'log_in.dart';
import 'sign_up.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  List pages = [SignUp(), MyLogIn()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Welcome to our shop',
          style: TextStyle(
            fontFamily: 'Suwannaphum-Regular',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('images/pic-1.png', width: 200, height: 200),
                Image.network('https://media.istockphoto.com/id/1312231371/photo/hand-touching-to-virtual-info-graphics-with-trolley-cart-icons-technology-online-shopping.jpg?s=612x612&w=0&k=20&c=D3M_67i67qxYzIb0rdVNEIHhWw2K-WJHS25H9VvzgAo=',
                width: 200,
                height: 200,),
              ],
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUp()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Sign-up',
                style: TextStyle(
                  fontFamily: 'Suwannaphum-Regular',
                  fontSize: 20,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyLogIn()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Sign-in',
                style: TextStyle(
                  fontFamily: 'Suwannaphum-Regular',
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
