import 'package:flutter/material.dart';
import 'package:to_do_list/screens/categories_ccreen.dart';
import 'package:to_do_list/screens/home_screen.dart';
class DrawerNavigation extends StatefulWidget {
  @override
  _DrawerNavigationState createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage('https://www.matichon.co.th/wp-content/uploads/2018/11/180px-KU_logo.jpg'),
                ),
                accountName: Text('My Name is Moe'),
                accountEmail: Text('moemoetun4u@gmail.com'),
              decoration: BoxDecoration(color: Colors.blue),
    ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen())),
            ),
            ListTile(
              leading: Icon(Icons.view_list),
              title: Text('Categories'),
                onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoryScreen()))
            ),
          ],

        ),
      ),
    );
  }
}
