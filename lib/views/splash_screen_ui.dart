import 'package:flutter/material.dart';
import 'package:flutter_iot_cake_fast_app/views/cake_shop_list_ui.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const CakeShopListUi()),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg_welcome.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 100),
              
              // --- ส่วนที่แก้ไข: ร้านเค้กมหัศจรรย์ (มีขอบสี) ---
              Stack(
                children: [
                  Text(
                    'ร้านเค้กมหัศจรรย์',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 4 // ความหนาของขอบ
                        ..color = const Color.fromARGB(255, 121, 28, 62), // สีของขอบ (ชมพูเข้ม/น้ำตาล)
                    ),
                  ),
                  const Text(
                    'ร้านเค้กมหัศจรรย์',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // สีตัวอักษรด้านใน
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 5),

              // --- ส่วนที่แก้ไข: CAKE CALL FAST (มีขอบสีขาว) ---
              Stack(
                children: [
                  Text(
                    'CAKE CALL FAST',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 3
                        ..color = Colors.white, // ขอบสีขาวช่วยให้สีแดงเด่นขึ้น
                    ),
                  ),
                  const Text(
                    'CAKE CALL FAST',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 238, 0, 0), // ปรับเป็นแดงสดขึ้น
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 25), // เพิ่มระยะห่างอีกนิด
              const CircularProgressIndicator(
                color: Color.fromARGB(255, 51, 61, 67),
              ),
            ],
          ),
        ),
      ),
    );
  }
}