import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  final List<Widget> bottomButtons;
  final IconButton leftButton;
  final Text centerText;
  final IconButton rightButton;
  const CustomAppbar({
    super.key,
    required this.leftButton,
    required this.centerText,
    required this.rightButton,
    required this.bottomButtons,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2); //2 barras

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      //automaticallyImplyLeading: false, //Remove a flechinha do push
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: Stack(
          alignment: Alignment.center,
          children: [widget.leftButton],
        ),
      ),
      title: widget.centerText,
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Stack(
            alignment: Alignment.center,
            children: [widget.rightButton],
          ),
        ),
      ],
      bottom: AppBar(
        //automaticallyImplyLeading: false, //Remove a flechinha do push
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        flexibleSpace: Row(children: widget.bottomButtons),
      ),
    );
  }
}
