import 'package:flutter/material.dart';
import 'package:meep_todo/model/importance.dart';

typedef OnChoicePressed = Function(Importance);

class ImportanceChoices extends StatefulWidget {
  final OnChoicePressed? onChoicePressed;

  const ImportanceChoices({
    super.key,
    this.onChoicePressed,
  });

  @override
  State<ImportanceChoices> createState() => _ImportanceChoicesState();
}

class _ImportanceChoicesState extends State<ImportanceChoices> {
  Importance selection = Importance.none;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Importance>(
      segments: <ButtonSegment<Importance>>[
        ...Importance.values.map(
          (e) => ButtonSegment<Importance>(value: e, label: Text(e.name)),
        ),
      ],
      showSelectedIcon: false,
      selected: <Importance>{selection},
      onSelectionChanged: (Set<Importance> newSelection) {
        setState(() {
          selection = newSelection.first;
        });
        widget.onChoicePressed?.call(newSelection.first);
      },
      multiSelectionEnabled: false,
    );
  }
}
