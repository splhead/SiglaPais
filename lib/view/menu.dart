import 'package:flutter/material.dart';
import 'package:sigla_pais_app/view/paises_screen.dart';

import 'ajuda.dart';
import 'mensagem.dart';

class Menu extends StatelessWidget with Mensagem {
  // const Menu({Key? key}) : super(key: key);

  final TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Drawer(
          child: ListView(
            children: [
              Container(
                alignment: Alignment.center,
                color: Colors.blue,
                height: 100,
                child: Text(
                  "Menu",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
              ),
              ListTile(
                leading: Icon(Icons.search),
                title: Text("Pesquisar"),
                onTap: () {
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => SimpleDialog(
                            title: Text('Digite o nome do país'),
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: TextField(
                                  controller: search,
                                ),
                              ),
                              Row(
                                children: [
                                  TextButton(
                                      child: Text('Cancelar'),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        showMensagem("Pesquisa cancelada!");
                                      }),
                                  TextButton(
                                      child: Text(
                                        'Ok',
                                        style:
                                            TextStyle(color: Colors.blueAccent),
                                      ),
                                      onPressed: () {
                                        Navigator.pop(context);
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        PaisesScreen(pais: search.text)));
                                        showMensagem("O país pesquisado foi ${search.text}");
                                      }),
                                ],
                              )
                            ],
                          ));
                },
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text("Ajuda"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (buildContext) => Ajuda()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
