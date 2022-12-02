import 'package:flutter/material.dart';
import 'package:flutter_email/screen/Detalle.dart';
import 'package:flutter_email/models/email.dart';

import 'package:flutter_email/models/backend.dart';

class EmailWidget extends StatefulWidget {
  const EmailWidget({Key? key, required this.indexs}) : super(key: key);
  final int indexs;
  @override
  State<EmailWidget> createState() => _EmailWidgetState(indexs);
}

class _EmailWidgetState extends State<EmailWidget> {
  // For holding response as UserPets
  late List<Email> correo;
  late int index;
  // for data is loaded flag
  bool isDataLoaded = false;
  // error holding
  String errorMessage = '';

  _EmailWidgetState(int indexs) {
    this.index = indexs;
  }

  callAPIandAssignData() async {
    correo = Backend().getEmails();
  }

  @override
  void initState() {
    callAPIandAssignData();
    super.initState();
  }

  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ;
    return Card(
        // Then show a snackbar.
        child: Dismissible(
      direction: DismissDirection.horizontal,
      key: Key('item ${correo[index].id}'),
      background: Container(
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Icon(Icons.delete, color: Colors.white),
        ),
      ),
      secondaryBackground: Container(
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Icon(Icons.delete, color: Colors.white),
        ),
      ),
      onDismissed: (DismissDirection direction) {
        if (direction == DismissDirection.down) {
          print("Add to favorite");
        } else {
          print('Remove item');
        }

        setState(() {
          Backend().deleteEmail(correo[index].id);
        });
      },
      child: ListTile(
        onTap: () {
          // Navigate to Next Details
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(correoDetalle: correo[index]),
              ));
        },
        onLongPress: () {
          Backend().markEmailAsRead(correo[index].id);
          print('actualizado');
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Correo leido')));
          refresh();
        },
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Suject: ${correo[index].subject}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('De: ${correo[index].from}'),
            Text(
              correo[index].dateTime.toString(),
              textAlign: TextAlign.left,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
        trailing: Icon(
          correo[index].read ? Icons.brightness_1 : Icons.brightness_1,
          color: correo[index].read ? Colors.green : Colors.red,
        ),
      ),
    ));
  }
}
