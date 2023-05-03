import 'package:flutter/material.dart';
import 'package:assignment_app/main.dart';
import '../widget/menutile.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              title: const Text('Hello friend!'),
              automaticallyImplyLeading: false,
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.manage_accounts_outlined,
                color: Colors.deepPurple,
              ),
              title: const Text('Profile'),
              onTap: () {},
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.local_post_office_outlined,
                color: Colors.deepPurple,
              ),
              title: const Text('Company Info'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (ctx) {
                    return dailogBox(
                      onCancel: () => Navigator.of(context).pop(),
                    );
                  },
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(
                Icons.manage_accounts_outlined,
                color: Colors.deepPurple,
              ),
              title: const Text('Logout'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AuthState(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
