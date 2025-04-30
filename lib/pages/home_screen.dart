import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tourch_app/components/bulb_section.dart';
import 'package:tourch_app/components/custom_switch.dart';
import 'package:tourch_app/components/topbar.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            TopBar(),
            Expanded(child: BulbSection()),
            CustomSwitch(),
            // BottomAppBar(),
          ],
        ),
      ),
    );
  }
}
