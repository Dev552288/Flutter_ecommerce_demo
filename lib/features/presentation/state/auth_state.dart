import 'package:ecommerce_app/features/auth/data/models/login_response_model.dart';
import 'package:ecommerce_app/features/presentation/state/auth_status.dart';

class AuthState {
  final AuthStatus status;
  final LoginResponseModel? loginResponseModel;
  final String? errorMessage;

  const AuthState({
    this.status = AuthStatus.intial,
    this.loginResponseModel,
    this.errorMessage,
  });

  AuthState coypWith({
    AuthStatus? status,
    LoginResponseModel? loginResponseModel,
    String? errorMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      loginResponseModel: loginResponseModel ?? this.loginResponseModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
