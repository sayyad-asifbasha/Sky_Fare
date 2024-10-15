import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel
{
  factory UserModel({
    @Default('') @JsonKey(name:'token')String token,
    @Default('') @JsonKey(name:'message')String message,
  })=_UserModel;

  factory UserModel.fromJson(Map<String,dynamic> json)=> _$UserModelFromJson(json);
}