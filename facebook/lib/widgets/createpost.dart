import 'package:flutter/material.dart';

class Createpost extends StatelessWidget {
  final VoidCallback? onpostCreate;
  const Createpost({super.key, this.onpostCreate});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onpostCreate,
      leading: const CircleAvatar(
        backgroundImage: AssetImage("assetes/profile/prof2.jpg"),
      ),
      title: const TextField(
        decoration: InputDecoration(
          hintText: "what u thinking?",
          border: InputBorder.none,
        ),
      ),
      trailing: const Icon(Icons.image),
    );
  }
}