import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class PdfScreen extends StatelessWidget {
  final String path;
  const PdfScreen({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PDFView(
          filePath: path,
          
        ),
      ),
    );
  }
}
