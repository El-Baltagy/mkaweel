part of '../main_home_screen.dart';

class _HomeWorker extends StatelessWidget {
  const _HomeWorker({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: [SettingsRoute(args: .new(BaseTypeWorker.instance))],
    );
  }
}
