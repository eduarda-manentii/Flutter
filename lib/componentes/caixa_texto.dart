import 'package:flutter/material.dart';


class CaixaTexto extends StatefulWidget {
    final controlador;
    final msgValidador;
    final texto;
    final message;
    final senha;


   const CaixaTexto({
    super.key,
    this.controlador,
    this.msgValidador,
    this.texto,
    this.senha = false,
    this.message,
   });

  @override
  State<CaixaTexto> createState() => _CaixaTextoState();
}

class _CaixaTextoState extends State<CaixaTexto> {
  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        controller: widget.controlador,
        validator: (value) {
          if(value!.isEmpty) {
            return widget.msgValidador;
          }
        },

        obscureText: widget.senha,
        decoration: InputDecoration(
          labelText: widget.texto,
          hintText: widget.message,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),

      ),
      );
  }
}