import 'package:flutter/material.dart';
import 'package:nextger/providers/book_provider.dart';
import 'package:provider/provider.dart';

import 'screens/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context)=> BookProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        home: homeScreen(),
      ),
    );
  }
}
