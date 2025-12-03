import 'package:flutter/material.dart';

// Class ini bisa dipanggil berulang kali
class SmoothRoute extends PageRouteBuilder {
  final Widget page;

  SmoothRoute({required this.page})
      : super(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // Koordinat (1.0, 0.0) artinya slide dari KANAN ke KIRI
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;

      // Curve ini yang bikin "Tidak Kaku" (mulai pelan, cepat di tengah, berhenti pelan)
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 500), // Durasi 0.5 detik
  );
}