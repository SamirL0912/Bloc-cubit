import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'formulario_state.dart';

class FormularioCubit extends Cubit<FormularioState> {
  FormularioCubit() : super(const FormularioState(valor: 'Sin datos'));

  void actualizarTexto() {
    emit(FormularioState(valor: 'Actualizado desde Cubit: ${DateTime.now()}'));
  }
}
