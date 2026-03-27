import 'package:flutter/material.dart';
import '../models/habito.dart';
import '../widgets/habit_tile.dart';
import 'habit_details_screen.dart';
import 'add_habit_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Habito> habitos = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    carregarHabitos();
  }

  Future<void> carregarHabitos() async {
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      habitos = [
        Habito(nome: "Beber água", descricao: "2L por dia"),
        Habito(nome: "Estudar", descricao: "Flutter 1h"),
        Habito(nome: "Treinar", descricao: "Academia"),
      ];
      loading = false;
    });
  }

  void toggle(int index) {
    setState(() {
      habitos[index].concluido = !habitos[index].concluido;
    });
  }

  void deletar(int index) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Excluir hábito"),
        content: Text("Tem certeza que deseja excluir?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancelar"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                habitos.removeAt(index);
              });
              Navigator.pop(context);
            },
            child: Text("Excluir"),
          ),
        ],
      ),
    );
  }

  int get concluidos => habitos.where((h) => h.concluido).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Controle de Hábitos"),
        actions: [
          Padding(
            padding: EdgeInsets.all(12),
            child: Center(
              child: Text("✔ $concluidos/${habitos.length}"),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final novoHabito = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AddHabitScreen()),
          );

          if (novoHabito != null) {
            setState(() {
              habitos.add(novoHabito);
            });
          }
        },
        child: Icon(Icons.add),
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: habitos.length,
              itemBuilder: (context, index) {
                return HabitTile(
                  habito: habitos[index],
                  onToggle: () => toggle(index),
                  onDelete: () => deletar(index),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => HabitDetailsScreen(
                          habito: habitos[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}