import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/vacancy_model.dart';

class VacancyProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Vacancy> vacancies = [];


  getVacancies(context) async {
    isLoading = true;
    notifyListeners();
    try {

    final response = await http.get(Uri.parse('https://www.unhcrjo.org/jobs/api'));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
       vacancies =
           data.map((json) => Vacancy.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load vacancies');
    }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error fetching data. Please try again later.'),
      ));
    }
    isLoading = false;
    notifyListeners();
    return;
  }
}
