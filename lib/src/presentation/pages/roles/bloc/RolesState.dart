import 'package:equatable/equatable.dart';
import 'package:progress1_project/src/domain/models/Role.dart';

class RolesState extends Equatable {
  final List<Role?>? roles;

  const RolesState({ this.roles });

  RolesState copyWith({List<Role?>? roles}) {
    return RolesState(roles: roles);
  }

  @override
  List<Object?> get props => [roles];
}