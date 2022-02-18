import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_application_motionhack/model/budis.dart';
import 'package:flutter_application_motionhack/model/transaction_model.dart';
import 'package:flutter_application_motionhack/model/user_hr_model.dart';
import 'package:flutter_application_motionhack/services/coba.dart';
import 'package:flutter_application_motionhack/services/transaction_service.dart';
import 'package:flutter_application_motionhack/services/user_hr_service.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  void createTransaction(TransactionModel transaction) async {
    try {
      emit(TransactionLoading());
      await TransactionService().createTransaction(transaction);
      emit(TransactionSuccess([]));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }

  void updateUserAccept(String docid) async {
    try {
      emit(TransactionLoading());
      await TransactionService().updateUserAccept(docid);
      emit(TransactionSuccess([]));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }

  void updateUserDeny(String docid) async {
    try {
      emit(TransactionLoading());
      await TransactionService().updateUserDeny(docid);
      emit(TransactionSuccess([]));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }

  void fetchTransaction(String id) async {
    try {
      emit(TransactionLoading());

      List<TransactionModel> transactions =
          await TransactionService().fetchTransaction(id);

      emit(TransactionSuccess(transactions));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }

  void fetchTransactionUser(String idTransactionUser) async {
    try {
      emit(TransactionLoading());
      emit(TransactionLoading());
      List<TransactionModel> transactions =
          await TransactionService().fetchTransactionUser(idTransactionUser);

      emit(TransactionSuccess(transactions));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }

  void getCurrentUserHr(String id) async {
    try {
      TransactionModel transactions =
          await TransactionService().getUserHrById(id);
      emit(TransactionSuccess(transactions as List<TransactionModel>));
    } catch (e) {
      emit(TransactionFailed(e.toString()));
    }
  }
}
