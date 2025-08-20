import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formulario/presentation/bloc/home_bloc.dart';
import 'package:formulario/presentation/bloc/home_event.dart';
import 'package:formulario/presentation/bloc/home_state.dart';
import 'package:formulario/presentation/cubit/formulario_cubit.dart';

class Inicial extends StatelessWidget {
  const Inicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('División'),
        backgroundColor: const Color.fromARGB(65, 10, 107, 75),
        centerTitle: true,
      ),
      body: Row(
        children: [
          // Champions League (Bloc)
          Expanded(
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return Container(
                  color: const Color.fromARGB(255, 0, 89, 161),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Champions (Bloc)',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        state.mensaje,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          context.read<HomeBloc>().add(CargarHomeEvent());
                        },
                        child: const Text('Actualizar Champions League'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Europa League (Cubit)
          Expanded(
            child: BlocBuilder<FormularioCubit, FormularioState>(
              builder: (context, state) {
                return Container(
                  color: const Color.fromARGB(255, 219, 119, 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Europa (Cubit)',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        state.valor,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          context.read<FormularioCubit>().actualizarTexto();
                        },
                        child: const Text('Actualizar Europa League'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
