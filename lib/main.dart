import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/blocs/blocs.dart';
import '/models/models.dart';
import '/screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BloC Pattern - Todos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF000A1F),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF000A1F),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
