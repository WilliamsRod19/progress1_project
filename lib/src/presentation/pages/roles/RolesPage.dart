import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress1_project/src/presentation/pages/roles/RolesItem.dart';
import 'package:progress1_project/src/presentation/pages/roles/bloc/RolesBloc.dart';
import 'package:progress1_project/src/presentation/pages/roles/bloc/RolesState.dart';

class RolesPage extends StatefulWidget {
  const RolesPage({super.key});

  @override
  State<RolesPage> createState() => _RolesPageState();
}

class _RolesPageState extends State<RolesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RolesBloc, RolesState>(
        builder: (context, state) {
          final roles = state.roles;
          if (roles == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView(
            shrinkWrap: true,
            children: roles.where((role) => role != null).map((role) => GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/${role.route}'),
              child: RolesItem(role: role!)
            )).toList(),
          );
        },
      ),
    );
  }
}