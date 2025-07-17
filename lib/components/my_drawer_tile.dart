import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {

final IconData icon;
final String text;
final void Function()? onTap;


  const MyDrawerTile({
    super.key,
    required this.icon,
    required this.onTap,
    required this.text,
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        title: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}