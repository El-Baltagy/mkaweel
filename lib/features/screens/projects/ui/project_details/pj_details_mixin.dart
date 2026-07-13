part of 'project_details_screen.dart';
abstract class ProjectDetailsPageBaseState extends State<ProjectDetailsPage> {
  late final ProjectsCubit projectsCubit;

  @override
  void initState() {
    projectsCubit = widget.args.projectsCubit;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  /// Static phase data — will be replaced with API data in future.
      List<Map<String, String>>  phases = [
    {
      'title': 'Site Preparation',
      'subtitle': 'Site handover, fencing, and temporary utilities se...',
    },
    {
      'title': 'Excavation and Ground Preparation',
      'subtitle': 'Excavation, grading, and soil preparation',
    },
    {
      'title': 'Foundation Works',
      'subtitle': 'Blinding concrete, footings, grade beams, waterpro...',
    },
    {
      'title': 'Concrete Structural Works',
      'subtitle': 'Columns, beams, slabs, and staircases',
    },
    {
      'title': 'Masonry Works',
      'subtitle': 'Internal and external walls and partitions',
    },
    {
      'title': 'Plastering Works',
      'subtitle': 'Internal and external plastering',
    },
    {
      'title': 'Waterproofing Works',
      'subtitle': 'Waterproofing for roofs, bathrooms, and water tank...',
    },
    {
      'title': 'Flooring and Ceiling Works',
      'subtitle': 'Tiles, marble, and suspended ceilings',
    },
  ];
}