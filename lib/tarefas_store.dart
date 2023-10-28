import 'package:listaatividades/tarefa_model.dart';
import 'package:mobx/mobx.dart';

import 'hive_store.dart';

part 'tarefas_store.g.dart'; // Adicione essa linha para gerar o arquivo .g.dart

class TarefasStore = _TarefasStore with _$TarefasStore;

abstract class _TarefasStore with Store {
  @observable
  ObservableList<Tarefa> tarefas = ObservableList<Tarefa>();

  @observable
  Tarefa tarefaAtual = Tarefa(titulo: "", descricao: "", concluida: false);

  @action
  Future<void> adicionarTarefa(Tarefa tarefa) async {
    tarefas.add(tarefa);
    await HiveStore.salvarTarefas(tarefas);
  }

  @action
  Future<void> editarTarefa(Tarefa tarefa) async {
    final index = tarefas.indexWhere((element) => element.id == tarefa.id);
    if (index != -1) {
      tarefas[index] = tarefa;
    }
    await HiveStore.salvarTarefas(tarefas);
  }
}
