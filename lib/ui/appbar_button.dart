import 'package:flutter/material.dart';

class CustomAppbarButton extends StatefulWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final void Function() onPressed;

  const CustomAppbarButton({
    super.key,
    required this.label,
    required this.icon,
    required this.selected,
    required this.onPressed,
  });

  @override
  State<CustomAppbarButton> createState() => _CustomAppbarButtonState();
}

class _CustomAppbarButtonState extends State<CustomAppbarButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton.icon(
        onPressed: widget.onPressed,
        label: Text(widget.label),
        icon: Icon(widget.icon),
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size(0, kToolbarHeight),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.zero),
          ),
          backgroundColor:
              (!widget.selected
                  ? Theme.of(context).colorScheme.surfaceContainer
                  : Theme.of(context).colorScheme.surfaceContainerHigh),
        ),
      ),
    );
  }
}
