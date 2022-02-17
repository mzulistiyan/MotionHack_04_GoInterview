part of 'coba_cubit.dart';

abstract class CobaState extends Equatable {
  const CobaState();

  @override
  List<Object> get props => [];
}

class CobaInitial extends CobaState {}

class CobaLoading extends CobaState {}

class CobaSuccess extends CobaState {
  final List<CobaModel> coba;

  CobaSuccess(this.coba);
  @override
  // TODO: implement props
  List<Object> get props => [coba];
}

class CobaFailed extends CobaState {
  final String error;

  CobaFailed(this.error);

  @override
  // TODO: implement props
  List<Object> get props => [error];
}
