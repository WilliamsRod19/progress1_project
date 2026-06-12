import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress1_project/src/presentation/pages/client/home/bloc/ClientHomeBloc.dart';
import 'package:progress1_project/src/presentation/pages/client/home/bloc/ClientHomeEvent.dart';
import 'package:progress1_project/src/presentation/pages/client/home/bloc/ClientHomeState.dart';
import 'package:progress1_project/src/presentation/pages/login/bloc/LoginBloc.dart';
import 'package:progress1_project/src/presentation/pages/login/bloc/LoginEvent.dart';

class ClientHomePage extends StatefulWidget {
  const ClientHomePage({super.key});

  @override
  State<ClientHomePage> createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Client Home')),
        drawer: BlocBuilder<ClientHomeBloc, ClientHomeState>(
          builder: (context, state) {
            final authResponse = state.authResponse?.createUserResponse;
            if (authResponse == null) {
              return SizedBox.shrink();
            }
            return Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  UserAccountsDrawerHeader(
                    accountName: Text('${authResponse.name} ${authResponse.lastName}'),
                    accountEmail: Text(authResponse.email),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: authResponse.image != null ? NetworkImage(authResponse.image!) : null,
                      child: authResponse.image == null ? Icon(Icons.person) : null,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Inicio'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Perfil'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "/client/profile");
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.logout),
                    title: Text('Cerrar Sesión'),
                    onTap: () async{
                      //limpiar nuestro estado de loginBloc
                      context.read<LoginBloc>().add(const LoginReset());
                      // limpiar nuestra session y redirigir al login
                      context.read<ClientHomeBloc>().add(const Logout());
                      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
                    },
                  ),
                ],
              ),
            );
          },
        ),
      body: Center(
        child: Text('Client Home Page'),
      ),
    );
  }
}