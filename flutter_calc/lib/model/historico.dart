class Historico {
  DateTime dataCalculo;
  String valor1Header;
  String valor1;
  String operacaoHeader;
  String operacao;
  String valor2Header;
  String valor2;
  String resultadoHeader;
  String resultado;

  Historico(
      {this.valor1Header = "Valor 1:",
      this.valor2Header = "Valor 2:",
      this.operacaoHeader = "Operação",
      this.resultadoHeader = "Resultado",
      this.dataCalculo,
      this.valor1,
      this.valor2,
      this.operacao,
      this.resultado});
}
