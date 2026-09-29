import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/network/dia_client.dart';

import '../models/login_request_model.dart';
import '../models/login_response_model.dart';
import '../models/signup_request_model.dart';
import 'auth_remote_datasource.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDatasource {
  final DioClient dioClient;

  AuthRemoteDataSourceImpl(this.dioClient);

  @override
  Future<LoginResponseModel> login(LoginRequestModel request) async {
    try {
      final response = await dioClient.dio.post(
        '/api/auth/login',
        data: request.toJson(),
      );

      return LoginResponseModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? e.message ?? 'Login failed');
    }
  }

  @override
  Future<void> signup(SignupRequestModel request) async {
    try {
      await dioClient.dio.post('/api/auth/signup', data: request.toJson());
    } on DioException catch (e) {
      throw Exception(e.response?.data ?? e.message ?? 'Signup failed');
    }
  }
}
