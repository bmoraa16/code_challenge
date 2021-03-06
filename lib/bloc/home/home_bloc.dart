import 'package:bloc/bloc.dart';
import 'package:code_challenge/api/api_repository.dart';

import '../../models/historical_data_model.dart';
import '../../src/utils/shared_prefences.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    final ApiRepository apiHomeRepository = ApiRepository();

    on<HomeVacantsList>((event, emit) async {
      try {
        emit(HomeLoading());
        var idEntity =
            await MyAppPreferences.getEntityName().then((entityName) {
          return entityName;
        });
        final mlist = await apiHomeRepository.homePageData(idEntity);
        emit(HomeLoaded(mlist));
        if (mlist.chart!.error != null) {
          emit(HomeError(mlist.chart!.error.toString()));
        }
      } on NetworkError {
        emit(const HomeError("Error BLOC"));
      }
    });
  }
}
