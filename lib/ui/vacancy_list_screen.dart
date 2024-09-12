import 'package:flutter/material.dart';
import 'package:jobs/providers/VacancyProvider.dart';
import 'package:provider/provider.dart';

import '../widgets/vacancy_widget.dart';

class VacancyListScreen extends StatefulWidget {
  @override
  _VacancyListScreenState createState() => _VacancyListScreenState();
}

class _VacancyListScreenState extends State<VacancyListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      fetchVacancies();
    });
  }

  fetchVacancies() {
    Provider.of<VacancyProvider>(context, listen: false).getVacancies(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vacancies')),
      body: Consumer<VacancyProvider>(builder: (context, provider, child) {
        return provider.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : provider.vacancies.isEmpty
                ? Center(child: Text('No vacancies available'))
                : ListView.builder(
                    itemCount: provider.vacancies.length,
                    itemBuilder: (context, index) {
                      final vacancy = provider.vacancies[index];
                      return VacancyWidget(vacancy: vacancy);
                    },
                  );
      }),
    );
  }
}
