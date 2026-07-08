import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mkaweel/core/constants/app_locator.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_cubit.dart';
import 'package:mkaweel/features/screens/projects/controller/projects_state.dart';


@RoutePage()
class ProjectDetailsPage extends StatefulWidget implements AutoRouteWrapper{
  const ProjectDetailsPage({super.key, required this.args});
  final ProjectDetailsRouteArgs args;
  // 2. Implement the wrappedRoute method
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<ProjectsCubit>(
      // Use your singleton to get the Cubit instance
      create: (context) =>ProjectsCubit(AppLocator()()()),
      child: this, // 'this' refers to the AuthPage itself
    );
  }
  @override
  State<ProjectDetailsPage> createState() => _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends ProjectDetailsPageBaseState {

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectsCubit, ProjectsState>(
      listener: (context, state) {
        // TODO: implement listener}
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Project Overview'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildOverviewCard(),
              const SizedBox(height: 24),
              const Text(
                'Project Construction Phases',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              _buildPhasesList(),
            ],
          ),
        ),
      ),
    );

  }

  Widget _buildOverviewCard() {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.shade200),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.teal.shade100,
                  child: const Text('d', style: TextStyle(fontSize: 24, color: Colors.teal)),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('dfbf', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text('Owner: bbfbfb', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.monetization_on_outlined, size: 20, color: Colors.teal.shade700),
                const SizedBox(width: 8),
                Text('Contract Value: ', style: TextStyle(color: Colors.grey.shade700)),
                const Text('6,666.00 EUR', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.calendar_today_outlined, size: 20, color: Colors.teal.shade700),
                const SizedBox(width: 8),
                Text('2026-07-07 - 2026-07-07', style: TextStyle(color: Colors.grey.shade700)),
              ],
            ),
            const SizedBox(height: 16),
            const Text('Project Description:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text('vv', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 16),
            const Text('Additional Details:', style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            const Text('vv', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }

  Widget _buildPhasesList() {
    final phases = [
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

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: phases.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final phase = phases[index];
        return Card(
          elevation: 0,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Colors.grey.shade200),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  phase['title']!,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  phase['subtitle']!,
                  style: const TextStyle(color: Colors.grey, fontSize: 13),
                ),
                const Divider(height: 24),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Planned Dates', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        SizedBox(height: 2),
                        Text('2026-07-07 / 2028-07-07', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Actual Dates', style: TextStyle(fontSize: 12, color: Colors.grey)),
                        SizedBox(height: 2),
                        Text('- / -', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Text('Progress', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    const SizedBox(width: 8),
                    Expanded(
                      child: LinearProgressIndicator(
                        value: 0.0,
                        backgroundColor: Colors.grey.shade200,
                        valueColor: const AlwaysStoppedAnimation<Color>(Colors.teal),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text('0%', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                    const SizedBox(width: 16),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text('Pending', style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.remove_red_eye, size: 18),
                    label: const Text('View Updates & Progress'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0D7B7B), // Matching the dark teal button color from web
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}


abstract class  ProjectDetailsPageBaseState extends State<ProjectDetailsPage> {
  final ProjectsCubit argData=ProjectsCubit.get();
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}
