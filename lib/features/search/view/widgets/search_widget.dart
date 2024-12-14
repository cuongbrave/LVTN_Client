


import 'package:b2004772/common/models/test_entities.dart';
import 'package:b2004772/common/widgets/test_tile_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/models/course_entities.dart';

class TestSearchWidgets extends ConsumerWidget {
  final List<TestItem> value;
  const TestSearchWidgets({super.key, required this.value});


  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return TestTileWidgets(value: value);
  }
}