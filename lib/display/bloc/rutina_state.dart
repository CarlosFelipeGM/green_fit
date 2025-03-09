part of 'rutina_bloc.dart';

abstract class RutinaState extends Equatable {
  const RutinaState();

  @override
  List<Object> get props => [];
}

class ExerciseInitial extends RutinaState {}

class ExerciseLoading extends RutinaState {}

class ExerciseLoaded extends RutinaState {
  final RutinaState routine;

  const ExerciseLoaded(this.routine);

  @override
  List<Object> get props => [routine];
}

class ExerciseError extends RutinaState {
  final String message;

  const ExerciseError(this.message);

  @override
  List<Object> get props => [message];
}
