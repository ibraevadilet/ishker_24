import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PdfViewScreen extends StatelessWidget {
  const PdfViewScreen({super.key, required this.path, this.isNetwork = false});

  final String path;
  final bool isNetwork;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: isNetwork
            ? const PDF().cachedFromUrl(path)
            : const PDF().fromPath(path),
      ),
    );
  }
}
