import 'package:gestao_financeira_app/DatabaseConnections/DAO_Objects/ClassesDAO.dart';
import 'package:gestao_financeira_app/Models/Config/AlertsModel.dart';
import 'package:sembast/sembast.dart';

import '../DatabaseSetup.dart';

class AlertsDAO {
  static const String folderName = "Alertas_Gerais";
  final _alertasFolder = intMapStoreFactory.store(folderName);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insertAlert(AlertsModel alerta) async {
    return await _alertasFolder.add(await _db, alerta.toJson());
  }

  Future updateAlert(AlertsModel alerta) async {
    final finder = Finder(
        filter: Filter.matches('data_registro', '${alerta.data_registro}'));

    return await _alertasFolder.update(await _db, alerta.toJson(),
        finder: finder);
  }

  Future deleteAlert(AlertsModel alerta) async {
    final finder = Finder(
        filter: Filter.matches('data_registro', '${alerta.data_registro}'));
    await _alertasFolder.delete(
      await _db,
      finder: finder,
    );
    print("nome entrada ${alerta.id_entry} ${finder}");
  }

  Future<List<AlertsModel>> getAllAlerts() async {
    final recordSnapshot = await _alertasFolder.find(await _db);
    return recordSnapshot.map((snapshot) {
      final alerta = AlertsModel.fromJson(snapshot.value);
      return alerta;
    }).toList();
  }

  Future<List> getAllAlertsAndClasses() async {
    final classe = await ClassesDAO().getAllClasses();
    final alerta = await getAllAlerts();
    return [alerta, classe];
  }
}
