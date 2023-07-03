import '../import/import.dart';

_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

// formatCurrency(dynamic value) {
//   NumberFormat("#,##0.00", "en_US").format(value);
// }

String convertToAgo(DateTime input) {
  Duration diff = DateTime.now().difference(input);
  return '${diff.inDays}';
}

class ParserService {
  static num parseMoneyToNum(String money) {
    return num.tryParse(money.replaceAll(',', '')) ?? 0;
  }

// static String formatToMoney(num amount,
//     {String? currency,
//     required BuildContext context,
//     compact = true,
//     bool getSymbolFromCurrency = false}) {
//   String? currencyTo = context
//       .read(authProvider)
//       .fetchUserResponse
//       .data
//       .wallet
//       ?.balance
//       ?.currency;
//   MoneyFormatter fmf = MoneyFormatter(
//       amount: amount.toDouble(),
//       settings: MoneyFormatterSettings(
//           thousandSeparator: ',', decimalSeparator: '.'));
//   return '${currencyTo ?? currency}${compact ? fmf.output.compactNonSymbol : fmf.output.nonSymbol}';
// }
}
