// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../features/upload_photo/data/data_sources/add_photo/add_photo_datasource.dart'
    as _i3;
import '../../../features/upload_photo/data/data_sources/add_photo/in_memory_photo_datasource.dart'
    as _i4;
import '../../../features/upload_photo/data/data_sources/upload_photo/fake_upload_photo_datasource.dart'
    as _i14;
import '../../../features/upload_photo/data/data_sources/upload_photo/upload_photo_datasource.dart'
    as _i12;
import '../../../features/upload_photo/data/data_sources/upload_photo/upload_photo_remote_datasource.dart'
    as _i13;
import '../../../features/upload_photo/data/repositories/add_photo_repository_impl.dart'
    as _i6;
import '../../../features/upload_photo/data/repositories/upload_photo_repository_impl.dart'
    as _i16;
import '../../../features/upload_photo/domain/repositories/add_photo_repository.dart'
    as _i5;
import '../../../features/upload_photo/domain/repositories/upload_photo_repository.dart'
    as _i15;
import '../../../features/upload_photo/domain/upload_photo/use_cases/add_photo_use_case.dart'
    as _i7;
import '../../../features/upload_photo/domain/upload_photo/use_cases/get_photos_use_case.dart'
    as _i11;
import '../../../features/upload_photo/domain/upload_photo/use_cases/upload_photo_use_case.dart'
    as _i17;
import '../../../features/upload_photo/presentation/photo_list/bloc/photo_bloc.dart'
    as _i18;
import '../../../features/upload_photo/presentation/photo_list/cubit/photo_list_cubit_cubit.dart'
    as _i19;
import '../../infra/image_picker/fake_image_picker_impl.dart' as _i9;
import '../../infra/image_picker/image_picker.dart' as _i8;
import '../../infra/image_picker/image_picker_impl.dart' as _i10;

const String _test = 'test';
const String _prod = 'prod';

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
    gh.lazySingleton<_i3.AddPhotoDataSource>(
        () => _i4.InMemoryPhotoDataSource());
    gh.lazySingleton<_i5.AddPhotoRepository>(
        () => _i6.AddPhotoRepositoryImpl(gh<_i3.AddPhotoDataSource>()));
    gh.lazySingleton<_i7.AddPhotoUseCase>(() => _i7.AddPhotoUseCaseImpl(
        addPhotoRepository: gh<_i5.AddPhotoRepository>()));
    gh.lazySingleton<_i8.AppImagePicker>(
      () => _i9.FakeImagePickerImpl(),
      registerFor: {_test},
    );
    gh.lazySingleton<_i8.AppImagePicker>(
      () => _i10.ImagePickerImpl(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i11.GetPhotosUseCase>(() => _i11.GetPhotosUseCaseImpl(
        addPhotoRepository: gh<_i5.AddPhotoRepository>()));
    gh.lazySingleton<_i12.UploadPhotoDataSource>(
      () => _i13.UploadPhotoRemoteDataSource(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i12.UploadPhotoDataSource>(
      () => _i14.FakeUploadPhotoRemoteDataSource(),
      registerFor: {_test},
    );
    gh.lazySingleton<_i15.UploadPhotoRepository>(
        () => _i16.UploadPhotoRepositoryImpl(gh<_i12.UploadPhotoDataSource>()));
    gh.lazySingleton<_i17.UploadPhotoUseCase>(
        () => _i17.UploadPhotoUseCaseImpl(gh<_i15.UploadPhotoRepository>()));
    gh.factory<_i18.PhotoBloc>(() => _i18.PhotoBloc(
          addPhotoUseCase: gh<_i7.AddPhotoUseCase>(),
          getPhotosUseCase: gh<_i11.GetPhotosUseCase>(),
          uploadPhotoUseCase: gh<_i17.UploadPhotoUseCase>(),
        ));
    gh.factory<_i19.PhotoListCubit>(() => _i19.PhotoListCubit(
          addPhotoUseCase: gh<_i7.AddPhotoUseCase>(),
          uploadPhotoUseCase: gh<_i17.UploadPhotoUseCase>(),
          getPhotosUseCase: gh<_i11.GetPhotosUseCase>(),
        ));
    return this;
  }
}
