part of 'formulario_cubit.dart';

@immutable
class FormularioState extends Equatable {
  final String valor;

  const FormularioState({required this.valor});

  @override
  List<Object?> get props => [valor];
}
