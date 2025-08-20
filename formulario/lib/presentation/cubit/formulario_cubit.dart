import 'package:bloc/bloc.dart';
import 'package:formulario/presentation/cubit/formulario_state.dart';
import 'package:formulario/presentation/models/europa_model.dart';
import 'package:formulario/presentation/services/europa_services.dart';

class FormularioCubit extends Cubit<FormularioState> {
  final EuropaService _service = EuropaService();

  FormularioCubit() : super(const FormularioState());

  void actualizarTexto() async {
    emit(state.copyWith(loading: true, error: null));
    try {
      final List<EuropaModel> europa = await _service.getEuropa();
      emit(state.copyWith(europa: europa, loading: false));
    } catch (e) {
      emit(state.copyWith(
          loading: false, error: 'Error al cargar Europa League'));
    }
  }
}
