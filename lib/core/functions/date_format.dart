import 'package:intl/intl.dart';

String formattedCreatedAt(DateTime createdAt) {
  final DateFormat formatter = DateFormat('yyyy-MM-dd');
  return formatter.format(createdAt);
}
