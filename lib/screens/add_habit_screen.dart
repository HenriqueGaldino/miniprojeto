import 'package:flutter/material.dart';
import '../models/habito.dart';

class AddHabitScreen extends StatefulWidget {
  @override
  _AddHabitScreenState createState() => _AddHabitScreenState();
}

class _AddHabitScreenState extends State<AddHabitScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nome = TextEditingController();
  TextEditingController descricao = TextEditingController();

  void salvar() {
    if (_formKey.currentState!.validate()) {
      final novoHabito = Habito(
        nome: nome.text,
        descricao: descricao.text,
      );

      Navigator.pop(context, novoHabito);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Novo Hábito"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nome,
                decoration: InputDecoration(labelText: "Nome do hábito"),
                validator: (value) =>
                    value!.isEmpty ? "Digite um nome" : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: descricao,
                decoration: InputDecoration(labelText: "Descrição"),
                validator: (value) =>
                    value!.isEmpty ? "Digite uma descrição" : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: salvar,
                child: Text("Salvar"),
              )
            ],
          ),
        ),
      ),
    );
  }
}