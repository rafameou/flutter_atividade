import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 2);

  @override
  State<CustomAppbar> createState() => _CustomAppbarState();
}

class _CustomAppbarState extends State<CustomAppbar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              onPressed: () {},
              icon: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Icon(Icons.people), //Image.asset(""),
              ),
            ),
          ],
        ),
      ),
      title: Text("Foo Bar"),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          child: Stack(
            alignment: Alignment.center,
            children: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
          ),
        ),
      ],
      bottom: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        flexibleSpace: Row(
          children: [
            buildButton("Feed", Icons.feed, true),
            buildButton("Vagas", Icons.work, false),
            buildButton("Alertas", Icons.notifications, false),
          ],
        ),
      ),
    );
  }

  Widget buildButton(String label, IconData icon, bool selected) {
    return Expanded(
      child: TextButton.icon(
        onPressed: () {},
        label: Text(label),
        icon: Icon(icon),
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
