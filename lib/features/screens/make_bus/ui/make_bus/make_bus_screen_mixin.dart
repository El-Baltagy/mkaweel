part of 'make_bus_screen.dart';

abstract class MakeBusPageBaseState extends State<MakeBusPage> {
  late final MakeBusCubit makeBusCubit;

  @override
  void initState() {
    makeBusCubit = MakeBusCubit.get(context: context);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
