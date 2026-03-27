class Habito {
  String nome;
  String descricao;
  bool concluido;

  Habito({
    required this.nome,
    required this.descricao,
    this.concluido = false,
  });
}