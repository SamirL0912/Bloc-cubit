import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formulario/presentation/bloc/home_event.dart';
import 'package:formulario/presentation/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState(mensaje: 'Sin datos')) {
    on<CargarHomeEvent>((event, emit) {
      emit(HomeState(mensaje: 'Actualizado desde HomeBloc: ${DateTime.now()}'));
    });
  }
}
