import 'package:chat_message/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:chat_message/features/auth/presentation/pages/login_page.dart';
import 'package:chat_message/features/product/product_injection.dart';
import 'package:chat_message/injection_container.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: BlocProvider(
        create: (_) => sl<AuthBloc>(),
        child: const LoginPage(),
      ),
    );
  }
}
