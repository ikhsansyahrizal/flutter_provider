import 'package:flutter/material.dart';
import 'package:modul_app/provider/done_module_provider.dart';
import 'package:provider/provider.dart';

import 'module_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DoneModuleProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),      home: const ModulePage(),
      ),
    );
  }
}

