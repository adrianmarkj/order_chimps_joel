import 'package:base_project/application/pages/home/bloc/home_bloc.dart';
import 'package:base_project/application/pages/login/bloc/login_bloc.dart';
import 'package:base_project/application/pages/profile/bloc/profile_bloc.dart';
import 'package:base_project/domain/repositories/remote_repo.dart';
import 'package:base_project/domain/usecases/login/authenticate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'application/core/network/api_helper.dart';
import 'application/core/network/network_info.dart';
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
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
  sl.registerLazySingleton<APIHelper>(() => APIHelper(dio: sl()));
  sl.registerLazySingleton(() => Connectivity());

  /// Application Layer ///
  /// Factory = every time new instance of that class
  sl.registerFactory(() => LoginBloc(auth: sl()));
  sl.registerFactory(() => HomeBloc());
  sl.registerFactory(() => ProfileBloc());

  /// Domain Layer ///
  /// Use Cases
  sl.registerFactory(() => AuthUseCase(repository: sl()));

  /// Repository
  sl.registerLazySingleton<RemoteRepo>(
        () => RemoteRepoImpl(networkInfo: sl(), remoteDatasource: sl()),
  );

  /// Data Layer ///
  /// remote
  sl.registerFactory(() => RemoteRepoImpl(remoteDatasource: sl(), networkInfo: sl()));
  sl.registerFactory<RemoteDatasource>(
          () => RemoteDataSourceImpl(apiHelper: sl()));
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
  sl.registerSingleton(Dio());
  sl.registerFactory(() => http.Client());
  sl.registerFactory(() => SharedPreferences.getInstance());
  sl.registerFactory(() => FirebaseFirestore.instance);
}
