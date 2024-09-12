import 'package:flutter/material.dart';
import '../models/vacancy_model.dart';

class VacancyDetailsWidget extends StatelessWidget {
  final Vacancy vacancy;

  const VacancyDetailsWidget({super.key, required this.vacancy});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  vacancy.imageUrl ?? '',
                  width: MediaQuery.of(context).size.width * 0.85,
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.broken_image,
                    size: 100,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            _buildInfoCard(
              title: 'Vacancy Details',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow('Title:', vacancy.title ?? 'N/A'),
                  _buildDetailRow('Company:', vacancy.company ?? 'N/A'),
                  _buildDetailRow('Location:', vacancy.location ?? 'N/A'),
                  _buildDetailRow('Salary:', vacancy.salary ?? 'N/A'),
                  _buildDetailRow('Date Posted:', vacancy.datePosted ?? 'N/A'),
                ],
              ),
            ),
            SizedBox(height: 20),

            _buildTabbedSection(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey[700],
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({ required String title, required Widget content}) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey[800],
              ),
            ),
            SizedBox(height: 12),
            content,
          ],
        ),
      ),
    );
  }

  Widget _buildTabbedSection(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TabBar(
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
            tabs: [
              Tab(text: 'Description'),
              Tab(text: 'Long Description'),
            ],
          ),
          Container(
            height: 250,
            child: TabBarView(
              children: [
                _buildDescriptionTab(vacancy.description ?? 'No description available.'),
                _buildDescriptionTab(vacancy.longDescription ?? 'No long description available.'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescriptionTab(String content) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          Text(
            content,
            style: TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
