import 'package:flutter/material.dart';

class MyAppbarFooter extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangedTab;
  const MyAppbarFooter(
      {Key? key, required this.index, required this.onChangedTab})
      : super(key: key);

  @override
  _MyAppbarFooterState createState() => _MyAppbarFooterState();
}

class _MyAppbarFooterState extends State<MyAppbarFooter> {
  @override
  Widget build(BuildContext context) {
    const placeholder = Opacity(
      opacity: 0,
      child: IconButton(icon: Icon(Icons.no_cell), onPressed: null),
    );

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildTabItem(index: 0, icon: const Icon(Icons.home)),
          buildTabItem(index: 1, icon: const Icon(Icons.mail_outline)),
          buildTabItem(index: 2, icon: const Icon(Icons.support)),
          buildTabItem(index: 3, icon: const Icon(Icons.settings)),
        ],
      ),
    );
  }

  Widget buildTabItem({required int index, required Icon icon}) {
    final isSelected = index == widget.index;
    return IconTheme(
        data: IconThemeData(color: isSelected ? Colors.red : Colors.blue),
        child: IconButton(
          icon: icon,
          onPressed: () => widget.onChangedTab(index),
        ));
  }
}
