import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'formulario_state.dart';

class FormularioCubit extends Cubit<FormularioState> {
  FormularioCubit() : super(FormularioInitial());
}
