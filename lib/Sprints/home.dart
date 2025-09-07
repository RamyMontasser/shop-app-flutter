import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [
          SizedBox(
            width: 150,
            height: 200,
            child: PageView(
              children: [
                Image.asset('images/pic-1.png'),
                Image.asset('images/pic3.png'),
                Image.asset('images/pic4.png'),
              ],
            ),
          ),

          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
            child: Text(
              'Products',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          SizedBox(height: 20),

          SizedBox(
            height: 400,
            child: GridView.count(
              crossAxisCount: 2,
              children: [
                items1('images/pic-2.png', 'laptop'),
                items1('images/pic3.png', 'computer'),
                items1('images/pic4.png', 'mobile'),
                items1('images/pic5.png', 'tablet'),
                items1('images/pic6.png', 'cat'),
              ],
            ),
          ),

          SizedBox(height: 30),

          Center(
            child: Text(
              'Hot Offers',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),

          SizedBox(height: 10),

          SizedBox(
            height: 400,
            width: 200,
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
                  child: SizedBox(
                    width: 300,
                    height: 800,
                    child: Column(
                      children: [
                        items2(
                          'images/pic7.png',
                          'Computer',
                          "it's a computer",
                        ),
                        SizedBox(height: 20),
                        items2('images/pic5.png', 'Laptop', "it's a laptop"),
                        SizedBox(height: 20),
                        items2('images/pic3.png', 'Taplet', "it's a taplet"),
                        SizedBox(height: 20),
                        items2('images/pic6.png', 'Mobile', "it's a mobile"),
                        SizedBox(height: 20),
                        items2('images/pic-2.png', 'Cat', "it's a cat"),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Column items1(String img, String name) {
    return Column(
      children: [
        Image.asset(img, height: 140),
        SizedBox(height: 10),
        Row(
          children: [
            SizedBox(width: 30),
            Text(name),
            SizedBox(width: 30),
            IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("item added to the cart"),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
              icon: Icon(Icons.add_shopping_cart_rounded),
            ),
          ],
        ),
      ],
    );
  }

  Row items2(String img, String title, String desc) {
    return Row(
      children: [
        Expanded(child: Image.asset(img, width: 250, height: 125)),
        Column(
          children: [
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            Text(desc),
          ],
        ),
      ],
    );
  }
}
