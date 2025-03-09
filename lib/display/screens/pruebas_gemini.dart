import 'package:flutter/material.dart';
import 'package:green_fit/data/services/gemini_service.dart';

class PruebasGemini extends StatefulWidget {
  const PruebasGemini({super.key});

  @override
  State<PruebasGemini> createState() => _PruebasGeminiState();
}

class _PruebasGeminiState extends State<PruebasGemini> {
  final TextEditingController _controller = TextEditingController();
  final GeminiService _geminiService = GeminiService();
  String _response = "";

  void _sendMessage() async {
    String? result = await _geminiService.getChatResponse(_controller.text);
    setState(() {
      _response = result ?? "Error conectando con Gemini IA";
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(labelText: "Escriba su pregunta"),
              ),
              SizedBox(height: 10),
              ElevatedButton(onPressed: _sendMessage, child: Text("ENVIAR")),
              SizedBox(height: 20),
              Text("Respuesta: $_response"),
            ],
          ),
        ),
      ),
    );
  }
}
