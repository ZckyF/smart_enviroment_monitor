import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final bool isMonitoring;
  final bool isNear;

  const ResultPage({
    super.key,
    required this.isMonitoring,
    required this.isNear,
  });

  String get _environmentStatus {
    if (!isMonitoring) {
      return 'Status Tidak Tersedia';
    }

    if (isNear) {
      return 'Objek Terdeteksi di Dekat Sensor';
    }

    return 'Tidak Ada Objek Terdeteksi';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  const Text(
                    'Hasil Analisis Kondisi Lingkungan',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    _environmentStatus,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B4D3E),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
