import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key,
    required this.name,
    required this.ownerName,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.extraDetails,
    required this.contractValue,
    required this.currency,
    required this.progress,
    required this.latitude,
    required this.longitude,
  });

  final String name;
  final String ownerName;
  final String startDate;
  final String endDate;
  final String description;
  final String extraDetails;
  final String contractValue;
  final String currency;
  final double progress;
  final String latitude;
  final String longitude;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).primaryColor;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
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
                  child: Icon(
                    Icons.business_center,
                    color: primary,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        "Owner: $ownerName",
                        style: TextStyle(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
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
                Text("${progress.toInt()}%"),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: progress / 100,
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
                    startDate,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _InfoTile(
                    Icons.event,
                    "End",
                    endDate,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),

            /// Contract
            _InfoRow(
              Icons.payments,
              "Contract",
              "$contractValue $currency",
            ),

            const SizedBox(height: 10),

            /// Location
            _InfoRow(
              Icons.location_on,
              "Location",
              "$latitude, $longitude",
            ),

            const Divider(height: 28),

            const Text(
              "Description",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            Text(description),

            if (extraDetails.isNotEmpty) ...[
              const SizedBox(height: 16),
              const Text(
                "Extra Details",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(extraDetails),
            ],
          ],
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile(
      this.icon,
      this.title,
      this.value,
      );

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
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey.shade600,
                ),
              ),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow(
      this.icon,
      this.title,
      this.value,
      );

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18),
        const SizedBox(width: 10),
        Text(
          "$title:",
          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(child: Text(value)),
      ],
    );
  }
}