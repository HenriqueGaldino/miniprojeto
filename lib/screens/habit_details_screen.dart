import 'package:flutter/material.dart';
import '../models/habito.dart';

class HabitDetailsScreen extends StatelessWidget {
  final Habito habito;

  HabitDetailsScreen({required this.habito});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detalhes")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 5,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Icon(Icons.track_changes, size: 80, color: Colors.purple),
                SizedBox(height: 20),
                Text(
                  habito.nome,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(habito.descricao),
                SizedBox(height: 20),
                Chip(
                  label: Text(
                    habito.concluido ? "Concluído" : "Pendente",
                  ),
                  backgroundColor:
                      habito.concluido ? Colors.green : Colors.red,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}