import 'package:json_annotation/json_annotation.dart';

part 'signupEntity.g.dart';

@JsonSerializable()
class SignUpEntity {
  final String? email;
  final String? password;

  SignUpEntity(this.email, this.password);

  Map<String, dynamic> toJson() => _$SignUpEntityToJson(this);
}
