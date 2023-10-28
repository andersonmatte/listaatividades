import 'package:hive/hive.dart';
import 'package:mobx/mobx.dart';

//part 'tarefa_model.g.dart';

@HiveType(typeId: 0)
class Tarefa {

  @observable
  @HiveField(0)
  late int id;

  @observable
  @HiveField(0)
  late String titulo;

  @observable
  @HiveField(1)
  late String descricao;

  @observable
  @HiveField(2)
  late bool concluida;

  Tarefa(
      {required this.titulo, required this.descricao, required this.concluida});
}
