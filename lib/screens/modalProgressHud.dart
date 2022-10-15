import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ModalHud extends StatefulWidget {
  const ModalHud({super.key});
  static const String id = "progress_screen";
  @override
  State<ModalHud> createState() => _ModalHudState();
}

class _ModalHudState extends State<ModalHud> {
  bool progress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TextButton(
        onPressed: () {},
        child: const Text('Click'),
      ),
    );
  }
}
