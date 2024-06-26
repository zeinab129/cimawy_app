import 'package:cimawy/cimawy.dart';
import 'package:cimawy/config.dart';
import 'package:cimawy/core/provider/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  MyProvider myProvider = MyProvider();
  runApp(ChangeNotifierProvider(
      create: (context) => myProvider..getWatchList(), child: const Cimawy()));
}
