import 'package:flutter/material.dart';

class ExpTexto extends StatefulWidget {
  final texto;
  final color;
  final size;

  const ExpTexto({super.key, this.texto, this.color, this.size});

  @override
  State<ExpTexto> createState() => _ExpTextoState();
}

class _ExpTextoState extends State<ExpTexto> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        widget.texto,
        style: TextStyle(color: widget.color, fontSize: widget.size),
      ),
    );
  }
}