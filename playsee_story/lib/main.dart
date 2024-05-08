import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';

import 'post_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Fimber.plantTree(DebugTree());

  runApp(const PostApp());
}
