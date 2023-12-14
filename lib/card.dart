import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget? cardWidget; // Make the parameter optional by adding '?'
  final void Function()? whatToDo;
  //or you can do this
  //final VoidCallback whatToDo;
  const ReusableCard(
      {super.key, required this.colour, this.cardWidget, this.whatToDo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: whatToDo,
      child: Container(
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: colour,
        ),
        child: cardWidget,
      ),
    );
  }
}
