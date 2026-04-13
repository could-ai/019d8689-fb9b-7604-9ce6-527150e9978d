import 'package:flutter/material.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gender in the Workplace Training'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          _DaySection(
            day: 'Day 1',
            title: 'Understanding Gender in the Workplace',
            sessions: [
              _SessionItem(
                time: '09:00 AM - 10:30 AM',
                title: 'Session 1: Introduction to Gender Concepts',
                description: 'Exploring the differences between sex and gender, understanding gender identity, and gender expression.',
              ),
              _SessionItem(
                time: '10:45 AM - 12:15 PM',
                title: 'Session 2: Unconscious Bias and Stereotypes',
                description: 'Identifying common gender stereotypes and how unconscious bias affects decision-making and workplace dynamics.',
              ),
              _SessionItem(
                time: '01:15 PM - 02:45 PM',
                title: 'Session 3: The Impact of Gender Inequality',
                description: 'Discussing the gender pay gap, representation in leadership, and the effect of microaggressions on employee well-being.',
              ),
              _SessionItem(
                time: '03:00 PM - 04:30 PM',
                title: 'Session 4: Legal Framework and Company Policies',
                description: 'Reviewing anti-discrimination laws, workplace rights, and the organization\\'s specific policies on gender equality.',
              ),
            ],
          ),
          SizedBox(height: 24),
          _DaySection(
            day: 'Day 2',
            title: 'Fostering an Inclusive Environment',
            sessions: [
              _SessionItem(
                time: '09:00 AM - 10:30 AM',
                title: 'Session 1: Inclusive Communication',
                description: 'Learning to use gender-neutral language, active listening, and communicating with empathy and respect.',
              ),
              _SessionItem(
                time: '10:45 AM - 12:15 PM',
                title: 'Session 2: Allyship and Advocacy',
                description: 'What it means to be an ally, how to advocate for colleagues, and strategies for intervening in biased situations.',
              ),
              _SessionItem(
                time: '01:15 PM - 02:45 PM',
                title: 'Session 3: Handling Harassment',
                description: 'Identifying workplace harassment, reporting mechanisms, and supporting victims of discrimination.',
              ),
              _SessionItem(
                time: '03:00 PM - 04:30 PM',
                title: 'Session 4: Action Planning',
                description: 'Developing personal and team commitments to promote gender equity and creating a sustainable inclusive culture.',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DaySection extends StatelessWidget {
  final String day;
  final String title;
  final List<Widget> sessions;

  const _DaySection({
    required this.day,
    required this.title,
    required this.sessions,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$day: $title',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            const SizedBox(height: 16),
            ...sessions,
          ],
        ),
      ),
    );
  }
}

class _SessionItem extends StatelessWidget {
  final String time;
  final String title;
  final String description;

  const _SessionItem({
    required this.time,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Text(
              time,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[600],
                  ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
