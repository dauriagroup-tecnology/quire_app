import '../../../pages/widgets/circular_image.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  final String imageUrl =
      "https://scontent-fco1-1.xx.fbcdn.net/v/t1.0-9/87784948_10221597400235235_3873258789511626752_n.jpg?_nc_cat=109&_nc_sid=09cbfe&_nc_ohc=wvucq8UnAogAX_-Jlbo&_nc_ht=scontent-fco1-1.xx&oh=7c15b966f7f26baf59afe083273ef7ff&oe=5F1BDF19";

  final Function onUpdate;

  final List<MenuItem> options = [
    MenuItem(Icons.search, 'Search'),
    MenuItem(Icons.shopping_basket, 'Basket'),
    MenuItem(Icons.favorite, 'Discounts'),
    MenuItem(Icons.code, 'Prom-codes'),
    MenuItem(Icons.format_list_bulleted, 'Orders'),
  ];

  MenuScreen({this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: onUpdate,
      child: Container(
        padding: EdgeInsets.only(
            top: 62,
            left: 32,
            bottom: 8,
            right: MediaQuery.of(context).size.width / 2.9),
        color: Colors.blueGrey[50],
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: CircularImage(
                      NetworkImage(imageUrl),
                    ),
                  ),
                  Text(
                    'Vincenzo',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  )
                ],
              ),
              Spacer(),
              Column(
                children: options.map((item) {
                  return ListTile(
                    leading: Icon(
                      item.icon,
                      color: Colors.black,
                      size: 20,
                    ),
                    title: Text(
                      item.title,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  );
                }).toList(),
              ),
              Spacer(),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.settings,
                  color: Colors.black,
                  size: 20,
                ),
                title: Text('Settings',
                    style: TextStyle(fontSize: 14, color: Colors.black)),
              ),
              ListTile(
                onTap: () {},
                leading: Icon(
                  Icons.headset_mic,
                  color: Colors.black,
                  size: 20,
                ),
                title: Text('Support',
                    style: TextStyle(fontSize: 14, color: Colors.black)),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuItem {
  String title;
  IconData icon;

  MenuItem(this.icon, this.title);
}