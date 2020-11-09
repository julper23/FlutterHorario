import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'pages/horario_page.dart';
import 'package:Horario/providers/data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MaterialApp app = MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Horario',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HorarioPage(title: 'Horario'),
    );

    // Lo recubrimos con un Proveedor de Notificaciones
    return ChangeNotifierProvider<CalendarData>(
      create: (context) => CalendarData(),
      child: app,
    );
  }
}
