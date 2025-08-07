import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final bool isLoading;
  final Duration animationDuration;

  const AnimatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.isLoading = false,
    this.animationDuration = const Duration(milliseconds: 200),
  });

  @override
  State<AnimatedButton> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.onPressed != null ? (_) => setState(() => _isPressed = true) : null,
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedContainer(
        duration: widget.animationDuration,
        curve: Curves.easeInOut,
        transform: Matrix4.identity()
          ..scale(_isPressed ? 0.95 : 1.0),
        child: Container(
          width: double.infinity,
          height: 56,
          decoration: BoxDecoration(
            gradient: widget.onPressed != null
                ? LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primary,
                Theme.of(context).colorScheme.secondary,
              ],
            )
                : null,
            color: widget.onPressed == null
                ? Theme.of(context).colorScheme.onSurface.withOpacity(0.12)
                : null,
            borderRadius: BorderRadius.circular(16),
            boxShadow: widget.onPressed != null && !_isPressed
                ? [
              BoxShadow(
                color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
                blurRadius: 20,
                offset: const Offset(0, 8),
              ),
            ]
                : null,
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: widget.isLoading ? null : widget.onPressed,
              borderRadius: BorderRadius.circular(16),
              child: Center(
                child: widget.isLoading
                    ? const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
                    : DefaultTextStyle(
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: widget.onPressed != null
                        ? Colors.white
                        : Theme.of(context).colorScheme.onSurface.withOpacity(0.38),
                    fontWeight: FontWeight.w600,
                  ),
                  child: widget.child,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}