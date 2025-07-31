import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_store/features/auth/data/datasources/remote_data_source.dart';
import 'package:tech_store/features/auth/data/datasources/remote_data_source_impl.dart';
import 'package:tech_store/features/auth/data/repository/auth_repository_impl.dart';
import 'package:tech_store/features/auth/domain/repository/auth_repository.dart';
import 'package:tech_store/features/auth/domain/use%20cases/login_use_case.dart';
import 'package:tech_store/features/auth/presentation/viewmodels/login_viewmodel.dart';
final remoteDataSourceProvider = Provider<RemoteDataSource>((ref) {
  return RemoteDataSourceImpl();
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remoteDataSource = ref.watch(remoteDataSourceProvider);
  return AuthRepositoryImpl(remoteDataSource);
});


final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  final repo = ref.watch(authRepositoryProvider);
  return LoginUseCase(repo);
});
final loginControllerProvider = StateNotifierProvider<LoginController, AsyncValue<void>>((ref) {
  final useCase = ref.watch(loginUseCaseProvider);
  return LoginController(useCase);
});