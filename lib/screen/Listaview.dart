import 'package:flutter/material.dart';
import 'Detalle.dart';
import 'package:flutter_email/models/email.dart';

import 'package:flutter_email/widget/EmailWidget.dart';
import 'package:flutter_email/models/backend.dart';

class Lista extends StatefulWidget {
  const Lista({Key? key}) : super(key: key);

  @override
  State<Lista> createState() => _HomePageState();
}

class _HomePageState extends State<Lista> {
  // For holding response as UserPets
  late List<Email> usersPets;
  // for data is loaded flag
  bool isDataLoaded = false;
  // error holding
  String errorMessage = '';

  callAPIandAssignData() async {
    usersPets = Backend().getEmails();
  }

  @override
  void initState() {
    callAPIandAssignData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('Correo Villamar Alcivar'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: usersPets.length,
          itemBuilder: (context, index) => EmailWidget(indexs: index),
        ));
  }
}
