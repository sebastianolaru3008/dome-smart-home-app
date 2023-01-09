import 'package:dome_smart_home_app/src/features/dashboard/presentation/ui/widgets/panic_scenario_button.dart';
import 'package:flutter/material.dart';

class PanicBottomSheet extends StatelessWidget {
  const PanicBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24.0),
              child: SizedBox(
                width: 64,
                height: 4,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(
                      Radius.circular(2),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 8.0, bottom: 24.0),
              child: Text(
                "Panic systems",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Row(
              children: [
                PanicScenarioButton(
                  title: "Fire",
                  icon: const Icon(
                    Icons.whatshot,
                    color: Colors.deepOrange,
                  ),
                  onTap: () {},
                ),
                PanicScenarioButton(
                  title: "Flood",
                  icon: const Icon(
                    Icons.water_rounded,
                    color: Colors.blue,
                  ),
                  onTap: () {},
                ),
              ],
            ),
            Row(
              children: [
                PanicScenarioButton(
                  title: "Health",
                  icon: const Icon(
                    Icons.monitor_heart,
                    color: Colors.red,
                  ),
                  onTap: () {},
                ),
                PanicScenarioButton(
                  title: "Gas leak",
                  icon: const Icon(
                    Icons.gas_meter,
                    color: Colors.green,
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
