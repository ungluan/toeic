import 'package:floor/floor.dart';

@Entity(tableName: 'user')
class UserEntity {
  @primaryKey
  @ColumnInfo(name: 'id')
  final int? id;

  @ColumnInfo(name: 'first_name')
  final String? firstName;

  @ColumnInfo(name: 'last_name')
  final String? lastName;

  @ColumnInfo(name: 'email')
  final String? email;

  @ColumnInfo(name: 'password')
  final String? password;

  @ColumnInfo(name: 'birth_date')
  final String? birthDate;

  @ColumnInfo(name: 'address')
  final String? address;

  @ColumnInfo(name: 'phone_number')
  final String? phoneNumber;

  @ColumnInfo(name: 'gender')
  final String? gender;

  @ColumnInfo(name: 'avatar')
  final String? avatar;

  @ColumnInfo(name: 'is_active')
  final bool? isActive;

  @ColumnInfo(name: 'rule_id')
  final String? ruleId;

  @ColumnInfo(name: 'target')
  final int? target;

  @ColumnInfo(name: 'firebase_token')
  final String? firebaseToken;

  @ColumnInfo(name: 'created_at')
  final String? createdAt;

  @ColumnInfo(name: 'updated_at')
  final String? updatedAt;

  UserEntity({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.birthDate,
    this.address,
    this.phoneNumber,
    this.gender,
    this.avatar,
    this.isActive,
    this.ruleId,
    this.target,
    this.firebaseToken,
    this.createdAt,
    this.updatedAt,
  });
}
