import 'package:hive/hive.dart';
import 'package:listaatividades/tarefa_model.dart';

class HiveStore {
  static const String _tarefasBoxName = 'tarefasnovas';

  static Future<List<Tarefa>> carregarTarefas() async {
    final box = Hive.box<Tarefa>(_tarefasBoxName);
    return box.values.toList();
  }

  static Future<void> salvarTarefas(List<Tarefa> tarefas) async {
    final box = Hive.box<Tarefa>(_tarefasBoxName);
    await box.clear();
    await box.addAll(tarefas);
  }
}

