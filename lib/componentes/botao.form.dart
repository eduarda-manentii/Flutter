import 'package:flutter/material.dart';

class Botao extends StatefulWidget {
  final funcao;
  final texto;
  const Botao({super.key, this.funcao, this.texto});

  @override
  State<Botao> createState() => _BotaoState();
}

class _BotaoState extends State<Botao> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize:  const Size(100, 50),
          foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          shadowColor: Colors.black,
          elevation: 30,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          )
        ),
        onPressed: widget.funcao,
        child: Text(widget.texto)),
    );
  }
}