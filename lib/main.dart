import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:listaatividades/tarefa_list_screen.dart';
import 'package:listaatividades/tarefa_model.adapter.dart';
import 'package:listaatividades/tarefa_model.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(TarefaAdapter());
  await Hive.openBox('tarefasnovas');
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddContactScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AddContactScreen extends StatelessWidget {
  final TextEditingController tituloController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Tarefa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 16.0),
            TextFormField(
              keyboardType: TextInputType.name,
              controller: tituloController,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                labelText: 'Título',
                labelStyle: const TextStyle(color: Colors.pink),
                hintText: 'Informe o título da tarefa',
                hintStyle: const TextStyle(
                  color: Colors.black54,
                  fontSize: 12.0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              keyboardType: TextInputType.text,
              controller: descricaoController,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                labelText: 'Descrição',
                labelStyle: const TextStyle(color: Colors.pink),
                hintText: 'Informe a descrição da tarefa',
                hintStyle: const TextStyle(
                  color: Colors.black54,
                  fontSize: 12.0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.pink),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Center(
                child: Container(
              height: 45,
              width: 250,
              margin: const EdgeInsets.only(top: 30.0),
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextButton(
                onPressed: () {
                  final tarefa = Tarefa(
                    titulo: tituloController.text,
                    descricao: descricaoController.text,
                    concluida: true,
                  );
                  final contactsBox = Hive.box('tarefasnovas');
                  try {
                    contactsBox.add(tarefa);
                    showToast(context, 'Tarefa salva com sucesso!');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => TarefaListScreen()));
                  } catch (e) {
                    showToast(context,
                        'Ocorreu um erro ao incluir a nova tarefa: $e');
                  }
                  //Navigator.pop(context);
                },
                child: Text(
                  "Adicionar tarefas".toUpperCase(),
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}

void showToast(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14,
          fontFamily: 'Roboto',
        ),
      ),
      backgroundColor: Colors.blue
          .withOpacity(0.7), // Define a cor de fundo com 50% de transparência
    ),
  );
}
