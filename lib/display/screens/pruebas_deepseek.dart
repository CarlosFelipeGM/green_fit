// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_fit/display/bloc/rutina_bloc.dart';

class PruebasDeepseek extends StatelessWidget {
  final TextEditingController _mensajeController = TextEditingController();

  PruebasDeepseek({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Generar Rutina de Ejercicios')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _mensajeController,
              decoration: InputDecoration(
                labelText: 'Objetivo (e.g., perder peso, ganar músculo)',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final goal = _mensajeController.text;
                context.read<RutinaBloc>().add(GenerateRoutineEvent(goal));
              },
              child: Text('Generar Rutina'),
            ),
            SizedBox(height: 20),
            BlocBuilder<RutinaBloc, RutinaState>(
              builder: (context, state) {
                if (state is ExerciseLoading) {
                  return CircularProgressIndicator();
                } else if (state is ExerciseLoaded) {
                  return Expanded(
                    child: ListView(
                      children:
                          state.routine.props.map((exercise) {
                            return ListTile(title: Text(exercise.toString()));
                          }).toList(),
                    ),
                  );
                } else if (state is ExerciseError) {
                  return Text(state.message);
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
