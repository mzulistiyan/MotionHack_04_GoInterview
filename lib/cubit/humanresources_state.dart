part of 'humanresources_cubit.dart';

abstract class HumanresourcesState extends Equatable {
  const HumanresourcesState();

  @override
  List<Object> get props => [];
}

class HumanresourcesInitial extends HumanresourcesState {}

class HumanresourcesLoading extends HumanresourcesState {}

class HumanresourcesSuccess extends HumanresourcesState {
  final List<UserHrModel> humanresources;

  HumanresourcesSuccess(this.humanresources);

  @override
  List<Object> get props => [humanresources];
}

class HumanresourcesFailed extends HumanresourcesState {
  final String error;

  HumanresourcesFailed(this.error);

  @override
  List<Object> get props => [error];
}
