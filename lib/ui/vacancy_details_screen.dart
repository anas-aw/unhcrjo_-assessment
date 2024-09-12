import 'package:flutter/material.dart';

import '../models/vacancy_model.dart';
import '../widgets/vacancy_details_widget.dart';

class VacancyDetailsScreen extends StatelessWidget {
  final Vacancy vacancy;

  VacancyDetailsScreen({required this.vacancy});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(vacancy.title ??'')),
      body: VacancyDetailsWidget(vacancy:vacancy),
    );
  }
}
