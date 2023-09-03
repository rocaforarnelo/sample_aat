import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:photo_app/core/presentation/injection/injector.dart';
import 'package:photo_app/core/presentation/theme/themes.dart';
import 'package:photo_app/features/upload_photo/presentation/photo_list/bloc/photo_bloc.dart';
import 'package:photo_app/features/upload_photo/presentation/screens/upload_photo/upload_photo_screen.dart';

void main() {
  startApp(Environment.prod);
}

Future<void> startApp(String environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies(environment);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.light,
      home: BlocProvider(
        create: (_) => locator<PhotoBloc>(),
        child: const UploadPhotoScreen(),
      ),
    );
  }
}
