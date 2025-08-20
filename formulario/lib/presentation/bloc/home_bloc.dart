import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formulario/presentation/models/champions_model.dart';
import 'package:formulario/presentation/services/champions_services.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final ChampionsService _service = ChampionsService();

  HomeBloc() : super(const HomeState()) {
    on<CargarHomeEvent>((event, emit) async {
      emit(state.copyWith(loading: true, error: null));
      try {
        final List<ChampionsModel> champions = await _service.getChampions();
        emit(state.copyWith(champions: champions, loading: false));
      } catch (e) {
        emit(
            state.copyWith(loading: false, error: 'Error al cargar Champions'));
      }
    });
  }
}
