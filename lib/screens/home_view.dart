import 'package:app_localnotification_bakapp/services/notification.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool valor = false;

  showNotification() {
    setState(() {
      valor = !valor;
      if (valor) {
        Provider.of<NotificationService>(context, listen: false)
            .showLocalNotification(
          CustomNotification(
            id: 1,
            title: 'Titulo',
            body: 'Acceder a la App!',
            payload: 'notificacion',
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 254, 174),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Card(
            child: ListTile(
              title: const Text('Recordar mas tarde'),
              trailing: valor
                  ? Icon(Icons.check_box, color: Colors.amber.shade600)
                  : const Icon(Icons.check_box_outline_blank),
              onTap: showNotification,
            ),
          ),
        ),
      ),
    );
  }
}
