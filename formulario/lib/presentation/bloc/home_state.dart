import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final String mensaje;

  const HomeState({required this.mensaje});

  @override
  List<Object> get props => [mensaje];
}
