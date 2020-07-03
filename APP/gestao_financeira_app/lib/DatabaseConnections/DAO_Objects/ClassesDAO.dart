import 'package:gestao_financeira_app/Models/Config/ClassesModel.dart';
import 'package:sembast/sembast.dart';

import '../DatabaseSetup.dart';



class ClassesDAO{
  static const String folderName = "Classes_Cadastradas";
  final _classesFolder = intMapStoreFactory.store(folderName);


  Future<Database> get  _db  async => await AppDatabase.instance.database;

  Future insertClass(ClassesModel classe) async{

    await  _classesFolder.add(await _db, classe.toJson() );
    print('class Inserted successfully !!');
  }

  Future updateStudent(ClassesModel classe) async{
    final finder = Finder(filter: Filter.byKey(classe.id_entry));
    await _classesFolder.update(await _db, classe.toJson(),finder: finder);

  }


  Future delete(ClassesModel classe) async{
    final finder = Finder(filter: Filter.byKey(classe.id_entry));
    await _classesFolder.delete(await _db, finder: finder);
  }

  Future<List<ClassesModel>> getAllClasses()async{
    final recordSnapshot = await _classesFolder.find(await _db);
    return recordSnapshot.map((snapshot){
      final classe = ClassesModel.fromJson(snapshot.value);
      return classe;
    }).toList();
  }


}