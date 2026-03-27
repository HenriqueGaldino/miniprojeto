import 'package:flutter/material.dart';
import '../models/habito.dart';

class HabitTile extends StatelessWidget {
  final Habito habito;
  final Function() onToggle;
  final Function() onTap;
  final Function() onDelete;

  HabitTile({
    required this.habito,
    required this.onToggle,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Checkbox(
          value: habito.concluido,
          onChanged: (_) => onToggle(),
        ),
        title: Text(
          habito.nome,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration:
                habito.concluido ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(habito.descricao),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              habito.concluido ? Icons.check_circle : Icons.pending,
              color: habito.concluido ? Colors.green : Colors.orange,
            ),
            SizedBox(width: 10),
            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}