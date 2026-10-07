import 'package:flutter/material.dart';

class ResponsePage extends StatelessWidget {
  final bool isNear;

  const ResponsePage({
    super.key,
    required this.isNear,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.vibration),
              title: const Text(
                'Aktuator: Motor Getar',
              ),
              subtitle: Text(
                isNear
                    ? 'TRIGGER: Vibrator Bergetar (300ms)'
                    : 'TRIGGER: Motor Idle',
                style: TextStyle(
                  color: isNear ? Colors.red : Colors.grey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
