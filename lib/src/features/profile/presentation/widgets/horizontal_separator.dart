import 'package:flutter/material.dart';

class HorizontalSeparator extends StatelessWidget {
  const HorizontalSeparator({super.key, this.width = double.infinity});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: 1.0,
        color: const Color.fromRGBO(48, 48, 48, 1),
      ),
    );
  }
}
