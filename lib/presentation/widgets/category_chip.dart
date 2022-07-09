import 'package:blindside_task/presentation/frames/listview_center_frame.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryChip extends StatefulWidget {
  const CategoryChip({Key? key}) : super(key: key);

  @override
  State<CategoryChip> createState() => _CategoryChipState();
}

class _CategoryChipState extends State<CategoryChip> {
  int _activeIndex = 0;

  List<String> chips = [
    'Hot',
    'Funny',
    'Training',
    'Games',
    'Other',
  ];

  _updateChip(int index) {
    setState(() {
      _activeIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: chips.length,
        itemBuilder: (context, index) {
          return ListViewCenterFrame(
            index: index,
            itemDistance: 13,
            child: ActionChip(
              label: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Text(chips[index]),
              ),
              onPressed: () {
                _updateChip(index);
              },
              labelStyle: GoogleFonts.josefinSans(
                fontSize: 17,
                color:
                    index == _activeIndex ? Colors.black : Colors.grey.shade400,
                fontWeight: FontWeight.bold,
              ),
              backgroundColor: index == _activeIndex
                  ? const Color.fromRGBO(246, 198, 152, 1)
                  : const Color.fromRGBO(45, 45, 45, 1),
            ),
          );
        },
      ),
    );
  }
}
