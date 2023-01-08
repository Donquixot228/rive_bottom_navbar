import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import '/resources/app_colors.dart';
import '/utils/rive_utils.dart';
import '/components/animated_bar.dart';
import '/models/rive_asset.dart';

class EntryPoint extends StatefulWidget {
  const EntryPoint({super.key});

  @override
  State<EntryPoint> createState() => _EntryPointState();
}

class _EntryPointState extends State<EntryPoint> {
  RiveAsset selectedBottomNav = bottomNavItems.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.shadowColorLight,
      extendBody: true,
      body: Container(),
      bottomNavigationBar: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: AppColors.backgroundColor2.withOpacity(0.8),
            borderRadius: const BorderRadius.all(Radius.circular(24)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ...List.generate(
                bottomNavItems.length,
                (index) => GestureDetector(
                  onTap: () {
                    bottomNavItems[index].input!.change(true);
                    if (bottomNavItems[index] != selectedBottomNav) {
                      setState(() {
                        selectedBottomNav = bottomNavItems[index];
                      });
                    }
                    Future.delayed(const Duration(seconds: 1), () {
                      bottomNavItems[index].input!.change(false);
                    });
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AnimatedBar(isActive: bottomNavItems[index] == selectedBottomNav),
                      SizedBox(
                        height: 36,
                        width: 36,
                        child: Opacity(
                          opacity: bottomNavItems[index] == selectedBottomNav ? 1 : 0.5,
                          child: RiveAnimation.asset(
                            bottomNavItems.first.src,
                            artboard: bottomNavItems[index].artBoard,
                            onInit: (artBoard) {
                              StateMachineController controller = RiveUtils.getRiveController(artBoard,
                                  stateMachineName: bottomNavItems[index].stateMachineName);

                              bottomNavItems[index].input = controller.findSMI("active") as SMIBool;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
