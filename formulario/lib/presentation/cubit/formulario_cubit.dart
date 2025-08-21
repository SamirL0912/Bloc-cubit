import 'package:bloc/bloc.dart';
import 'package:formulario/presentation/cubit/formulario_state.dart';
import 'package:formulario/presentation/services/europa_services.dart';

import '../models/europa_model.dart';


class FormularioCubit extends Cubit<FormularioState> {
  final EuropaService _service = EuropaService();

  FormularioCubit() : super(FormularioState());

  void actualizarTexto() async {
    emit(state.copyWith(loading: true, error: null));
    try {
      final List<EuropaModel> europa = await _service.getEuropa();
      emit(state.copyWith(europa: europa, loading: false));
    } catch (e) {
      print('Error al cargar datos: $e');
      emit(state.copyWith(loading: false, error: 'Error al cargar Europa League'));
    }
  }
}