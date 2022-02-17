import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_motionhack/model/user_hr_model.dart';
import 'package:flutter_application_motionhack/model/user_model.dart';
import 'package:flutter_application_motionhack/services/user_hr_service.dart';
import 'package:flutter_application_motionhack/services/user_service.dart';

part 'humanresources_state.dart';

class HumanresourcesCubit extends Cubit<HumanresourcesState> {
  HumanresourcesCubit() : super(HumanresourcesInitial());

  void fetchHumanResources() async {
    try {
      emit(HumanresourcesLoading());

      List<UserHrModel> humanresources =
          await UserHrService().fetchHumanResources();

      emit(HumanresourcesSuccess(humanresources));
    } catch (e) {
      emit(HumanresourcesFailed(e.toString()));
    }
  }
}
