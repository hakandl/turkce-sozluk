import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../constants/enums/size_enum.dart';

class DetailWordInfoCard extends StatelessWidget {
  const DetailWordInfoCard({
    Key? key,
    required this.meaningOrder,
    required this.featuresName,
    required this.meaning,
    required this.exampleName,
    required this.authorName,
  }) : super(key: key);
  final String meaningOrder;
  final String featuresName;
  final String meaning;
  final String exampleName;
  final String authorName;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: context.colorScheme.primary,
      child: SizedBox(
        width: context.dynamicWidth(SizeEnum.one.value),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: context.paddingNormal,
              child: Row(
                children: [
                  Padding(
                    padding: context.onlyRightPaddingLow,
                    child: Text(
                      meaningOrder,
                      style: context.textTheme.bodyMedium?.copyWith(
                        color: context.colorScheme.onSecondary,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    featuresName,
                    style: context.textTheme.bodySmall?.copyWith(
                      color: context.colorScheme.onSecondary,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: context.paddingNormal.left,
                right: context.paddingNormal.right,
                bottom: context.paddingLow.bottom,
              ),
              child: Text(
                meaning,
                style: context.textTheme.bodyMedium?.copyWith(
                  color: context.colorScheme.background,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: context.paddingMedium.left,
                right: context.paddingMedium.right,
                bottom: context.paddingLow.bottom,
              ),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: context.colorScheme.onSecondary,
                    fontWeight: FontWeight.w500,
                  ),
                  children: [
                    TextSpan(text: exampleName),
                    TextSpan(text: authorName, style: const TextStyle(fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
