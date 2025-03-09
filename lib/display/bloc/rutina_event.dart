part of 'rutina_bloc.dart';

abstract class RutinaEvent extends Equatable {
  const RutinaEvent();

  @override
  List<Object> get props => [];
}

class GenerateRoutineEvent extends RutinaEvent {
  final String mensaje;

  const GenerateRoutineEvent(this.mensaje);

  @override
  List<Object> get props => [mensaje];
}
