import 'package:rive/rive.dart';

class RiveUtils {
  static StateMachineController getRiveController(
    Artboard artBoard, {
    stateMachineName = "State Machine 1",
  }) {
    StateMachineController? controller = StateMachineController.fromArtboard(
      artBoard,
      stateMachineName,
    );
    artBoard.addController(controller!);
    return controller;
  }
}
