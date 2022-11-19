import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toeic/ui_kits/colors.dart';
import 'package:toeic/utils/utils.dart';

import '../../ui_kits/styles.dart';
import 'list_test_page.dart';

class PracticePage extends StatefulWidget {
  const PracticePage({Key? key}) : super(key: key);

  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {

  Widget _buildItem({required PartItem partItem, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      highlightColor: lightBlueColor,
      child: Container(
        height: 168,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(width: 2, color: lightTextColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                partItem.imagePath,
                width: 56,
                height: 56,
              ),
              const SizedBox(height: 6),
              Text(
                partItem.part,
                style: GoogleFonts.openSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  wordSpacing: 1.33,
                ),
              ),
              Text(
                partItem.description,
                style: GoogleFonts.openSans(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  wordSpacing: 1.33,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            Text(
              "Luyện nghe",
              textAlign: TextAlign.left,
              style: textTitleStyle.copyWith(
                  fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: _buildItem(
                    partItem: parts[0],
                    onTap: (){
                      Navigator.of(context).push(
                        ListTestPage.route(1),
                      );
                    }
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: _buildItem(
                    partItem: parts[1],
                    onTap: () => {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildItem(
                    partItem: parts[2],
                    onTap: () =>{},
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildItem(
                    partItem: parts[3],
                    onTap: () => {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              "Luyện đọc",
              textAlign: TextAlign.left,
              style: textTitleStyle.copyWith(
                  fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildItem(
                    partItem: parts[4],
                    onTap: () => {},
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildItem(
                    partItem: parts[5],
                    onTap: () => {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _buildItem(
                    partItem: parts[6],
                    onTap: () => {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}

class PartItem {
  final String imagePath;
  final String part;
  final String description;

  PartItem(
      {required this.imagePath, required this.part, required this.description});
}
