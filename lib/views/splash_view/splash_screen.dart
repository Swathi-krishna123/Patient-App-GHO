import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:global_health_opinion_sample/controller.dart/app_controller.dart';
import 'package:local_auth/local_auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AppController controller = Get.put(AppController());

  final localAuthentication = LocalAuthentication();

  @override
  void initState() {
    super.initState();
    controller.splashcheck(localAuthentication);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xFF014AAD,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              height: MediaQuery.of(context).size.height / 3,
              child: Image.asset(
                "assets/images/gho_logo-CAevCtDl.png",
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
