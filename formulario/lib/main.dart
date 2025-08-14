import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formulario/presentation/bloc/home_bloc.dart';
import 'package:formulario/presentation/cubit/formulario_cubit.dart';
import 'package:formulario/presentation/views/initial_view.dart';


void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (_) => HomeBloc(),
        ),
        BlocProvider<FormularioCubit>(
          create: (_) => FormularioCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bloc + Cubit',
      home: const Inicial(),
    );
  }
}
