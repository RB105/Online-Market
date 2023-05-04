import 'package:changelang/core/widgets/body_list_builder.dart';
import 'package:changelang/data/mog_data.dart';
import 'package:flutter/material.dart';

class WearablesWidget extends StatelessWidget {
  const WearablesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BodyListBuilder(list: MogData.wearablesList);
  }
}