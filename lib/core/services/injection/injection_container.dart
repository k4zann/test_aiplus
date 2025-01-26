import 'package:get_it/get_it.dart';
import 'package:test_aiplus/core/services/local_storage/shared_prefs.dart';
import 'package:test_aiplus/features/todo/data/data_source/todo_storage.dart';
import 'package:test_aiplus/features/todo/data/repo_impl/todo_repo_impl.dart';
import 'package:test_aiplus/features/todo/domain/repo/todo_repo.dart';

final GetIt sl = GetIt.instance;


Future<void> initDI() async {
  // shared preferences service
  final sharedPreferencesService = SharedPreferencesService();
  await sharedPreferencesService.initialize();
  sl.registerLazySingleton<SharedPreferencesService>(() => sharedPreferencesService);

  // todo repo
  sl.registerLazySingleton<TodoRepo>(
    () => TodoRepoImpl(),
  );

  // todo storage
  sl.registerLazySingleton<TodoStorage>(() => TodoStorage());
}