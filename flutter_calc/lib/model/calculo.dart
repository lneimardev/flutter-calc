class Calculo {
  int statusCode;
  String mensagem;
  List<String> mensagens;
  int resultado;

  Calculo.fromJson(Map json) {
    this.statusCode = json['statusCode'];
    this.mensagem = json['mensagem'];
    // TODO: tratar quando vier erros de validações
    //this.mensagens =
    
    // TODO: o resultado tem que ser double
    this.resultado = json['data']['resultado'];
  }
}

/*
response da API
{
  "statusCode": 200,
  "mensagem": "Operacao relizda com sucesso",
  "mensagens": [],
  "data": {
    "resultado": 2
  }
}
*/