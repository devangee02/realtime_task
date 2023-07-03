// import '../../../../res/import/import.dart';
//
// class EmployeeList extends StatelessWidget {
//   const EmployeeList({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final config = SizeConfig();
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 15),
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: Row(
//               children: [
//                 Text(
//                   'Current employees',
//                   style: TextStyle(
//                       fontSize: config.sp(16),
//                       color: realtimetaskPrimaryColor,
//                       fontWeight: FontWeight.w500),
//                 ),
//               ],
//             ),
//           ),
//           YMargin(20),
//           Flexible(
//             child: ListView.builder(
//                 itemCount: 4,
//                 itemBuilder: (ctx, index) {
//                   return Dismissible(
//                     // Specify the direction to swipe and delete
//                     direction: DismissDirection.endToStart,
//                     key: Key('item.Title'),
//                     onDismissed: (direction) {
//                       // // Removes that item the list on swipwe
//                       // setState(() {
//                       //   Dismissabletabs.removeAt(index);
//                       // });
//                       // // Shows the information on Snackbar
//                       // SnackbarUtil.showSuccessSnackbar(
//                       //     title: 'Deletion Successful',
//                       //     message: '${item.Title} dismissed');
//                     },
//                     background: Container(color: realtimetaskDarkSellColor),
//                     child: EmployeeListWidget(context),
//                   );
//                 }),
//           ),
//           YMargin(20),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 15),
//             child: Row(
//               children: [
//                 Text(
//                   'Previous employees',
//                   style: TextStyle(
//                       fontSize: config.sp(16),
//                       color: realtimetaskPrimaryColor,
//                       fontWeight: FontWeight.w500),
//                 ),
//               ],
//             ),
//           ),
//           YMargin(20),
//           Flexible(
//             child: ListView.builder(
//                 itemCount: 4,
//                 shrinkWrap: true,
//                 itemBuilder: (ctx, index) {
//                   return Dismissible(
//                     // Specify the direction to swipe and delete
//                     direction: DismissDirection.endToStart,
//                     key: Key('item.Title'),
//                     onDismissed: (direction) {
//                       // // Removes that item the list on swipwe
//                       // setState(() {
//                       //   Dismissabletabs.removeAt(index);
//                       // });
//                       // // Shows the information on Snackbar
//                       // SnackbarUtil.showSuccessSnackbar(
//                       //     title: 'Deletion Successful',
//                       //     message: '${item.Title} dismissed');
//                     },
//                     background: Container(color: realtimetaskDarkSellColor),
//                     child: EmployeeListWidget(context,duration:,employeeName: ,job: ,),
//                   );
//                 }),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
