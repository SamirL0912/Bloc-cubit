import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formulario/presentation/bloc/home_bloc.dart';
import 'package:formulario/presentation/bloc/home_event.dart';
import 'package:formulario/presentation/bloc/home_state.dart';
import 'package:formulario/presentation/cubit/formulario_cubit.dart';
import 'package:formulario/presentation/cubit/formulario_state.dart';

class Inicial extends StatelessWidget {
  const Inicial({super.key});

  @override
  Widget build(BuildContext context) {
    // Cargar los datos automáticamente al construir la vista
    context.read<HomeBloc>().add(CargarHomeEvent());
    context.read<FormularioCubit>().actualizarTexto();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Campeones de los 2000 en adelante'),
        backgroundColor: const Color.fromARGB(65, 10, 107, 75),
        centerTitle: true,
      ),
      body: Row(
        children: [
          // Champions League (Bloc)
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 0, 89, 161),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Champions (Bloc)',
                    style: TextStyle(fontSize: 18, color: Colors.white),  
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: BlocBuilder<HomeBloc, HomeState>(
                      builder: (context, state) {
                        if (state.loading) {
                          return const Center(
                              child: CircularProgressIndicator(
                            color: Colors.white,
                          ));
                        }
                        if (state.error != null) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  state.error!,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<HomeBloc>()
                                        .add(CargarHomeEvent());
                                  },
                                  child: const Text('Reintentar'),
                                ),
                              ],
                            ),
                          );
                        }
                        return ListView.builder(
                          itemCount: state.champions.length,
                          itemBuilder: (context, index) {
                            final champ = state.champions[index];
                            return ListTile(
                              title: Text(
                                champ.team,
                                style: const TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                champ.year.toString(),
                                style: const TextStyle(color: Colors.white70),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),

          // Europa League (Cubit)
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 219, 119, 5),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  const Text(
                    'Europa (Cubit)',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: BlocBuilder<FormularioCubit, FormularioState>(
                      builder: (context, state) {
                        if (state.loading) {
                          return const Center(
                              child: CircularProgressIndicator(
                            color: Colors.white,
                          ));
                        }
                        if (state.error != null) {
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  state.error!,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                const SizedBox(height: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<FormularioCubit>()
                                        .actualizarTexto();
                                  },
                                  child: const Text('Reintentar'),
                                ),
                              ],
                            ),
                          );
                        }
                        return ListView.builder(
                          itemCount: state.europa.length,
                          itemBuilder: (context, index) {
                            final eq = state.europa[index];
                            return ListTile(
                              title: Text(
                                eq.team,
                                style: const TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                eq.year.toString(),
                                style: const TextStyle(color: Colors.white70),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
