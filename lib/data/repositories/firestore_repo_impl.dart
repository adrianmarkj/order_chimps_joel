
import '../../domain/repositories/firestore_repo.dart';
import '../datasources/firestore_datasource.dart';

class FirestoreRepoImpl implements FirestoreRepo {
  final FirestoreDatasource firestoreDatasource;

  FirestoreRepoImpl({required this.firestoreDatasource});

  // @override
  // Future<List<dynamic>> readPapers() {
  //   // TODO: implement readPapers
  //   throw UnimplementedError();
  // }
  //
  // @override
  // Future<List<dynamic>> readPastpapers() {
  //   // TODO: implement readPastpapers
  //   throw UnimplementedError();
  // }

  // @override
  // Future<List<PastpaperEntity>> readPastpapers() {
  //   return firestoreDatasource.readPastpapers();
  // }
  //
  // @override
  // Future<List<PaperEntity>> readPapers() {
  //   return firestoreDatasource.readPapers();
  // }
}
