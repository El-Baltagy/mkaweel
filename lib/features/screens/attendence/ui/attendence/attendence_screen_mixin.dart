part of 'attendence_screen.dart';

abstract class AttendencePageBaseState extends State<AttendencePage> {
  late final AttendenceCubit attendenceCubit;

  @override
  void initState() {
    attendenceCubit = AttendenceCubit.get(context: context);
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
