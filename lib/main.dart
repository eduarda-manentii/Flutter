import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'componentes/botao.form.dart';
import 'componentes/caixa_texto.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  

    //CAMPOS DE ENDERECO
    final cep = TextEditingController();
    String cidade = "";
    String uf = "";

    //CAMPO DE TEMPO
    String dateToday = "";
    String hour = "";
    String temp = "";
    String descriptionToday = "";
    String descriptionTomorrow = "";
    String nextDate = "";
    String img = "";

  @override
  Widget build(BuildContext context) {

    viaTempo() async {
      final String urlViaCep = "https://viacep.com.br/ws/${cep.text}/json/";
      Response respostaCep = await get(Uri.parse(urlViaCep));
      Map endereco = json.decode(respostaCep.body);
      setState(() {
        cidade = "Cidade: ${endereco['localidade']}";
        uf = "UF: ${endereco['uf']}";
      });

      final String urlViaTempo =  "https://api.hgbrasil.com/weather?format=json-cors&key=4f228a35&city_name=${cidade},${uf}";
      Response respostaTempo = await get(Uri.parse(urlViaTempo));
      Map tempo = json.decode(respostaTempo.body);
      setState(() {
        dateToday =  "Data: ${tempo['results']['date']}";
        hour =  "Hora: ${tempo['results']['time']}";
        temp = "Temperatura: ${tempo['results']['temp']}°";
        descriptionToday = "Descrição: ${tempo['results']['description']}";
        nextDate = "${tempo['results']['forecast'][1]['weekday']} - ${tempo['results']['forecast'][1]['date']} ";
        descriptionTomorrow = "${tempo['results']['forecast'][1]['description']}";
        img = "${tempo['results']['img_id']}";
      });

      }


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      home: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                 Expanded(
                  child: CaixaTexto(
                    controlador: cep,
                    texto: 'Cep',
                    message:'Digite o CEP'
                  ),
                ),

                Botao(
                    funcao: viaTempo,
                    texto: 'OK'
                ),
              ],
            ),

            Column(
              children: [
                Text(cidade),
                Text(dateToday),
                Text(hour),
                Text(temp),
                Text(descriptionToday),
              ],
            ),

            Column(
              children: [
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: 700,
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                             nextDate
                          )
                        ),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: 700,
                    height: 200,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0),
                        style: BorderStyle.solid,
                        width: 1.0,
                      ),
                    ),
                    child: Text(
                      descriptionTomorrow
                      ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      
    );
    
  }
}