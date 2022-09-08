import 'package:app_localnotification_bakapp/screens/home_view.dart';
import 'package:app_localnotification_bakapp/screens/notification_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static Map<String, Widget Function(BuildContext context)> list =
      <String, WidgetBuilder>{
    '/home': (_) => const HomeScreen(),
    'notificacion': (_) => const NotificacionScreen(),
  };

  static String initial = '/home';
  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
}
