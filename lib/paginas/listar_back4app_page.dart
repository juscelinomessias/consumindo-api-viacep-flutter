import 'package:consumindo_api_viacep_flutter/modelos/tarefas_back4app_model.dart';
import 'package:consumindo_api_viacep_flutter/paginas/atualizar_back4app_page.dart';
import 'package:consumindo_api_viacep_flutter/repositorios/back4app/tarefas_back4app_repository.dart';
import 'package:flutter/material.dart';

class ListarBack4appPage extends StatefulWidget {
  const ListarBack4appPage({Key? key}) : super(key: key);

  @override
  State<ListarBack4appPage> createState() => _ListarBack4appPageState();
}

class _ListarBack4appPageState extends State<ListarBack4appPage> {
  TarefasBack4AppRepository tarefaRepository = TarefasBack4AppRepository();
  var _tarefasBack4App = TarefasBack4AppModel([]);
  var descricaoContoller = TextEditingController();
  var apenasNaoConcluidos = false;
  var carregando = false;

  @override
  void initState() {
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    setState(() {
      carregando = true;
    });
    _tarefasBack4App = await tarefaRepository.obterTarefas();
    setState(() {
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Endereços Cadastrados"),
      ),
      body: Center(
        child: carregando
            ? CircularProgressIndicator()
            : Expanded(
                child: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  child: ListView.separated(
                      itemCount: _tarefasBack4App.tarefas.length,
                      separatorBuilder: (BuildContext context, int index) =>
                          Container(
                            height: 2.0,
                            color: Colors.red,
                          ),
                      itemBuilder: (BuildContext bc, int index) {
                        var tarefa = _tarefasBack4App.tarefas[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => AtualizarBack4AppPage(
                                    dados:
                                        tarefa), // Passe os dados do item como um parâmetro
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Dismissible(
                              onDismissed:
                                  (DismissDirection dismissDirection) async {
                                await tarefaRepository.remover(tarefa.objectId);
                                obterTarefas();
                                _menssagem();
                              },
                              key: Key(tarefa.cep),
                              child: ListTile(
                                title: Text(tarefa.cep),
                                subtitle: Text(
                                    '${tarefa.logradouro}, ${tarefa.localidade}\n${tarefa.uf}'),
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
      ),
    );
  }

  _menssagem() async {
    // Remove o SnackBar caso esteja aberto
    ScaffoldMessenger.of(context).clearSnackBars();

    // Exibe uma mensagem quando o Contato é criado
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text(
            "Endereço removido com sucesso!",
            style: TextStyle(
              color: Color(0xFFffffff),
              fontSize: 17,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ),
    );
  }
}
