// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RandomWidgetMove extends StatefulWidget {
  RandomWidgetMove({
    Key? key,
    this.top,
    this.left,
    this.right,
    this.bottom,
    required this.child,
  }) : super(key: key);
  double? top;
  double? left;
  double? right;
  double? bottom;
  final Widget child;
  @override
  _RandomWidgetMoveState createState() => _RandomWidgetMoveState();
}

class _RandomWidgetMoveState extends State<RandomWidgetMove> {
  double screenHeight = 0;
  double screenWidth = 0;
  Random random = Random();
  late Timer timer;

  @override
  void initState() {
    super.initState();

    // Get screen dimensions
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;
      screenHeight = size.height;
      screenWidth = size.width;
    });

    // Periodically update the position
    timer = Timer.periodic(const Duration(microseconds: 1), (timer) {
      setState(() {
        widget.top != null
            ? widget.top = random.nextDouble() * (screenHeight - 200)
            : null;
        widget.bottom != null
            ? widget.bottom = random.nextDouble() * (screenHeight - 200)
            : null;
        widget.left != null
            ? widget.left = random.nextDouble() * (screenHeight - 200)
            : null;
        widget.right != null
            ? widget.right = random.nextDouble() * (screenHeight - 200)
            : null;
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(seconds: 7),
      curve: Curves.easeInOutSine,
      top: widget.top,
      left: widget.left,
      right: widget.right,
      bottom: widget.bottom,
      child: widget.child,
    );
  }
}
