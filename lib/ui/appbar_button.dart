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
          /*backgroundColor:
              (!selected
                  ? Theme.of(context).colorScheme.inversePrimary
                  : Theme.of(context).colorScheme.inverseSurface),
          textStyle: TextStyle(
            color:
                (!selected
                    ? Theme.of(context).colorScheme.inverseSurface
                    : Theme.of(context).colorScheme.surfaceBright),
          ),
          iconColor:
              (!selected
                  ? Theme.of(context).colorScheme.inverseSurface
                  : Theme.of(context).colorScheme.surfaceBright),*/
        ),
      ),
    );
  }
}
