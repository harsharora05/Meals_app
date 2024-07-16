import 'package:flutter/material.dart';

class MealTraitItem extends StatelessWidget {
  const MealTraitItem({super.key, required this.icon, required this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 18,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        )
      ],
    ));
  }
}
