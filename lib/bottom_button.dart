import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  final String title;
  final VoidCallback onpressed;

  const BottomButton({super.key, required this.title, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      height: bottomContainerHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffff713a),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: onpressed,
        //     () {
        //   Navigator.pushNamed(context, 'result');
        // },
        child: Text(title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            )),
      ),
    );
  }
}
