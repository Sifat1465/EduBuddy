import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:url_launcher/url_launcher.dart';

class DailyLearnPage extends StatefulWidget {
  const DailyLearnPage({super.key});

  @override
  State<DailyLearnPage> createState() => _DailyLearnPageState();
}

class _DailyLearnPageState extends State<DailyLearnPage> {
  int streakCount = 3; // example streak
  int completedLessons = 0;

  final List<Map<String, String>> dailyLessons = const [
    {
      'title': 'Flutter Basics',
      'description': 'Learn the basics of Flutter and widgets.',
      'language': 'Flutter',
      'link': 'https://docs.flutter.dev/get-started',
    },
    {
      'title': 'Dart Language',
      'description': 'Understand Dart syntax and structures.',
      'language': 'Flutter',
      'link': 'https://dart.dev/guides',
    },
    {
      'title': 'Python Fundamentals',
      'description': 'Learn Python basics for problem solving.',
      'language': 'Python',
      'link': 'https://docs.python.org/3/tutorial/',
    },
    {
      'title': 'JavaScript Basics',
      'description': 'Understand JavaScript for web development.',
      'language': 'JavaScript',
      'link': 'https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide',
    },
  ];

  String dailyAdvice =
      "📌 Consistency beats intensity. Learn a little every day!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daily Learn')),
      body: Column(
        children: [
          // 🔥 Streak & Goal Card
          Card(
            margin: const EdgeInsets.all(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Text(
                    "🔥 Streak: $streakCount days",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "🎯 Daily Goal: $completedLessons / ${dailyLessons.length} completed",
                  ),
                  const SizedBox(height: 8),
                  Text(
                    dailyAdvice,
                    style: const TextStyle(color: Colors.green),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),

          // 📚 Lessons List
          Expanded(
            child: ListView.builder(
              itemCount: dailyLessons.length,
              itemBuilder: (context, index) {
                final lesson = dailyLessons[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.orange,
                      child: Text(
                        lesson['language']![0],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(lesson['title']!),
                    subtitle: Text(
                      "${lesson['description']!}\nLanguage: ${lesson['language']}",
                    ),
                    isThreeLine: true,
                    trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    onTap: () {
                      setState(() {
                        completedLessons++;
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => LessonDetailPage(
                            title: lesson['title']!,
                            description: lesson['description']!,
                            link: lesson['link']!,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LessonDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final String link;

  const LessonDetailPage({
    super.key,
    required this.title,
    required this.description,
    required this.link,
  });

  Future<void> _openLink() async {
    final uri = Uri.parse(link);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.link),
              label: const Text("Start Learning"),
              onPressed: _openLink,
            ),
            const SizedBox(height: 20),
            const Text(
              "💡 Advice:\nPractice what you learn today before sleeping.",
              style: TextStyle(color: Colors.blueGrey),
            ),
          ],
        ),
      ),
    );
  }
}
