// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'main_cubit.dart';

@immutable
class MainState extends Equatable {
  const MainState({
    required this.scrollDown,
    required this.hoverResume,
    required this.hoverContact,
    required this.currentIndexProject,
    required this.hoverTabs,
    required this.currentIndexTab,
  });
  final bool scrollDown;
  final bool hoverResume;
  final ContactEnum hoverContact;
  final int currentIndexProject;
  final int currentIndexTab;
  final TabsEnum hoverTabs;

  factory MainState.initState() {
    return const MainState(
      scrollDown: false,
      hoverResume: false,
      hoverContact: ContactEnum.none,
      hoverTabs: TabsEnum.none,
      currentIndexProject: 0,
      currentIndexTab: 0,
    );
  }

  @override
  List<Object> get props => [
        scrollDown,
        hoverResume,
        hoverContact,
        currentIndexTab,
        currentIndexProject,
        hoverTabs,
      ];

  MainState copyWith({
    bool? scrolldown,
    bool? hoverResume,
    ContactEnum? hoverContact,
    TabsEnum? hoverTabs,
    int? currentIndexProject,
    int? currentIndexTab,
  }) {
    return MainState(
      scrollDown: scrolldown ?? scrollDown,
      hoverTabs: hoverTabs ?? this.hoverTabs,
      hoverResume: hoverResume ?? this.hoverResume,
      hoverContact: hoverContact ?? this.hoverContact,
      currentIndexProject: currentIndexProject ?? this.currentIndexProject,
      currentIndexTab: currentIndexTab ?? this.currentIndexTab,
    );
  }
}
