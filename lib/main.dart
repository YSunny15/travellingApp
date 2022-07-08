import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:food_delivery/cubit/app_cubit_logic.dart';
// import 'package:food_delivery/cubit/app_cubits.dart';
// import 'package:food_delivery/pages/mainpage.dart';
import 'package:food_delivery/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Traveling App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // primarySwatch: Color.fromARGB(255, 186, 29, 214),
          primaryColor: Colors.purpleAccent[700]),
      home: const WelcomePage()
      // BlocProvider<AppCubits>(
      //   create: (context) => AppCubits(),
      //   child: AppCubitLogic(),
      //   ),
    );
  }
}
