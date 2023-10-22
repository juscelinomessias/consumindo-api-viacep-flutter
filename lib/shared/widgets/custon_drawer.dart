import 'package:consumindo_api_viacep_flutter/paginas/listar_back4app_page.dart';
import 'package:flutter/material.dart';

class CustonDrawer extends StatefulWidget {
  const CustonDrawer({Key? key}) : super(key: key);

  @override
  State<CustonDrawer> createState() => _CustonDrawerState();
}

class _CustonDrawerState extends State<CustonDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.red),
              currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset('lib/imagens/endereco.png')),
              accountName: const Text("Juscelino Messias"),
              accountEmail: const Text("linooow@gmail.com")),
          InkWell(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              width: double.infinity,
              child: const Row(
                children: [
                  Icon(Icons.format_list_bulleted),
                  SizedBox(
                    width: 5,
                  ),
                  Text("Endereços",
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff5a3353),
                          fontWeight: FontWeight.w700)),
                ],
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ListarBack4appPage(),
                ),
              );
            },
          ),
          const Divider()
        ],
      ),
    );
  }
}
