import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network/dia_client.dart';
import 'package:ecommerce_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:ecommerce_app/features/auth/data/models/login_request_model.dart';
import 'package:ecommerce_app/features/auth/data/models/signup_request_model.dart';
import 'package:ecommerce_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:ecommerce_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:ecommerce_app/features/auth/domain/usecases/login.dart';
import 'package:ecommerce_app/features/auth/domain/usecases/signup.dart';
import 'package:ecommerce_app/features/presentation/state/auth_state.dart';
import 'package:ecommerce_app/features/presentation/state/auth_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:ecommerce_app/features/auth/data/datasources/auth_remote_datasource_impl.dart';

final dioProvider = Provider<DioClient>((ref) {
  return DioClient();
});

final authRemoteDataSourceProvider = Provider<AuthRemoteDatasource>((ref) {
  final dio = ref.read(dioProvider);

  return AuthRemoteDataSourceImpl(dio);
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final remoteDataSource = ref.read(authRemoteDataSourceProvider);
  return AuthRepositoryImpl(remoteDataSource);
});

final loginUseCaseProvider = Provider<Login>((ref) {
  final repository = ref.read(authRepositoryProvider);

  return Login(repository);
});

final signupUseCaseProvider = Provider<Signup>((ref) {
  final repository = ref.read(authRepositoryProvider);

  return Signup(repository);
});

class AuthProvider extends StateNotifier<AuthState> {
  final Login loginusecase;
  final Signup signupusecase;

  AuthProvider({required this.loginusecase, required this.signupusecase})
    : super(const AuthState());

  Future<void> login({
    required String usename,
    required String password,
  }) async {
    state = state.coypWith(status: AuthStatus.laoding, errorMessage: null);

    try {
      final request = LoginRequestModel(username: usename, password: password);
      final response = await loginusecase(request);
      state = state.coypWith(
        status: AuthStatus.success,
        loginResponseModel: response,
      );
    } catch (e) {
      state = state.coypWith(
        status: AuthStatus.failure,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> signup({
    required String username,
    required String password,
    required String email,
    required String mobileNumber,
    required String name,
    required String dob,
  }) async {
    state = state.coypWith(status: AuthStatus.laoding, errorMessage: null);
    try {
      final request = SignupRequestModel(
        name: name,
        username: username,
        password: password,
        mobileNumber: mobileNumber,
        email: email,
        dob: dob,
      );
      await signupusecase(request);
      state = state.coypWith(status: AuthStatus.success);
    } catch (e) {
      state = state.coypWith(
        status: AuthStatus.failure,
        errorMessage: e.toString(),
      );
    }
  }
}

final authProvider = StateNotifierProvider<AuthProvider, AuthState>((ref) {
  return AuthProvider(
    loginusecase: ref.read(loginUseCaseProvider),
    signupusecase: ref.read(signupUseCaseProvider),
  );
});
