import 'package:flutter/material.dart';
import 'package:green_fit/data/services/openai_service.dart';

class PruebasOpenAI extends StatefulWidget {
  const PruebasOpenAI({super.key});

  @override
  State<PruebasOpenAI> createState() => _PruebasOpenAIState();
}

class _PruebasOpenAIState extends State<PruebasOpenAI> {
  final TextEditingController _controller = TextEditingController();
  final OpenAIService _openAIService = OpenAIService();
  String _response = "";

  void _fetchConsulta() async {
    final txtConsulta = _controller.text;
    final response = await _openAIService.request(txtConsulta);
    // print("Respuesta:");
    // print(response);
    setState(() {
      _response = response ?? "Error conectando con OpenIAAA";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Pregunte a su entrenador personal"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: "Escriba su pregunta"),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: _fetchConsulta, child: Text("ENVIAR")),
            SizedBox(height: 20),
            Text("Respuesta: $_response"),
          ],
        ),
      ),
    );
  }
}
