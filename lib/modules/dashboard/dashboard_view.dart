import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:get/get.dart';
import 'package:hitung_jendong/modules/incre_decre/incre_decre_view.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text("Jendong Math"),
      ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.blue,
                  Colors.blue,
                  Colors.blue[200]!,
                  Colors.blue[200]!,
                ],
              ),
            ),
          ),
          GridView(
            padding: const EdgeInsets.all(30),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
            children: [
              Bounce(
                duration: const Duration(milliseconds: 100),
                onPressed: () {
                  Get.to(
                    () => const IncreDecreView(
                      isIncre: true,
                    ),
                  );
                },
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.add_rounded,
                        size: 50,
                      ),
                      Text("Pertambahan"),
                    ],
                  ),
                ),
              ),
              Bounce(
                duration: const Duration(milliseconds: 100),
                onPressed: () {
                  Get.to(
                    () => const IncreDecreView(
                      isIncre: false,
                    ),
                  );
                },
                child: Card(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.remove_rounded,
                        size: 50,
                      ),
                      Text("Pengurangan"),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
