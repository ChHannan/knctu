import 'package:knctu/icons/knctu_icons.dart';
import 'package:knctu/widgets/Drawer/drawer_action.dart';

const drawerItems = [
  DrawerAction(actionIcon: KnctUIcon.home, actionText: 'Home', size: 33.0),
  DrawerAction(
    actionIcon: KnctUIcon.chat,
    actionText: 'Message',
  ),
  DrawerAction(
    actionIcon: KnctUIcon.trending_2,
    actionText: 'Feed',
  ),
  DrawerAction(
    actionIcon: KnctUIcon.questions,
    actionText: 'Questions',
  ),
  DrawerAction(
    actionIcon: KnctUIcon.add_question,
    actionText: 'Add',
  ),
];
