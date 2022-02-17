import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_motionhack/model/budis.dart';
import 'package:flutter_application_motionhack/services/coba.dart';

part 'coba_state.dart';

class CobaCubit extends Cubit<CobaState> {
  CobaCubit() : super(CobaInitial());
  void fetchCoba() async {
    try {
      emit(CobaLoading());
      Future.delayed(Duration(seconds: 10));
      List<CobaModel> coba = await CobaServices().fetchCoba();

      emit(CobaSuccess(coba));
    } catch (e) {
      emit(CobaFailed(e.toString()));
    }
  }
}
