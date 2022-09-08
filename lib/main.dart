import 'package:app_localnotification_bakapp/router/router.dart';
import 'package:app_localnotification_bakapp/services/notification.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        Provider<NotificationService>(
          create: (context) => NotificationService(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    checkNotifications();
  }

  checkNotifications() async {
    await Provider.of<NotificationService>(context, listen: false)
        .checkForNotifications();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<NotificationService>(
          create: (context) => NotificationService(),
        ),
      ],
      child: MaterialApp(
        routes: Routes.list,
        initialRoute: Routes.initial,
        navigatorKey: Routes.navigatorKey,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
