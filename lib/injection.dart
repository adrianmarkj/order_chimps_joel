import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'data/datasources/file_datasource.dart';
import 'data/datasources/firestore_datasource.dart';
import 'data/datasources/local_datasource.dart';
import 'data/datasources/remote_datasource.dart';
import 'data/repositories/file_repo_impl.dart';
import 'data/repositories/firestore_repo_impl.dart';
import 'data/repositories/local_repo_impl.dart';
import 'data/repositories/remote_repo_impl.dart';

final sl = GetIt.I; //sl = service locator

Future<void> init() async {
  /// Application Layer ///
  /// Factory = every time new instance of that class
  // sl.registerFactory(() => SplashCubit(splashUseCases: sl()));

  /// Domain Layer ///
  // sl.registerFactory(() => SplashUseCases(
  //     localRepoImpl: sl(), firestoreRepoImpl: sl(), fileRepoImpl: sl()));

  /// Data Layer ///
  /// remote
  sl.registerFactory(() => RemoteRepoImpl(remoteDatasource: sl()));
  sl.registerFactory<RemoteDatasource>(
          () => RemoteDataSourceImpl(client: sl()));
  /// local
  sl.registerFactory(() => LocalRepoImpl(localDatasource: sl()));
  sl.registerFactory<LocalDatasource>(() => LocalDataSourceImpl(prefs: sl()));
  /// firestore
  sl.registerFactory(() => FirestoreRepoImpl(firestoreDatasource: sl()));
  sl.registerFactory<FirestoreDatasource>(
          () => FirestoreDatasourceImpl(firestore: sl()));
  /// file caching
  sl.registerFactory(() => FileRepoImpl(fileDataSource: sl()));
  sl.registerFactory<FileDataSource>(() => FileDataSourceImpl());

  /// Extern (packages)
  sl.registerFactory(() => http.Client());
  sl.registerFactory(() => SharedPreferences.getInstance());
  sl.registerFactory(() => FirebaseFirestore.instance);
}
