import 'package:flutter/material.dart';

class CustomLoader {
  static OverlayEntry? _overlayEntry;

  static void show(BuildContext context, {double size = 120}) {
    if (_overlayEntry != null) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _overlayEntry = OverlayEntry(
        builder: (_) => Stack(
          children: [
            ModalBarrier(
              dismissible: false,
              color: Colors.black.withOpacity(0.4),
            ),
            Center(
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.9, end: 1.1),
                duration: const Duration(milliseconds: 800),
                curve: Curves.easeInOut,
                builder: (context, scale, child) {
                  return Transform.scale(
                    scale: scale,
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      );

      Overlay.of(context).insert(_overlayEntry!);
    });
  }

  static void hide() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }
}
