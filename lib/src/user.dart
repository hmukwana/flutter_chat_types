import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user.g.dart';

/// All possible roles user can have.
enum Role { admin, agent, moderator, user }

/// A class that represents user.
@JsonSerializable()
@immutable
abstract class User extends Equatable {
  /// Creates a user.
  const User._({
    this.createdAt,
    this.fullName,
    this.firstName,
    required this.id,
    this.imageUrl,
    this.lastName,
    this.isAnonymous,
    this.isVerified,
    this.lastSeen,
    this.metadata,
    this.role,
    this.updatedAt,
  });

  const factory User({
    int? createdAt,
    String? fullName,
    String? firstName,
    required String id,
    String? imageUrl,
    String? lastName,
    bool? isAnonymous,
    bool? isVerified,
    int? lastSeen,
    Map<String, dynamic>? metadata,
    Role? role,
    int? updatedAt,
  }) = _User;

  /// Creates user from a map (decoded JSON).
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Created user timestamp, in ms.
  final int? createdAt;

  /// Full name of the user.
  final String? fullName;

  /// First name of the user.
  final String? firstName;

  /// Unique ID of the user.
  final String id;

  /// Remote image URL representing user's avatar.
  final String? imageUrl;

  /// Last name of the user.
  final String? lastName;

  /// Is user anonymous or not.
  final bool? isAnonymous;

  /// Is user verified or not.
  final bool? isVerified;

  /// Timestamp when user was last visible, in ms.
  final int? lastSeen;

  /// Additional custom metadata or attributes related to the user.
  final Map<String, dynamic>? metadata;

  /// User [Role].
  final Role? role;

  /// Updated user timestamp, in ms.
  final int? updatedAt;

  /// Equatable props.
  @override
  List<Object?> get props => [
        createdAt,
        fullName,
        firstName,
        id,
        imageUrl,
        lastName,
        isAnonymous,
        isVerified,
        lastSeen,
        metadata,
        role,
        updatedAt,
      ];

  User copyWith({
    int? createdAt,
    String? fullName,
    String? firstName,
    String? id,
    String? imageUrl,
    bool? isAnonymous,
    bool? isVerified,
    String? lastName,
    int? lastSeen,
    Map<String, dynamic>? metadata,
    Role? role,
    int? updatedAt,
  });

  /// Converts user to the map representation, encodable to JSON.
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

/// A utility class to enable better copyWith.
class _User extends User {
  const _User({
    super.createdAt,
    super.fullName,
    super.firstName,
    required super.id,
    super.imageUrl,
    super.lastName,
    super.isAnonymous,
    super.isVerified,
    super.lastSeen,
    super.metadata,
    super.role,
    super.updatedAt,
  }) : super._();

  @override
  User copyWith({
    dynamic createdAt = _Unset,
    dynamic fullName = _Unset,
    dynamic firstName = _Unset,
    String? id,
    dynamic imageUrl = _Unset,
    dynamic lastName = _Unset,
    dynamic isAnonymous = _Unset,
    dynamic isVerified = _Unset,
    dynamic lastSeen = _Unset,
    dynamic metadata = _Unset,
    dynamic role = _Unset,
    dynamic updatedAt = _Unset,
  }) =>
      _User(
        createdAt: createdAt == _Unset ? this.createdAt : createdAt as int?,
        fullName: fullName == _Unset ? this.fullName : fullName as String?,
        firstName: firstName == _Unset ? this.firstName : firstName as String?,
        id: id ?? this.id,
        imageUrl: imageUrl == _Unset ? this.imageUrl : imageUrl as String?,
        isAnonymous:
            isAnonymous == _Unset ? this.isAnonymous : isAnonymous as bool?,
        isVerified:
            isVerified == _Unset ? this.isVerified : isVerified as bool?,
        lastName: lastName == _Unset ? this.lastName : lastName as String?,
        lastSeen: lastSeen == _Unset ? this.lastSeen : lastSeen as int?,
        metadata: metadata == _Unset
            ? this.metadata
            : metadata as Map<String, dynamic>?,
        role: role == _Unset ? this.role : role as Role?,
        updatedAt: updatedAt == _Unset ? this.updatedAt : updatedAt as int?,
      );
}

class _Unset {}
