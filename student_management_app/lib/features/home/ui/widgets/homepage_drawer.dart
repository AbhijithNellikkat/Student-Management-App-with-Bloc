import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(user.photoURL!),
                    ),
                    IconButton(
                      onPressed: () => FirebaseAuth.instance.signOut(),
                      icon: const Icon(
                        Icons.logout_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${user.displayName}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text('📩 ${user.email}'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 18.0, top: 18.0),
                  child: Text(
                    'General',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 12),
                const Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Color.fromARGB(255, 10, 150, 163),
                    ),
                    title: Text('Account'),
                    trailing: Icon(Icons.arrow_right_alt),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: const Icon(
                      Icons.notifications,
                      color: Color.fromARGB(255, 10, 150, 163),
                    ),
                    title: const Text('Notification'),
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                ),
                const Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.settings,
                      color: Color.fromARGB(255, 10, 150, 163),
                    ),
                    title: Text('Settings'),
                    trailing: Icon(Icons.arrow_right_alt),
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.only(left: 18.0, top: 18.0),
                  child: Text(
                    'About',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 12),
                const Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.privacy_tip,
                      color: Color.fromARGB(255, 10, 150, 163),
                    ),
                    title: Text('Privacy Policy'),
                    trailing: Icon(Icons.arrow_right_alt),
                  ),
                ),
                const Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.help_rounded,
                      color: Color.fromARGB(255, 10, 150, 163),
                    ),
                    title: Text('Help & Feedback'),
                    trailing: Icon(Icons.arrow_right_alt),
                  ),
                ),
                const Card(
                  child: ListTile(
                    leading: Icon(
                      Icons.error_sharp,
                      color: Color.fromARGB(255, 10, 150, 163),
                    ),
                    title: Text('AboutUs'),
                    trailing: Icon(Icons.arrow_right_alt),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}