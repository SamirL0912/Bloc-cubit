import 'package:equatable/equatable.dart';
import 'package:formulario/presentation/models/champions_model.dart';

class HomeState extends Equatable {
  final List<ChampionsModel> champions;
  final bool loading;
  final String? error;

  const HomeState({
    this.champions = const [],
    this.loading = false,
    this.error,
  });

  @override
  List<Object?> get props => [champions, loading, error];

  HomeState copyWith({
    List<ChampionsModel>? champions,
    bool? loading,
    String? error,
  }) {
    return HomeState(
      champions: champions ?? this.champions,
      loading: loading ?? this.loading,
      error: error,
    );
  }
}
