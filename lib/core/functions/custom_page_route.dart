import 'package:flutter/material.dart';

enum TransitionType {
  fade,
  slideFromRight,
  slideFromLeft,
  slideFromBottom,
  zoomInZoomOut,
  scale,
  rotation,
}

class CustomPageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;
  final TransitionType transitionType;
  final Duration duration;

  CustomPageRoute({
    required this.page,
    this.transitionType = TransitionType.fade,
    this.duration = const Duration(milliseconds: 400),
  }) : super(
         pageBuilder: (context, animation, secondaryAnimation) => page,
         transitionDuration: duration,
         transitionsBuilder: (context, animation, secondaryAnimation, child) {
           switch (transitionType) {
             case TransitionType.slideFromRight:
               return SlideTransition(
                 position: Tween<Offset>(
                   begin: const Offset(1.0, 0.0),
                   end: Offset.zero,
                 ).animate(animation),
                 child: child,
               );
             case TransitionType.slideFromLeft:
               return SlideTransition(
                 position: Tween<Offset>(
                   begin: const Offset(-1.0, 0.0),
                   end: Offset.zero,
                 ).animate(animation),
                 child: child,
               );
             case TransitionType.slideFromBottom:
               return SlideTransition(
                 position: Tween<Offset>(
                   begin: const Offset(0.0, 1.0),
                   end: Offset.zero,
                 ).animate(animation),
                 child: child,
               );
             case TransitionType.zoomInZoomOut:
               return FadeTransition(
                 opacity: animation,
                 child: ScaleTransition(
                   scale: Tween<double>(begin: 0.7, end: 1.0).animate(
                     CurvedAnimation(parent: animation, curve: Curves.easeOut),
                   ),
                   child: child,
                 ),
               );
             case TransitionType.scale:
               return ScaleTransition(scale: animation, child: child);
             case TransitionType.rotation:
               return RotationTransition(turns: animation, child: child);
             case TransitionType.fade:
               return FadeTransition(opacity: animation, child: child);
           }
         },
       );
}
