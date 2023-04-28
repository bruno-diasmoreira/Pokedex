import 'package:flutter/material.dart';

class ShimmerWidget extends StatefulWidget {
  ShimmerWidget({super.key});

  @override
  State<ShimmerWidget> createState() => _ShimmerWidgetState();
}

class _ShimmerWidgetState extends State<ShimmerWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
      child: Container(
        width: 150,
        height: 150,
        color: Colors.black.withOpacity(0.07),
      ),
    );
  }
}
