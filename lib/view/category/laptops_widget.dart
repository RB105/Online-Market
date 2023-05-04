import 'package:changelang/core/widgets/body_list_builder.dart';
import 'package:changelang/data/mog_data.dart';
import 'package:flutter/material.dart';

class LaptopsWidget extends StatelessWidget {
  const LaptopsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BodyListBuilder(list: MogData.laptopsList);
  }
}