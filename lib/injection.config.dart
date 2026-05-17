// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:progress1_project/src/data/dataSource/remote/service/AuthService.dart'
    as _i5;
import 'package:progress1_project/src/di/appModules.dart' as _i7;
import 'package:progress1_project/src/domain/repository/AuthRepository.dart'
    as _i3;
import 'package:progress1_project/src/domain/useCases/auth/AuthUsesCase.dart'
    as _i4;
import 'package:progress1_project/src/presentation/pages/register/bloc/RegisterBloc.dart'
    as _i6;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appmodules = _$Appmodules();
    gh.factory<_i3.AuthRepository>(() => appmodules.authRepository);
    gh.factory<_i4.AuthUsesCases>(() => appmodules.authUsesCases);
    gh.factory<_i5.Authservice>(() => appmodules.authService);
    gh.factory<_i6.RegisterBloc>(() => appmodules.registerBloc);
    return this;
  }
}

class _$Appmodules extends _i7.Appmodules {}
