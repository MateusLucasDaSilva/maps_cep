import 'package:flutter/material.dart';
import 'package:maps_cep/app.dart';
import 'package:maps_cep/di/injectable.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  runApp(const App());
}
