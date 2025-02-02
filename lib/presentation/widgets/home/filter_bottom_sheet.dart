import 'dart:math';

import 'package:college_cupid/functions/helpers.dart';
import 'package:college_cupid/presentation/widgets/global/cupid_button.dart';
import 'package:college_cupid/presentation/widgets/global/custom_drop_down.dart';
import 'package:college_cupid/presentation/widgets/home/selection_button.dart';
import 'package:college_cupid/shared/colors.dart';
import 'package:college_cupid/shared/enums.dart';
import 'package:college_cupid/shared/styles.dart';
import 'package:college_cupid/stores/filter_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  List<Program> programs = Program.values;
  Map<String, int?> yearOfJoinMap = getYearOfJoinMap();

  final dropDownIcon = Transform.rotate(
    angle: pi / 2,
    child: const Icon(
      Icons.arrow_forward_ios_rounded,
      color: Colors.grey,
      size: 14,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final filterStore = context.read<FilterStore>();

    return Observer(builder: (_) {
      return Container(
        padding: const EdgeInsets.all(16).copyWith(
          top: 0,
          bottom: 32,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 5),
            Center(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(3),
                ),
                child: const SizedBox(width: 40, height: 3),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  const Center(
                    child: Text('Filters', style: CupidStyles.headingStyle),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: GestureDetector(
                      onTap: () {
                        filterStore.clearFilters();
                      },
                      child: Text(
                        "Clear",
                        style: CupidStyles.headingStyle.copyWith(
                          color: CupidColors.pinkColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Interested in',
              style: CupidStyles.normalTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                SelectionButton(
                  onTap: () {
                    filterStore.setInterestedInGender(InterestedInGender.girls);
                  },
                  label: InterestedInGender.girls.displayString,
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(15),
                  ),
                  isSelected: filterStore.interestedInGender == InterestedInGender.girls,
                ),
                SelectionButton(
                  onTap: () {
                    filterStore.setInterestedInGender(InterestedInGender.boys);
                  },
                  label: InterestedInGender.boys.displayString,
                  borderRadius: const BorderRadius.all(Radius.zero),
                  isSelected: filterStore.interestedInGender == InterestedInGender.boys,
                ),
                SelectionButton(
                  onTap: () {
                    filterStore.setInterestedInGender(InterestedInGender.both);
                  },
                  label: InterestedInGender.both.displayString,
                  borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(15),
                  ),
                  isSelected: filterStore.interestedInGender == InterestedInGender.both,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                CustomDropDown(
                  items: programs.map((e) => e.displayString).toList(),
                  label: 'Programs',
                  value: filterStore.program.displayString,
                  onChanged: (selectedProgram) {
                    filterStore.setProgram(
                        Program.values.firstWhere((p) => p.displayString == selectedProgram));
                  },
                  icon: dropDownIcon,
                ),
                const SizedBox(width: 12),
                CustomDropDown(
                  items: yearOfJoinMap.keys
                      .toList()
                      .sublist(0, (filterStore.program.numberOfYears ?? 4) + 2),
                  label: "Year of join",
                  value: yearOfJoinMap.keys
                      .firstWhere((key) => yearOfJoinMap[key] == filterStore.yearOfJoin),
                  onChanged: (selectedYear) {
                    filterStore.setYearOfJoin(yearOfJoinMap[selectedYear]);
                  },
                  icon: dropDownIcon,
                ),
              ],
            ),
            const SizedBox(height: 16),
            CupidButton(
              text: "Apply",
              onTap: () {
                Navigator.pop(context);
              },
              backgroundColor: CupidColors.pinkColor,
            )
          ],
        ),
      );
    });
  }
}
