import 'package:json_annotation/json_annotation.dart';

part 'loginEntity.g.dart';

@JsonSerializable()
class LoginEntity {
  final String? email;
  final String? password;

  LoginEntity(this.email, this.password);

  Map<String, dynamic> toJson() => _$LoginEntityToJson(this);
}
