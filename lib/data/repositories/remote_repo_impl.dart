

import '../../domain/repositories/remote_repo.dart';
import '../datasources/remote_datasource.dart';

class RemoteRepoImpl implements RemoteRepo {
  final RemoteDatasource remoteDatasource;

  RemoteRepoImpl({required this.remoteDatasource});

  // @override
  // Future<List<StockModel>> getStocks() async {
  //   return remoteDatasource.getAllStocksFromApi();
  // }
}
