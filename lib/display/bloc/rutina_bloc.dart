// lib/bloc/exercise_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:green_fit/data/services/deepseek_service.dart';

part 'rutina_event.dart';
part 'rutina_state.dart';

class RutinaBloc extends Bloc<RutinaEvent, RutinaState> {
  final DeepseekService rutinaService;

  RutinaBloc({required this.rutinaService}) : super(ExerciseInitial()) {
    on<GenerateRoutineEvent>(_onGenerateRoutine);
  }

  Future<void> _onGenerateRoutine(
    GenerateRoutineEvent event,
    Emitter<RutinaState> emit,
  ) async {
    emit(ExerciseLoading());
    try {
      final routine = await rutinaService.generateRoutine(event.mensaje);
      emit(ExerciseLoaded(routine as RutinaState));
    } catch (e) {
      emit(ExerciseError('Error en la generacion de la rutina: $e'));
    }
  }
}
