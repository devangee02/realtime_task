import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Widget CustomStepper({
//   required List<Step> stepList,
//   required int activeStepIndex,
//   required Function onStepContinue,
//   required Function onStepCancel,
//   required Function onStepTapped,
// }) {
//   return Stepper(
//     elevation: 0,
//     type: StepperType.horizontal,
//     currentStep: activeStepIndex,
//     steps: stepList,
//     onStepContinue: () => onStepContinue,
//     onStepCancel: () => onStepCancel,
//     onStepTapped: (int index) => onStepTapped,
//     controlsBuilder: (context, {onStepContinue, onStepCancel}) {
//       final isLastStep = activeStepIndex == stepList.length - 1;
//       return Container(
//         child: Row(
//           children: [
//             Expanded(
//               child: ElevatedButton(
//                 onPressed: onStepContinue,
//                 style: ElevatedButton.styleFrom(
//                   primary: Zinarihelper.lightPrimary,
//                   padding: EdgeInsets.all(10),
//                   textStyle: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Zinarihelper.lightSecondary),
//                 ),
//                 child: (isLastStep)
//                     ? const Text('Confirm Payment')
//                     : const Text('Continue'),
//               ),
//             ),
//             const SizedBox(
//               width: 10,
//             ),
//             if (activeStepIndex > 0)
//               Expanded(
//                 child: ElevatedButton(
//                   onPressed: onStepCancel,
//                   child: const Text('Cancel'),
//                 ),
//               )
//           ],
//         ),
//       );
//     },
//   );
// }
