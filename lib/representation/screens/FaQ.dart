import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FAQScreen extends StatelessWidget {
  final Color primaryColor = const Color(0xFF2185D5);

  final List<Map<String, String>> faqItems = [
    {
      'question': 'How do I open a CCP account?',
      'answer':
          'To open a CCP account, visit your nearest Algérie Poste office with a valid ID, proof of address, and a recent photo. Fill out the application form provided by the staff, and your account will typically be ready within a few business days.'
    },
    {
      'question': 'What are the working hours of Algérie Poste offices?',
      'answer':
          'Most Algérie Poste offices are open from Sunday to Thursday, 8:30 AM to 4:30 PM. However, hours may vary by location, especially in rural areas or during Ramadan. It\'s best to check with your local office for specific timings.'
    },
    {
      'question': 'How can I track my package?',
      'answer':
          'You can track your package on the Algérie Poste website or mobile app. Enter your tracking number in the designated field, and you\'ll be able to see the current status and location of your package.'
    },
    {
      'question': 'What services does Algérie Poste offer?',
      'answer':
          'Algérie Poste offers a wide range of services including postal services (letters, parcels), financial services (CCP accounts, money transfers), digital services (e-payment, online banking), and more.'
    },
    {
      'question': 'How do I reset my online banking password?',
      'answer':
          'To reset your online banking password, go to the Algérie Poste website and click on "Forgot Password". Follow the prompts to verify your identity and set a new password. If you encounter issues, visit your local post office for assistance.'
    },
  ];

  FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _buildHeader(),
        ..._buildFAQList(),
      ],
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'How can we help you?',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Find answers to frequently asked questions below',
            style: TextStyle(color: Colors.white70, fontSize: 16),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildFAQList() {
    return faqItems.map((item) => _buildFAQItem(item)).toList();
  }

  Widget _buildFAQItem(Map<String, String> item) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        title: Text(
          item['question']!,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black87,
            fontSize: 16,
          ),
        ),
        iconColor: primaryColor,
        collapsedIconColor: primaryColor,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Text(
              item['answer']!,
              style: const TextStyle(color: Colors.black54, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
