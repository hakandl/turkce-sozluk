import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:provider/provider.dart';
import 'package:turkce_sozluk/feature/detail/compound/service/compound_service.dart';
import 'package:turkce_sozluk/feature/detail/compound/viewmodel/compound_viewmodel.dart';
import 'package:turkce_sozluk/product/service/project_network_manager.dart';
import 'package:turkce_sozluk/product/widgets/shimmer/detail_top_view_shimmer.dart';

import '../../../../product/widgets/button/icon_button.dart';
import '../../../../product/widgets/card/detail_word_card.dart';
import '../../../../product/widgets/list_view/sign_language_list_view.dart';
import '../../../../product/widgets/shimmer/proverb_and_compound_card_list_shimmer.dart';
import '../../../../product/widgets/svg.dart';
import '../../view/detail_view.dart';
import '../../view/tabbar/detail_tabbar_view.dart';
import '../../viewmodel/detail_viewmodel.dart';

class CompoundDetailView extends StatefulWidget {
  const CompoundDetailView({super.key});

  @override
  State<CompoundDetailView> createState() => _CompoundDetailViewState();
}

class _CompoundDetailViewState extends State<CompoundDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: ChangeNotifierProvider.value(
        value: CompoundViewModel(CompoundService(ProjectNetworkManager.instance.service)),
        builder: (context, child) {
          return Padding(
            padding: context.paddingNormal,
            child: Column(
              children: [
                _detailTop(context),
                _compoundDetailWord(context),
              ],
            ),
          );
        },
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      leading: TurkceSozlukIconButton(
        onPressed: () => Navigator.pop(context),
        child: SvgWidget(
          icon: IconNameEnum.left.value,
          color: context.colorScheme.background,
        ),
      ),
      title: Text(TabBarPageEnum.compound.name),
    );
  }

  _detailTop(BuildContext context) {
    return context.watch<CompoundViewModel>().isLoading
        ? const DetailTopViewShimmer()
        : DetailTop(
            title: context.watch<CompoundViewModel>().detailList?[0].word ?? '',
            subtitle:
                '${context.watch<CompoundViewModel>().detailList?[0].pronunciation ?? ''} ${context.watch<CompoundViewModel>().detailList?[0].language ?? ''}',
            onPressed: () => context.read<DetailViewModel>().speak(CompoundViewModel.word ?? ''),
            handWidget: SignLanguageListView(
              itemCount: context.read<CompoundViewModel>().detailList?[0].word?.length ?? 1,
              word: context.read<CompoundViewModel>().detailList?[0].word ?? '',
            ),
          );
  }

  _compoundDetailWord(BuildContext context) {
    return context.watch<CompoundViewModel>().isLoading
        ? const ProverbAndCompoundCardListShimmer()
        : DetailWordCard(
            text: context.watch<CompoundViewModel>().detailList?[0].meaningsList?[0].meaning ?? '', isRight: false);
  }
}
