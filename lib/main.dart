import 'package:consumindo_api_viacep_flutter/paginas/my_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp, // Impede a rotação para paisagem
    DeviceOrientation.portraitDown, // Impede a rotação para paisagem invertida
  ]).then((_) {
    runApp(const MyApp());
  });
}
