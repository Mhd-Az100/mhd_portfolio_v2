import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mhd_portfolio_v2/resources/enums.dart';
import 'package:mhd_portfolio_v2/resources/projects_list.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState.initState());
  AutoScrollController rootScrollTag = AutoScrollController();

  ItemScrollController? projectIndexScrollController;
  ItemPositionsListener? projectIndexPositionsListener;

  Future scrollToIndex(int index) async {
    await projectIndexScrollController?.scrollTo(
        alignment: 0.4,
        curve: Curves.easeIn,
        index: index,
        duration: const Duration(milliseconds: 500));
  }

  selectProjectIndex(int index) {
    scrollToIndex(index);
    emit(state.copyWith(currentIndexProject: index));
  }

  nextProject() {
    if (state.currentIndexProject < MyProjectsList.myProjects.length - 1) {
      emit(state.copyWith(currentIndexProject: state.currentIndexProject + 1));
      scrollToIndex(state.currentIndexProject);
    }
  }

  previousProject() {
    if (state.currentIndexProject > 0) {
      emit(state.copyWith(currentIndexProject: state.currentIndexProject - 1));
      scrollToIndex(state.currentIndexProject);
    }
  }

  isScrollingForward(bool isScrollDown) {
    emit(state.copyWith(scrolldown: isScrollDown));
  }

  //====mobile=====

//=========
  hoverContact(ContactEnum contact) {
    emit(state.copyWith(hoverContact: contact));
  }

  hoverTabs(TabsEnum tab) {
    emit(state.copyWith(hoverTabs: tab));
  }

  hoverResume(bool isHover) {
    emit(state.copyWith(hoverResume: isHover));
  }

  hoverService(bool isHover) {
    emit(state.copyWith(hoverService: isHover));
  }

  isScrollingDown(bool isScrollDown) {
    emit(state.copyWith(scrolldown: isScrollDown));
  }

  Future featchAssets() async {}
}
