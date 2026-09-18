import 'package:flutter/material.dart';
import 'package:sebaka/core/di/injector.dart';
import 'package:sebaka/core/services/token_storage.dart';
import 'package:sebaka/sebaka_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupInjector();
  runApp(const SebakaApp());
}
