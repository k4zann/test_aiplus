import 'package:flutter/material.dart';
import 'package:test_aiplus/core/services/injection/injection_container.dart';
import 'package:test_aiplus/features/app/ui/app.dart';

void initApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initDI();

  runApp(const TodoApp());
}
