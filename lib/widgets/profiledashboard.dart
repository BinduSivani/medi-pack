import 'package:flutter/material.dart';
import 'package:myapp/screens/Accounts.dart';

class SideBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white60,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('N Sudharshan'),
            accountEmail: Text('user@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage('https://i.imgur.com/pZTVnuM.png'),
            ),
          ),
          InkWell(
            child: ListTile(
              leading: Icon(Icons.person_3_rounded, color: Colors.redAccent),
              title: Text('My Profile'),
            ),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Accounts()), // Navigate to Accounts screen
              );
            },
          ),
          InkWell(
            child: ListTile(
              leading: Icon(Icons.info, color: Colors.blueAccent),
              title: Text('About'),
            ),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              // Add logic to navigate to the About screen or perform an action
            },
          ),
          InkWell(
            child: ListTile(
              leading: Icon(Icons.settings, color: Colors.grey),
              title: Text('Settings'),
            ),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              // Add logic to navigate to the Settings screen or perform an action
            },
          ),
        ],
      ),
    );
  }
}
