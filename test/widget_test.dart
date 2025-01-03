// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:intl/intl.dart';


void main() {
//   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
//     // Build our app and trigger a frame.
//     await tester.pumpWidget(const SumangalamApp());

//     // Verify that our counter starts at 0.
//     expect(find.text('0'), findsOneWidget);
//     expect(find.text('1'), findsNothing);

//     // Tap the '+' icon and trigger a frame.
//     await tester.tap(find.byIcon(Icons.add));
//     await tester.pump();

//     // Verify that our counter has incremented.
//     expect(find.text('0'), findsNothing);
//     expect(find.text('1'), findsOneWidget);
//   });

String inputDate = "10-12-2024 15:45:30";

 DateTime dateTime = DateFormat("dd-MM-yyyy HH:mm:ss").parse(inputDate);

 String formattedDate = DateFormat("dd-MM-yyyy").format(dateTime); // To Format the date using this format "dd-MM-yyyy"
 print(formattedDate);
 String formattedTime = DateFormat("HH:mm:ss").format(dateTime); // To Format the time using this format "HH:mm:ss"
 print(formattedTime);

}
