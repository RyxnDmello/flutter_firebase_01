import 'package:fl_chart/fl_chart.dart';

import '../../../../models/collection_model.dart';

void touchCallBack({
  required void Function({required CollectionModel collection}) onTapSection,
  required List<CollectionModel> collections,
  required PieTouchResponse? response,
}) {
  if (response == null) return;

  int touchedSectionIndex = response.touchedSection!.touchedSectionIndex;
  if (touchedSectionIndex == -1) return;

  onTapSection(
    collection: collections.elementAt(
      touchedSectionIndex,
    ),
  );
}
