import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:listaatividades/tarefa_model.dart';

class TarefaListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Contatos'),
      ),
      body: FutureBuilder(
        future: Hive.openBox('tarefasnovas'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final tarefasBox = Hive.box('tarefasnovas');
            final tarefas = tarefasBox.values.toList();
            return ListView(
              children: tarefas.map((tarefa) {
                return Column(
                  children: [
                    ListTile(
                      title: const Text('Título', style: TextStyle(color: Colors.pink)),
                      subtitle: Text(tarefa.titulo),
                    ),
                    ListTile(
                      title: const Text('Descrição', style: TextStyle(color: Colors.pink)),
                      subtitle: Text(tarefa.descricao),
                    ),
                    const Divider(color: Colors.black),
                  ],
                );
              }).toList(),
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
