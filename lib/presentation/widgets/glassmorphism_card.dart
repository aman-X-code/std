import 'package:flutter/material.dart';
import 'dart:ui';

class GlassmorphismCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final double borderRadius;
  final double blur;
  final double opacity;

  const GlassmorphismCard({
    super.key,
    required this.child,
    this.onTap,
    this.borderRadius = 20,
    this.blur = 10,
    this.opacity = 0.1,
  });

  @override
  State<GlassmorphismCard> createState() => _GlassmorphismCardState();
}

class _GlassmorphismCardState extends State<GlassmorphismCard>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.onTap != null ? (_) => setState(() => _isPressed = true) : null,
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        transform: Matrix4.identity()
          ..scale(_isPressed ? 0.98 : 1.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: widget.blur, sigmaY: widget.blur),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(widget.opacity),
                borderRadius: BorderRadius.circular(widget.borderRadius),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}