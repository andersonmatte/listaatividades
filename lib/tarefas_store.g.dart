// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tarefas_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TarefasStore on _TarefasStore, Store {
  late final _$tarefasAtom =
      Atom(name: '_TarefasStore.tarefas', context: context);

  @override
  ObservableList<Tarefa> get tarefas {
    _$tarefasAtom.reportRead();
    return super.tarefas;
  }

  @override
  set tarefas(ObservableList<Tarefa> value) {
    _$tarefasAtom.reportWrite(value, super.tarefas, () {
      super.tarefas = value;
    });
  }

  late final _$tarefaAtualAtom =
      Atom(name: '_TarefasStore.tarefaAtual', context: context);

  @override
  Tarefa get tarefaAtual {
    _$tarefaAtualAtom.reportRead();
    return super.tarefaAtual;
  }

  @override
  set tarefaAtual(Tarefa value) {
    _$tarefaAtualAtom.reportWrite(value, super.tarefaAtual, () {
      super.tarefaAtual = value;
    });
  }

  late final _$adicionarTarefaAsyncAction =
      AsyncAction('_TarefasStore.adicionarTarefa', context: context);

  @override
  Future<void> adicionarTarefa(Tarefa tarefa) {
    return _$adicionarTarefaAsyncAction
        .run(() => super.adicionarTarefa(tarefa));
  }

  late final _$editarTarefaAsyncAction =
      AsyncAction('_TarefasStore.editarTarefa', context: context);

  @override
  Future<void> editarTarefa(Tarefa tarefa) {
    return _$editarTarefaAsyncAction.run(() => super.editarTarefa(tarefa));
  }

  @override
  String toString() {
    return '''
tarefas: ${tarefas},
tarefaAtual: ${tarefaAtual}
    ''';
  }
}
