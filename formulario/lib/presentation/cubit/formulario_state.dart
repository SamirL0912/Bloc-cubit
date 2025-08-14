part of 'formulario_cubit.dart';

class FormularioState extends Equatable {
  final String valor;

  const FormularioState({required this.valor});

  @override
  List<Object> get props => [valor];
}
