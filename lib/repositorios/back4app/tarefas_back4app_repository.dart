import 'package:consumindo_api_viacep_flutter/modelos/tarefas_back4app_model.dart';
import 'package:dio/dio.dart';

class TarefasBack4AppRepository {
  var _dio = Dio();

  TarefasBack4AppRepository() {
    _dio = Dio();
    _dio.options.headers["X-Parse-Application-Id"] =
        "5G3yjMaWMN5YSFm12AOylDOYi4vEXuwnUL7wTEs7";
    _dio.options.headers["X-Parse-REST-API-Key"] =
        "kJ2Ws1BFW6uANvVNIP5Ajc40DidKwkqyrBYbAbCV";
    _dio.options.headers["Content-Type"] = "application/json";
    _dio.options.baseUrl = '';
  }

  Future<TarefasBack4AppModel> obterTarefas() async {
    var url = "https://parseapi.back4app.com/classes/Ceps";
    var result = await _dio.get(url);
    return TarefasBack4AppModel.fromJson(result.data);
  }

  Future<bool> verificarCep({required cep}) async {
    try {
      var response = await _dio.get(
          'https://parseapi.back4app.com/classes/Ceps?where={"cep":"$cep"}');
      final data = response.data['results'] as List<dynamic>;
      return data.isNotEmpty;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> criar(TarefaBack4AppModel tarefaBack4AppModel) async {
    try {
      await _dio.post("https://parseapi.back4app.com/classes/Ceps",
          data: tarefaBack4AppModel.toJsonEndpoint());
    } catch (e) {
      throw (e);
    }
  }

  Future<void> atualizar(TarefaBack4AppModel tarefaBack4AppModel) async {
    try {
      var response = await _dio.put(
          "https://parseapi.back4app.com/classes/Ceps/${tarefaBack4AppModel.objectId}",
          data: tarefaBack4AppModel.toJsonEndpoint());
    } catch (e) {
      throw e;
    }
  }

  Future<void> remover(String objectId) async {
    try {
      var response = await _dio.delete(
        "https://parseapi.back4app.com/classes/Ceps/$objectId",
      );
    } catch (e) {
      throw e;
    }
  }
}
