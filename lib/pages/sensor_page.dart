import 'package:flutter/material.dart';

class SensorPage extends StatelessWidget {
  final bool isMonitoring;
  final bool isNear;

  const SensorPage({
    super.key,
    required this.isMonitoring,
    required this.isNear,
  });

  @override
  Widget build(BuildContext context) {
    if (!isMonitoring) {
      return const Center(
        child: Text(
          'Sensor belum diaktifkan.\nTekan Mulai pada halaman Home.',
          textAlign: TextAlign.center,
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Data Raw Sensor (Real-time)',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          Card(
            child: ListTile(
              leading: Icon(
                Icons.sensors,
                color: isNear
                    ? Colors.red
                    : const Color(0xFF1B4D3E),
                size: 36,
              ),
              title: const Text('Proximity Sensor'),
              subtitle: Text(
                isNear
                    ? 'NEAR (Objek Terdeteksi)'
                    : 'FAR (Area Bebas)',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
