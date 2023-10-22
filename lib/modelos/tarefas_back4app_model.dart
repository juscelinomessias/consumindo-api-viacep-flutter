class TarefasBack4AppModel {
  List<TarefaBack4AppModel> tarefas = [];

  TarefasBack4AppModel(this.tarefas);

  TarefasBack4AppModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      tarefas = <TarefaBack4AppModel>[];
      json['results'].forEach((v) {
        tarefas.add(TarefaBack4AppModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = tarefas.map((v) => v.toJson()).toList();
    return data;
  }
}

class TarefaBack4AppModel {
  String objectId = "";
  String cep = "";
  String logradouro = "";
  String bairro = "";
  String localidade = "";
  String ddd = "";
  String uf = "";
  String createdAt = "";
  String updatedAt = "";
  String complemento = "";
  String ibge = "";
  String gia = "";
  String siafi = "";

  TarefaBack4AppModel(
      this.objectId,
      this.cep,
      this.logradouro,
      this.bairro,
      this.localidade,
      this.ddd,
      this.uf,
      this.createdAt,
      this.updatedAt,
      this.complemento,
      this.ibge,
      this.gia,
      this.siafi);

  TarefaBack4AppModel.criar(
      this.cep,
      this.logradouro,
      this.bairro,
      this.localidade,
      this.ddd,
      this.uf,
      this.complemento,
      this.ibge,
      this.gia,
      this.siafi);

  TarefaBack4AppModel.atualizar(
      this.objectId,
      this.cep,
      this.logradouro,
      this.bairro,
      this.localidade,
      this.ddd,
      this.uf,
      this.complemento,
      this.ibge,
      this.gia,
      this.siafi);

  TarefaBack4AppModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    cep = json['cep'];
    logradouro = json['logradouro'];
    bairro = json['bairro'];
    localidade = json['localidade'];
    ddd = json['ddd'];
    uf = json['uf'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    complemento = json['complemento'];
    ibge = json['ibge'];
    gia = json['gia'];
    siafi = json['siafi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['objectId'] = objectId;
    data['cep'] = cep;
    data['logradouro'] = logradouro;
    data['bairro'] = bairro;
    data['localidade'] = localidade;
    data['ddd'] = ddd;
    data['uf'] = uf;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['complemento'] = complemento;
    data['ibge'] = ibge;
    data['gia'] = gia;
    data['siafi'] = siafi;
    return data;
  }

  Map<String, dynamic> toJsonEndpoint() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cep'] = cep;
    data['logradouro'] = logradouro;
    data['bairro'] = bairro;
    data['localidade'] = localidade;
    data['ddd'] = ddd;
    data['uf'] = uf;
    data['complemento'] = complemento;
    data['ibge'] = ibge;
    data['gia'] = gia;
    data['siafi'] = siafi;
    return data;
  }
}
