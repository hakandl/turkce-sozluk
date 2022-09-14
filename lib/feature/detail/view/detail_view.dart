import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:turkce_sozluk/product/widgets/button/icon_text_button.dart';
import 'package:turkce_sozluk/product/widgets/button/material_button.dart';
import 'package:turkce_sozluk/product/widgets/svg.dart';

import '../../../product/widgets/card/detail_word_info_card.dart';

class DetailView extends StatefulWidget {
  const DetailView({super.key});

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: context.paddingNormal,
      children: const [
        DetailTop(),
        DetailWordList(),
      ],
    );
  }
}

class DetailTop extends StatelessWidget {
  const DetailTop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'title',
          style: context.textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
        Text(
          'subtitle',
          style: context.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: context.verticalPaddingMedium,
          child: Row(
            children: [
              TurkceSozlukMaterialButton(
                color: Colors.white,
                child: SvgWidget(
                  icon: IconNameEnum.voice.value,
                  color: Colors.grey,
                ),
                onPressed: () {},
              ),
              context.emptySizedWidthBoxLow3x,
              TurkceSozlukMaterialButton(
                color: Colors.white,
                child: SvgWidget(
                  icon: IconNameEnum.fav.value,
                  color: Colors.grey,
                ),
                onPressed: () {},
              ),
              const Spacer(),
              TurkceSozlukIconTextButton(
                text: 'Türk İşaret Dili',
                textStyle: const TextStyle(color: Colors.grey),
                icon: SvgWidget(
                  icon: IconNameEnum.hand.value,
                  color: Colors.grey,
                ),
                onPressed: () {},
              )
            ],
          ),
        ),
      ],
    );
  }
}

class DetailWordList extends StatelessWidget {
  const DetailWordList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: context.lowBorderRadius,
      child: ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return const DetailWordInfoCard();
        },
        separatorBuilder: (context, index) {
          return Container(color: Colors.white, child: const Divider());
        },
      ),
    );
  }
}
