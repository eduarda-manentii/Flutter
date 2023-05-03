import 'package:flutter/material.dart';

class GerarForm extends StatefulWidget {
  
  final controlador;
  final msgValidacao;
  final texto;
  final senha;
  
  const GerarForm({super.key, this.controlador, this.msgValidacao, this.texto, this.senha});

  @override
  State<GerarForm> createState() => _GerarFormState();
}

class _GerarFormState extends State<GerarForm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        controller: widget.controlador,
        validator: (value){
          if (value!.isEmpty) {
            return widget.msgValidacao;
          }
        },
        obscureText: widget.senha,
        decoration: InputDecoration(
          labelText: widget.texto,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15)
          )
        ),
      ),
    );
  }
}