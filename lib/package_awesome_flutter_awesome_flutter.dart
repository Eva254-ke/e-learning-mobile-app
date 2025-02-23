// C:\Users\Admin\Downloads\Telegram Desktop\machine\e-learning-mobile-app\lib\package_awesome_flutter_awesome_flutter.dart

import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FontAwesomeIconsPage extends StatelessWidget {
  const FontAwesomeIconsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FontAwesome Icons'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const ListTile(
            leading: FaIcon(FontAwesomeIcons.github, color: Colors.black),
            title: Text('GitHub'),
          ),
          const ListTile(
            leading: FaIcon(FontAwesomeIcons.twitter, color: Colors.blue),
            title: Text('Twitter'),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.linkedin, color: Colors.blue[800]),
            title: const Text('LinkedIn'),
          ),
          const ListTile(
            leading: FaIcon(FontAwesomeIcons.youtube, color: Colors.red),
            title: Text('YouTube'),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.facebook, color: Colors.blue[900]),
            title: const Text('Facebook'),
          ),
          const ListTile(
            leading: FaIcon(FontAwesomeIcons.instagram, color: Colors.purple),
            title: Text('Instagram'),
          ),
          const ListTile(
            leading: FaIcon(FontAwesomeIcons.whatsapp, color: Colors.green),
            title: Text('WhatsApp'),
          ),
          const ListTile(
            leading: FaIcon(FontAwesomeIcons.slack, color: Colors.orange),
            title: Text('Slack'),
          ),
          const ListTile(
            leading: FaIcon(FontAwesomeIcons.discord, color: Colors.indigo),
            title: Text('Discord'),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.reddit, color: Colors.orange[800]),
            title: const Text('Reddit'),
          ),
        ],
      ),
    );
  }
}