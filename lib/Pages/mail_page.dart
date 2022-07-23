import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class MailPage extends StatefulWidget {
  const MailPage({Key? key}) : super(key: key);

  @override
  State<MailPage> createState() => _MailPageState();
}

class _MailPageState extends State<MailPage> {
  final controlerTo =
      TextEditingController(text: "info@amalgamatetechnologies.com");
  final controllerSubject = TextEditingController();
  final controllerMessage = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: ListView(
          children: [
            Center(
                child: Text(
              "Sugestions",
              style: Theme.of(context).textTheme.headline3,
            )),
            buildTextfield(title: 'To', controller: controlerTo),
            const SizedBox(
              height: 16,
            ),
            buildTextfield(title: 'Subject', controller: controllerSubject),
            const SizedBox(
              height: 16,
            ),
            buildTextfield(
                title: 'Message', controller: controllerMessage, maxLines: 8),
            const SizedBox(
              height: 32,
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: const Text('Send'),
                onPressed: () => launchEmail(
                    toEmail: controlerTo.text,
                    subject: controllerSubject.text,
                    message: controllerMessage.text))
          ],
        ),
      ),
    );
  }

  Widget buildTextfield({
    required String title,
    required TextEditingController controller,
    int maxLines = 1,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 8,
          ),
          TextField(
            controller: controller,
            maxLines: maxLines,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
        ],
      );

  Future launchEmail(
      {required String toEmail,
      required String subject,
      required String message}) async {
    final url =
        'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(message)}';

    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  Future sendEmail({
    required String name,
    required String Email,
    required String subject,
    required String message,
  }) async {
    const serviceId = 'service_17tk10o';
    const templateId = 'template_sbgtp01';
    const userId = 'user_0KWBjSDGXfu0jFZodvM54';

    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    final response = await http.post(
      url,
      headers: {
        'origin': 'http://localhost',
        'Content-Type': 'application/json',
      },
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'user_name': name,
          'user_email': Email,
          'to_email': 'info@amalgamatetechnologies.com',
          'user_subject': subject,
          'user_message': message
        },
      }),
    );
    print(response.body);
  }
}
