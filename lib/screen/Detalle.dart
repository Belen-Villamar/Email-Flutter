import 'package:flutter/material.dart';
import 'package:flutter_email/models/email.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.correoDetalle});
  final Email correoDetalle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(" ${correoDetalle.subject}"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const SizedBox(height: 10),
                Text(
                  "Cuerpo del correo ",
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  "",
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  "From: ${correoDetalle.from} ",
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  "",
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  "Tema: ${correoDetalle.subject} ",
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  "",
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  correoDetalle.body,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 24),
                ),
                Text(
                  "",
                  textAlign: TextAlign.left,
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  "Date: ${correoDetalle.dateTime} ",
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 18, color: Colors.green),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "",
                      textAlign: TextAlign.left,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
