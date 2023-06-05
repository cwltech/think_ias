import "package:flutter/material.dart";

class MyPdfPage extends StatefulWidget {
  const MyPdfPage({super.key});

  @override
  State<MyPdfPage> createState() => _MyPdfPageState();
}

class _MyPdfPageState extends State<MyPdfPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Documents'),
      ),
      // body: Padding(
      //   padding: const EdgeInsets.all(15.0),
      //   child: SfPdfViewer.network(
      //       'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf'),
      // ),
    );
  }
}
