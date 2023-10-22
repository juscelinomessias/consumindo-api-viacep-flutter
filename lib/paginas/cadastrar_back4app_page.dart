import 'package:consumindo_api_viacep_flutter/modelos/tarefas_back4app_model.dart';
import 'package:consumindo_api_viacep_flutter/modelos/viacep_model.dart';
import 'package:consumindo_api_viacep_flutter/paginas/consulta_viacep_page.dart';
import 'package:consumindo_api_viacep_flutter/repositorios/back4app/tarefas_back4app_repository.dart';
import 'package:flutter/material.dart';

class Cadastrarback4app extends StatefulWidget {
  final ViaCEPModel dados;
  const Cadastrarback4app({Key? key, required this.dados}) : super(key: key);

  @override
  _Cadastrarback4appState createState() => _Cadastrarback4appState();
}

class _Cadastrarback4appState extends State<Cadastrarback4app> {
  TarefasBack4AppRepository tarefaRepository = TarefasBack4AppRepository();

  bool loading = false;

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

  // void obterTarefas() async {
  //   _tarefasBack4App = await tarefaRepository.obterTarefas();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.red,
        title: const Text("Cadastrar Endereço",
            style: TextStyle(color: Colors.white, fontSize: 18)),
        centerTitle: true,
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
                    "Salvar",
                    style: TextStyle(color: Color(0xFFffffff), fontSize: 17),
                  ),
                ),
              ),
              onTap: () async {
                _validarCampos();
              },
            )),
      ]),
    );
  }

// validar campos obrigatórios
  _validarCampos() {
    BuildContext context = this.context;

    // Recupera dados dos campos
    String nome = _controllerCep.text;

    // Validar os campos
    if (nome.isNotEmpty) {
      setState(() {
        loading = true;
      });
      _salvar();
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        "Obrigatório",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Positioned(
                      top: -90,
                      child: CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 60,
                        child: Icon(
                          Icons.account_circle,
                          color: Colors.white,
                          size: 60,
                        ),
                      ),
                    )
                  ]),
              content: const Text(
                "Digite o Cep do endereço.",
                style: TextStyle(color: Colors.black, fontSize: 17),
                textAlign: TextAlign.center,
              ),
              actions: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            40, 10, 40, 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      child: const Text(
                        "Ok",
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            );
          });
    }
  }

// salvar dados no back4app
  _salvar() async {
    await tarefaRepository.criar(TarefaBack4AppModel.criar(
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
            "Endereço cadastrado com sucesso!",
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
        MaterialPageRoute(builder: (context) => const ConsultaViaCepPage()));
  }
}
