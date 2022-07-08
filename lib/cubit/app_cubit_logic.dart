// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:food_delivery/cubit/app_cubit_state.dart';
// import 'package:food_delivery/cubit/app_cubits.dart';
// import 'package:food_delivery/pages/welcome_page.dart';

// class AppCubitLogic extends StatefulWidget {
//   const AppCubitLogic({super.key});

//   @override
//   State<AppCubitLogic> createState() => _AppCubitLogicState();
// }

// class _AppCubitLogicState extends State<AppCubitLogic> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: BlocBuilder<AppCubits, CubitStates>(
//         builder: (context, state) {
//           if (state is WelcomeState) {
//             return WelcomePage();
//           } else {
//             return Container();
//           }
//         },
//       ),
//     );
//   }
// }
