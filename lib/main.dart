import 'package:flutter/material.dart';
import 'package:sofa/presentation/main_screen.dart';
import 'package:sofa/data/repositories/users_repository_impl.dart';
import 'package:sofa/presentation/bloc/users_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) =>
            UsersBloc(UsersRepositoryImpl())..add(FetchUsers()),
        child: const MainScreen(),
      ),
    );
  }
}
