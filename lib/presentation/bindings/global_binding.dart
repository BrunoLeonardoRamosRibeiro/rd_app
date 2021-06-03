import 'package:get/get.dart';
import 'package:rd_app/data/datasources/superheroes_local_datasource.dart';
import 'package:rd_app/data/datasources/superheroes_remote_datasource.dart';
import 'package:rd_app/data/repositories/superheroes_repository_impl.dart';
import 'package:rd_app/data/repositories/superheroes_service_impl.dart';
import 'package:rd_app/domain/repositories/superheroes_repository.dart';
import 'package:rd_app/domain/usecases/get_all_usecase.dart';
import 'package:rd_app/domain/usecases/random_superhero_usecase.dart';
import 'package:rd_app/domain/usecases/search_by_name_usecase.dart';
import 'package:rd_app/presentation/controllers/global_controller.dart';
import 'package:http/http.dart' as http;

class GlobalBinding implements Bindings {
  final http.Client client = http.Client();

  @override
  void dependencies() {
    Get.put(GlobalController(), permanent: true);
    Get.lazyPut<SuperheroesRemoteDatasource>(()=>SuperheroesRemoteDatasourceImpl(client));
    Get.put<SuperheroesRepository>(SuperheroesRepositoryImpl(SuperheroesRemoteDatasourceImpl(client)));
    Get.lazyPut<GetAllUsecase>(()=> GetAllUsecase(SuperheroesRepositoryImpl(SuperheroesRemoteDatasourceImpl(client))));
    Get.lazyPut<SearchByNameUsecase>(()=> SearchByNameUsecase(SuperheroesServiceImpl(SuperheroesLocalDatasourceImpl())));
    Get.lazyPut<RandomSuperheroUsecase>(()=> RandomSuperheroUsecase(SuperheroesServiceImpl(SuperheroesLocalDatasourceImpl())));
  }
}