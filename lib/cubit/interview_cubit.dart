import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_motionhack/model/interview_model.dart';
import 'package:flutter_application_motionhack/services/interview_service.dart';

part 'interview_state.dart';

class InterviewCubit extends Cubit<InterviewState> {
  InterviewCubit() : super(InterviewInitial());

  void createInterview(
    InterviewModel interview,
    String idITransaction,
    String date,
    String time,
  ) async {
    try {
      emit(InterviewLoading());
      await InterviewService().createInterview(
        interview,
        idITransaction,
        date,
        time,
      );
      emit(InterviewSuccess([]));
    } catch (e) {
      emit(InterviewFailed(e.toString()));
    }
  }

  void updateUserDeny(String docid) async {
    try {
      emit(InterviewLoading());
      await InterviewService().updateFeedback(docid);
      emit(InterviewSuccess([]));
    } catch (e) {
      emit(InterviewFailed(e.toString()));
    }
  }

  void fetchTransaction(String id) async {
    try {
      emit(InterviewLoading());

      List<InterviewModel> transactions =
          await InterviewService().fetchInterview(id);

      emit(InterviewSuccess(transactions));
    } catch (e) {
      emit(InterviewFailed(e.toString()));
    }
  }

  void fetchTransactionForHr(String id) async {
    try {
      emit(InterviewLoading());

      List<InterviewModel> transactions =
          await InterviewService().fetchInterviewForHr(id);

      emit(InterviewSuccess(transactions));
    } catch (e) {
      emit(InterviewFailed(e.toString()));
    }
  }
}
