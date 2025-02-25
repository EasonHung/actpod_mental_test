import 'package:flutter_riverpod/flutter_riverpod.dart';

final questionNumProvider = StateProvider.autoDispose<int>((ref) => 0);
