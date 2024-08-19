import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:task_management/common/utils/constants.dart';
import 'package:task_management/common/widgets/appstyle.dart';
import 'package:task_management/common/widgets/reusable_text.dart';
import 'package:task_management/features/auth/controllers/code_provider.dart';

class TestPage extends ConsumerWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String code = ref.watch(codeStateProvider);
    return Scaffold(
      body: Center(
        child: Column(children: [
          ReusableText(
              text: code,
              style: appStyle(30, AppConst.kLight, FontWeight.bold)),
          TextButton(
              onPressed: () {
                ref
                    .read(codeStateProvider.notifier)
                    .setStart("Hello Test {Page}");
              },
              child: Text("Press Me")),
        ]),
      ),
    );
  }
}
