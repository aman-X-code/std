import 'package:flutter/material.dart';

class MultimediaItem extends StatefulWidget {
  final String title;
  final String uploader;
  final String time;
  final String type;
  final IconData icon;
  final VoidCallback onTap;
  final VoidCallback onDownload;

  const MultimediaItem({
    super.key,
    required this.title,
    required this.uploader,
    required this.time,
    required this.type,
    required this.icon,
    required this.onTap,
    required this.onDownload,
  });

  @override
  State<MultimediaItem> createState() => _MultimediaItemState();
}

class _MultimediaItemState extends State<MultimediaItem> {
  bool _isPressed = false;

  Color _getTypeColor() {
    switch (widget.type) {
      case 'video':
        return Colors.red;
      case 'image':
        return Colors.blue;
      case 'document':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      onTapCancel: () => setState(() => _isPressed = false),
      onTap: widget.onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.only(bottom: 12),
        transform: Matrix4.identity()
          ..scale(_isPressed ? 0.98 : 1.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // File type icon
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: _getTypeColor().withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  widget.icon,
                  color: _getTypeColor(),
                  size: 24,
                ),
              ),

              const SizedBox(width: 16),

              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          widget.uploader,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          ' • ${widget.time}',
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Download button
              IconButton(
                onPressed: widget.onDownload,
                icon: const Icon(Icons.download_rounded),
                style: IconButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  foregroundColor: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}