import 'package:consumindo_api_viacep_flutter/modelos/tarefas_back4app_model.dart';
import 'package:consumindo_api_viacep_flutter/paginas/listar_back4app_page.dart';
import 'package:consumindo_api_viacep_flutter/repositorios/back4app/tarefas_back4app_repository.dart';
import 'package:flutter/material.dart';

class AtualizarBack4AppPage extends StatefulWidget {
  final TarefaBack4AppModel dados;

  const AtualizarBack4AppPage({required this.dados, Key? key})
      : super(key: key);

  @override
  State<AtualizarBack4AppPage> createState() => _AtualizarBack4AppPageState();
}

class _AtualizarBack4AppPageState extends State<AtualizarBack4AppPage> {
  TarefasBack4AppRepository tarefaRepository = TarefasBack4AppRepository();

  bool loading = false;

  final TextEditingController _controllerobjectId = TextEditingController();
  final TextEditingController _controllerCep = TextEditingController();
  final TextEditingController _controllerLogradouro = TextEditingController();
  final TextEditingController _controllerComplemento = TextEditingController();
  final TextEditingController _controllerBairro = TextEditingController();
  final TextEditingController _controllerLocalidade = TextEditingController();
  final TextEditingController _controllerUf = TextEditingController();
  final TextEditingController _controllerIbge = TextEditingController();
  final TextEditingController _controllerGia = TextEditingController();
  final TextEditingController _controllerDdd = TextEditingController();
  final TextEditingController _controllerSiafi = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controllerobjectId.text = widget.dados.objectId ?? "";
    _controllerCep.text = widget.dados.cep ?? "";
    _controllerLogradouro.text = widget.dados.logradouro ?? "";
    _controllerBairro.text = widget.dados.bairro ?? "";
    _controllerLocalidade.text = widget.dados.localidade ?? "";
    _controllerDdd.text = widget.dados.ddd ?? "";
    _controllerUf.text = widget.dados.uf ?? "";
    _controllerComplemento.text = widget.dados.complemento ?? "";
    _controllerIbge.text = widget.dados.ibge ?? "";
    _controllerGia.text = widget.dados.gia ?? "";
    _controllerSiafi.text = widget.dados.siafi ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Atualizar Endereço"),
      ),
      body: Column(children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _controllerobjectId,
                    decoration: InputDecoration(
                      labelText: 'Id',
                      labelStyle: const TextStyle(
                        color: Color(0xffc71e54),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xffc71e54),
                        ),
                        borderRadius: BorderRadius.circular(
                            10.0), // Ajuste o valor conforme necessário
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _controllerCep,
                    decoration: InputDecoration(
                      labelText: 'Cep',
                      labelStyle: const TextStyle(
                        color: Color(0xffc71e54),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xffc71e54),
                        ),
                        borderRadius: BorderRadius.circular(
                            10.0), // Ajuste o valor conforme necessário
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _controllerLogradouro,
                    decoration: InputDecoration(
                      labelText: 'Logradouro',
                      labelStyle: const TextStyle(
                        color: Color(0xffc71e54),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xffc71e54),
                        ),
                        borderRadius: BorderRadius.circular(
                            10.0), // Ajuste o valor conforme necessário
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _controllerComplemento,
                    decoration: InputDecoration(
                      labelText: 'Complemento',
                      labelStyle: const TextStyle(
                        color: Color(0xffc71e54),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xffc71e54),
                        ),
                        borderRadius: BorderRadius.circular(
                            10.0), // Ajuste o valor conforme necessário
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _controllerBairro,
                    decoration: InputDecoration(
                      labelText: 'Bairro',
                      labelStyle: const TextStyle(
                        color: Color(0xffc71e54),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xffc71e54),
                        ),
                        borderRadius: BorderRadius.circular(
                            10.0), // Ajuste o valor conforme necessário
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: _controllerLocalidade,
                    decoration: InputDecoration(
                      labelText: 'Localidade',
                      labelStyle: const TextStyle(
                        color: Color(0xffc71e54),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xffc71e54),
                        ),
                        borderRadius: BorderRadius.circular(
                            10.0), // Ajuste o valor conforme necessário
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _controllerDdd,
                          decoration: InputDecoration(
                            labelText: 'DDD',
                            labelStyle: const TextStyle(
                              color: Color(0xffc71e54),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xffc71e54),
                              ),
                              borderRadius: BorderRadius.circular(
                                  10.0), // Ajuste o valor conforme necessário
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16), // Espaçamento entre os campos
                      Expanded(
                        child: TextFormField(
                          controller: _controllerUf,
                          decoration: InputDecoration(
                            labelText: 'Uf',
                            labelStyle: const TextStyle(
                              color: Color(0xffc71e54),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xffc71e54),
                              ),
                              borderRadius: BorderRadius.circular(
                                  10.0), // Ajuste o valor conforme necessário
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _controllerGia,
                          decoration: InputDecoration(
                            labelText: 'Gia',
                            labelStyle: const TextStyle(
                              color: Color(0xffc71e54),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xffc71e54),
                              ),
                              borderRadius: BorderRadius.circular(
                                  10.0), // Ajuste o valor conforme necessário
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16), // Espaçamento entre os campos
                      Expanded(
                        child: TextFormField(
                          controller: _controllerIbge,
                          decoration: InputDecoration(
                            labelText: 'Ibge',
                            labelStyle: const TextStyle(
                              color: Color(0xffc71e54),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Color(0xffc71e54),
                              ),
                              borderRadius: BorderRadius.circular(
                                  10.0), // Ajuste o valor conforme necessário
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15), // Espaçamento entre os campos
                  TextFormField(
                    controller: _controllerSiafi,
                    decoration: InputDecoration(
                      labelText: 'Siafi',
                      labelStyle: const TextStyle(
                        color: Color(0xffc71e54),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xffc71e54),
                        ),
                        borderRadius: BorderRadius.circular(
                            10.0), // Ajuste o valor conforme necessário
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  if (loading) const CircularProgressIndicator(),
                ],
              ),
            ),
          ),
        ),
        Container(
            height: 65,
            decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(
              width: 1.0,
              color: Colors.red,
            ))),
            child: GestureDetector(
              child: Container(
                height: 65.0,
                width: MediaQuery.of(context).size.width,
                color: Colors.red,
                child: const Center(
                  child: Text(
                    "Atualizar",
                    style: TextStyle(color: Color(0xFFffffff), fontSize: 17),
                  ),
                ),
              ),
              onTap: () async {
                _atualizar();
              },
            )),
      ]),
    );
  }

// salvar dados no back4app

  _atualizar() async {
    await tarefaRepository.atualizar(TarefaBack4AppModel.atualizar(
        _controllerobjectId.text,
        _controllerCep.text,
        _controllerLogradouro.text,
        _controllerBairro.text,
        _controllerLocalidade.text,
        _controllerDdd.text,
        _controllerUf.text,
        _controllerComplemento.text,
        _controllerIbge.text,
        _controllerGia.text,
        _controllerSiafi.text));

    // Remove o SnackBar caso esteja aberto
    ScaffoldMessenger.of(context).clearSnackBars();

    // Exibe uma mensagem quando o Contato é criado
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Padding(
          padding: EdgeInsets.symmetric(vertical: 14),
          child: Text(
            "Endereço atualizado com sucesso!",
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

    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const ListarBack4appPage()));
  }
}
