import 'package:flutter/material.dart';
import 'package:green_fit/data/services/openai_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();
  final OpenAIService _openAIService = OpenAIService();
  String _response = "";

  void _sendMessage() async {
    String? result = await _openAIService.getChatResponse(_controller.text);
    setState(() {
      _response = result ?? "Error conectando con OpenIA";
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
            ElevatedButton(onPressed: _sendMessage, child: Text("ENVIAR")),
            SizedBox(height: 20),
            Text("Respuesta: $_response"),
          ],
        ),
      ),
    );
  }
}
