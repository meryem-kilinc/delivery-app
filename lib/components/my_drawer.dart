import 'package:flutter/material.dart';
import 'package:teslimat/components/my_drawer_tile.dart';
import 'package:teslimat/pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //app logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
            Icons.lock_open_rounded,
            size: 50,
            color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

            //home list tile
          MyDrawerTile(
          icon: Icons.home, 
          onTap: () => Navigator.pop(context),
          text: "A N A S A Y F A"
          ),

            //settings list tile
            MyDrawerTile(
          icon: Icons.settings, 
          onTap: () {
           Navigator.pop(context);
           Navigator.push(
            context,
            MaterialPageRoute(builder: (context)=> const SettingsPage(),
            )
            );
          }, 
          text: "A Y A R L A R"
          ),

          const Spacer(),

            //logout list tile
            MyDrawerTile(
          icon: Icons.logout, 
          onTap: () {}, 
          text: "Ç I K I Ş "
          ),

        const SizedBox(height: 25),

        ],
      ),
    );
  }
}