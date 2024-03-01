import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

@RoutePage()
class PdfViewScreen extends StatelessWidget {
  const PdfViewScreen({
    super.key,
    required this.path,
    this.isNetwork = false,
    this.title = '',
  });
  final String path;
  final bool isNetwork;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: isNetwork
            ? const PDF().cachedFromUrl(path)
            : const PDF().fromPath(path),
      ),
    );
  }
}
