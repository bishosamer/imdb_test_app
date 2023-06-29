import 'package:flutter/material.dart';

class ListExpansionTile extends StatelessWidget {
  final String title;
  final Widget child;
  final bool initiallyExpanded;
  final Function(bool)? onExpansionChanged;
  const ListExpansionTile({
    super.key,
    required this.title,
    required this.child,
    this.onExpansionChanged,
    required this.initiallyExpanded,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: ExpansionTile(
            collapsedBackgroundColor: Colors.white,
            backgroundColor: Colors.white,
            collapsedShape: const RoundedRectangleBorder(),
            title: Text(title),
            onExpansionChanged: onExpansionChanged,
            initiallyExpanded: initiallyExpanded,
            children: [child]),
      ),
    );
  }
}
