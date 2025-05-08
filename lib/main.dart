import 'package:api_session/views/all_products_page.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const SimpleEcommerceApp(),
    ),
  );
}

class SimpleEcommerceApp extends StatelessWidget {
  const SimpleEcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AllProductsPage(),
    );
  }
}
