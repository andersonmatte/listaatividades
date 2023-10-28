import 'package:hive/hive.dart';
import 'package:listaatividades/tarefa_model.dart';

class TarefaAdapter extends TypeAdapter<Tarefa> {
  @override
  int get typeId => 0; // Deve ser um ID exclusivo para o modelo Contact

  @override
  Tarefa read(BinaryReader reader) {
    return Tarefa(
      titulo: reader.read(),
      descricao: reader.read(),
      concluida: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, Tarefa obj) {
    writer.write(obj.titulo);
    writer.write(obj.descricao);
    writer.write(obj.concluida);
  }
}
