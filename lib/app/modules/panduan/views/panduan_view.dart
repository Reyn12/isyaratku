import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/panduan_controller.dart';

class PanduanView extends GetView<PanduanController> {
  const PanduanView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PanduanView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PanduanView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
