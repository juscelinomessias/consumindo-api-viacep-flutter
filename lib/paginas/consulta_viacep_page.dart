import 'package:consumindo_api_viacep_flutter/modelos/viacep_model.dart';
import 'package:consumindo_api_viacep_flutter/paginas/cadastrar_back4app_page.dart';
import 'package:consumindo_api_viacep_flutter/repositorios/back4app/tarefas_back4app_repository.dart';
import 'package:consumindo_api_viacep_flutter/repositorios/viacep/via_cep_repository.dart';
import 'package:consumindo_api_viacep_flutter/shared/widgets/custon_drawer.dart';
import 'package:flutter/material.dart';

class ConsultaViaCepPage extends StatefulWidget {
  const ConsultaViaCepPage({Key? key}) : super(key: key);

  @override
  State<ConsultaViaCepPage> createState() => _ConsultaViaCepPageState();
}

class _ConsultaViaCepPageState extends State<ConsultaViaCepPage> {
  TarefasBack4AppRepository tarefaRepository = TarefasBack4AppRepository();
  var cepController = TextEditingController(text: "");

  bool loading = false;
  var viacepModel = ViaCEPModel();
  var viaCEPRepository = ViaCepRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFffffff),
      appBar: AppBar(title: const Text("Consulta de CEP")),
      drawer: const CustonDrawer(),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Expanded(
                        flex: 5,
                        child: Image.asset(
                          'lib/imagens/endereco.png',
                          height: 250,
                        ),
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Consulta de CEP",
                      style: TextStyle(
                          fontSize: 26,
                          color: Color(0xffc71e54),
                          fontWeight: FontWeight.w700)),
                  const Text("Digite o número",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff68c044),
                          fontWeight: FontWeight.w700)),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: TextField(
                      controller: cepController,
                      keyboardType: TextInputType.number,
                      onChanged: (String value) async {
                        var cep = value.replaceAll(RegExp(r'[^0-9]'), '');
                        if (cep.length == 8) {
                          FocusScope.of(context).unfocus();
                          setState(() {
                            loading = true;
                            cepController = TextEditingController(text: "");
                          });
                          viacepModel =
                              await viaCEPRepository.consultarCEP(cep);
                        }
                        setState(() {
                          loading = false;
                        });
                      },
                      style: const TextStyle(color: Color(0xffc71e54)),
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.fromLTRB(20, 16, 26, 16),
                        hintText: "CEP",
                        hintStyle: const TextStyle(color: Color(0xffc71e54)),
                        filled: true,
                        fillColor: const Color(0xFFffffff),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        prefixIcon: const Icon(
                          Icons.location_on,
                          color: Color(0xffc71e54),
                          size: 27,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  if (loading) const CircularProgressIndicator(),
                  Column(
                    children: [
                      Container(
                          child: Column(
                        children: [
                          if ((viacepModel.cep != null ||
                              viacepModel.logradouro != null ||
                              viacepModel.bairro != null ||
                              viacepModel.localidade != null ||
                              viacepModel.uf != null)) ...[
                            Text(viacepModel.cep ?? "",
                                style: const TextStyle(
                                    fontSize: 22,
                                    color: Color(0xffc71e54),
                                    fontWeight: FontWeight.w700)),
                            Text(viacepModel.logradouro ?? "",
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Color(0xffc71e54),
                                    fontWeight: FontWeight.w700)),
                            Text(viacepModel.bairro ?? "",
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Color(0xffc71e54),
                                    fontWeight: FontWeight.w700)),
                            Text(
                                "${viacepModel.localidade ?? ""} - ${viacepModel.uf ?? ""}",
                                style: const TextStyle(
                                    fontSize: 16,
                                    color: Color(0xffc71e54),
                                    fontWeight: FontWeight.w700)),
                          ],
                          if ((viacepModel.cep == null &&
                              viacepModel.logradouro == null &&
                              viacepModel.bairro == null &&
                              viacepModel.localidade == null &&
                              viacepModel.uf == null))
                            const Text(
                              "Endereço não localizado.",
                              style: TextStyle(
                                fontSize: 16,
                                color: Color(0xffc71e54),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                        ],
                      ))
                    ],
                  ),
                ],
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
                      "Cadastrar Endereço",
                      style: TextStyle(color: Color(0xFFffffff), fontSize: 17),
                    ),
                  ),
                ),
                onTap: () {
                  _verificar();
                },
              )),
        ],
      ),
    );
  }

// salvar dados no back4app
  _verificar() async {
    if (!await tarefaRepository.verificarCep(cep: viacepModel.cep)) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Cadastrarback4app(dados: viacepModel),
        ),
      );
    } else {
      // Remove o SnackBar caso esteja aberto
      ScaffoldMessenger.of(context).clearSnackBars();

      // Exibe uma mensagem quando o Contato é criado
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Padding(
            padding: EdgeInsets.symmetric(vertical: 14),
            child: Text(
              "Endereço já está cadastrado!",
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
}
