import 'package:flutter/material.dart';
import 'package:jobs/providers/VacancyProvider.dart';
import 'package:provider/provider.dart';
import 'ui/vacancy_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<VacancyProvider>(create: (_) => VacancyProvider()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Vacancy App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: VacancyListScreen(),
      ),
    );
  }
}