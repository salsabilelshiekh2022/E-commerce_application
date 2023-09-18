import 'package:flutter/material.dart';

import '../constants.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton({super.key});

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool light = true;

  @override
  Widget build(BuildContext context) {
    final MaterialStateProperty<Color?> trackColor =
        MaterialStateProperty.all(Colors.grey[300]);
    final MaterialStateProperty<Color?> overlayColor =
        MaterialStateProperty.resolveWith<Color?>(
      (Set<MaterialState> states) {
        // Material color when switch is selected.
        if (states.contains(MaterialState.selected)) {
          return success;
        }
        // Material color when switch is disabled.
        if (states.contains(MaterialState.disabled)) {
          return grey;
        }
        // Otherwise return null to set default material color
        // for remaining states such as when the switch is
        // hovered, or focused.
        return null;
      },
    );

    return Switch(
      value: light,
      overlayColor: overlayColor,
      trackColor: trackColor,
      thumbColor: MaterialStateProperty.resolveWith<Color?>(
        (Set<MaterialState> states) {
          // Material color when switch is selected.
          if (states.contains(MaterialState.selected)) {
            return success;
          }
          // Material color when switch is disabled.
          if (states.contains(MaterialState.disabled)) {
            return white;
          }
          // Otherwise return null to set default material color
          // for remaining states such as when the switch is
          // hovered, or focused.
          return null;
        },
      ),
      onChanged: (bool value) {
        // This is called when the user toggles the switch.
        setState(() {
          light = value;
        });
      },
    );
  }
}
