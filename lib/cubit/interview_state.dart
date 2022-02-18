part of 'interview_cubit.dart';

abstract class InterviewState extends Equatable {
  const InterviewState();

  @override
  List<Object> get props => [];
}

class InterviewInitial extends InterviewState {}

class InterviewLoading extends InterviewState {}

class InterviewSuccess extends InterviewState {
  final List<InterviewModel> interview;

  InterviewSuccess(this.interview);
  @override
  // TODO: implement props
  List<Object> get props => [interview];
}

class InterviewFailed extends InterviewState {
  final String error;

  InterviewFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
