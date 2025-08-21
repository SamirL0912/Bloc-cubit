import 'package:equatable/equatable.dart';

import '../models/europa_model.dart';


class FormularioState extends Equatable {
  final List<EuropaModel> europa;
  final bool loading;
  final String? error;

  const FormularioState({
    this.europa = const [],
    this.loading = false,
    this.error,
  });

  @override
  List<Object?> get props => [europa, loading, error];

  FormularioState copyWith({
    List<EuropaModel>? europa,
    bool? loading,
    String? error,
  }) {
    return FormularioState(
      europa: europa ?? this.europa,
      loading: loading ?? this.loading,
      error: error ?? this.error,
    );
  }
}
