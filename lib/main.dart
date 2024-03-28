import 'package:flutter/material.dart';
import 'package:mvvm_architecture_with_api_and_provider/utils/routes/routes.dart';
import 'package:mvvm_architecture_with_api_and_provider/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthViewModel()),
      ],
      child: MaterialApp(
        title: 'MVVM Architecture with API and Provider',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes().generateRoute,
        initialRoute: Routes.login,
      ),
    );
  }
}
