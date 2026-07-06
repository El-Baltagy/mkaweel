import 'package:flutter/material.dart';
import 'package:mkaweel/core/app/route.dart';
import 'package:mkaweel/core/extension/context.dart';
import 'package:mkaweel/features/screens/create_project/data/model/create_project_res/create_project_res.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, required this.projectInfoData});

  final ProjectInfoData projectInfoData;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).primaryColor;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: primary.withOpacity(.1),
                  child: Icon(Icons.business_center, color: primary),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        projectInfoData.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Owner: ${projectInfoData.owner_name}",
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: .min,
                  children: [
                    GestureDetector(
                      onTap: () =>context.push(  CreateProjectRoute(
                          args:   CreateProjectRouteArgs(
                              "${projectInfoData.id}"
                          )
                      )),
                      child: const Icon(Icons.edit),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(Icons.delete),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// Progress
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Progress",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                Text("${projectInfoData.progress_percentage}%"),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: projectInfoData.progress_percentage / 100,
              borderRadius: BorderRadius.circular(10),
              minHeight: 8,
            ),

            const SizedBox(height: 20),

            /// Dates
            Row(
              children: [
                Expanded(
                  child: _InfoTile(
                    Icons.calendar_today,
                    "Start",
                    projectInfoData.start_date,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _InfoTile(
                    Icons.event,
                    "End",
                    projectInfoData.end_date,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            /// Contract
            _InfoRow(
              Icons.payments,
              "Contract",
              "${projectInfoData.contract_value} ${projectInfoData.currency}",
            ),

            const SizedBox(height: 10),

            /// Location
            _InfoRow(
              Icons.location_on,
              "Location",
              "${projectInfoData.longitude}, ${projectInfoData.latitude}",
            ),
            if (projectInfoData.description != null ||
                projectInfoData.extra_details != null)
              const Divider(height: 28),

            if (projectInfoData.description != null) ...[
              const Text(
                "Description",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(projectInfoData.description!),
            ],

            if (projectInfoData.extra_details != null) ...[
              const SizedBox(height: 16),
              const Text(
                "Extra Details",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              Text(projectInfoData.extra_details!),
            ],
          ],
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile(this.icon, this.title, this.value);

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
              ),
              Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
            ],
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow(this.icon, this.title, this.value);

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18),
        const SizedBox(width: 10),
        Text("$title:", style: const TextStyle(fontWeight: FontWeight.w600)),
        const SizedBox(width: 8),
        Expanded(child: Text(value)),
      ],
    );
  }
}
