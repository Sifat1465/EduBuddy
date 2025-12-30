import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:url_launcher/url_launcher.dart';

class DailyLearnPage extends StatefulWidget {
  const DailyLearnPage({super.key});

  @override
  State<DailyLearnPage> createState() => _DailyLearnPageState();
}

class _DailyLearnPageState extends State<DailyLearnPage> {
  int streakCount = 3;
  int completedLessons = 0;

  final List<Map<String, String>> dailyLessons = const [
    // ================= Programming =================
    {
      'title': 'Python Fundamentals',
      'description': 'Learn Python basics for problem solving.',
      'language': 'Python',
      'link': 'https://docs.python.org/3/tutorial/',
      'youtube': 'https://youtu.be/UrsmFxEIp5k?si=7wdlIWmBHh2il_K_',
    },
    {
      'title': 'Flutter Basics',
      'description': 'Learn the basics of Flutter and widgets.',
      'language': 'Flutter',
      'link': 'https://docs.flutter.dev/get-started',
      'youtube': 'https://youtu.be/e0owsdB2oNk?si=ndSK37SHm-Rc6WKU',
    },
    {
      'title': 'Dart Language',
      'description': 'Understand Dart syntax and structures.',
      'language': 'Flutter',
      'link': 'https://dart.dev/guides',
      'youtube': 'https://youtu.be/_8Q5cwfvi64?si=oO9HakGTli6oZN5q',
    },
    {
      'title': 'JavaScript Basics',
      'description': 'Understand JavaScript for web development.',
      'language': 'JavaScript',
      'link': 'https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide',
      'youtube': 'https://youtu.be/VlPiVmYuoqw?si=i70pl2nFTMc3GKF9',
    },

    // ================= Discrete Mathematics =================
    {
      'title': 'Logic and Proof',
      'description': 'Propositional logic, predicates, proofs.',
      'language': 'Discrete Math',
      'link': 'https://www.geeksforgeeks.org/discrete-mathematics-logic/',
      'youtube': 'https://www.youtube.com/live/rW6SBvI5xbg?si=OTpSrDRyrKFA4rS8',
    },
    {
      'title': 'Sets & Cardinality',
      'description': 'Set operations, relations, cardinality.',
      'language': 'Discrete Math',
      'link': 'https://www.geeksforgeeks.org/sets-in-discrete-mathematics/',
      'youtube': 'https://www.youtube.com/live/1f9qv3gk7Lk?si=U1Y6T8GrXoXoX1n0',
    },
    {
      'title': 'Functions & Relations',
      'description': 'Functions and relations.',
      'language': 'Discrete Math',
      'link': 'https://www.geeksforgeeks.org/functions-discrete-mathematics/',
      'youtube': 'https://www.youtube.com/live/NKth1h8pr7s?si=xs-iYC2McHAzdOFk',
    },
    {
      'title': 'Counting Techniques',
      'description': 'Permutations, combinations, pigeonhole principle.',
      'language': 'Discrete Math',
      'link': 'https://www.geeksforgeeks.org/counting-principles/',
      'youtube': 'https://youtu.be/H6lzULuHNzE?si=qdjyN2fnMwhUFJsI',
    },
    {
      'title': 'Graphs',
      'description': 'Graph theory basics.',
      'language': 'Discrete Math',
      'link':
          'https://www.geeksforgeeks.org/graph-data-structure-and-algorithms/',
      'youtube': 'https://youtu.be/E8SyjD7PqxM?si=QoMgrt4P7AT54kU5',
    },

    // ================= Digital Logic Design =================
    {
      'title': 'Number Systems & Codes',
      'description': 'Binary, octal, hexadecimal number systems.',
      'language': 'DLD',
      'link': 'https://www.geeksforgeeks.org/number-system-and-codes/',
    },
    {
      'title': 'Boolean Algebra',
      'description': 'Boolean laws and simplification.',
      'language': 'DLD',
      'link': 'https://www.geeksforgeeks.org/boolean-algebra/',
    },
    {
      'title': 'Combinational Logic Circuits',
      'description': 'Adders, subtractors, multiplexers.',
      'language': 'DLD',
      'link': 'https://www.geeksforgeeks.org/combinational-logic-circuits/',
    },
    {
      'title': 'Sequential Logic & Flip-Flops',
      'description': 'Flip-flops, counters, registers.',
      'language': 'DLD',
      'link': 'https://www.geeksforgeeks.org/sequential-circuits/',
    },

    // ================= Electrical Drives & Instrumentation =================
    {
      'title': 'DC Machines',
      'description': 'DC motors and generators.',
      'language': 'Electrical',
      'link': 'https://www.geeksforgeeks.org/dc-machines/',
    },
    {
      'title': 'AC Machines',
      'description': 'Transformers and induction motors.',
      'language': 'Electrical',
      'link': 'https://www.geeksforgeeks.org/ac-machines/',
    },
    {
      'title': 'Measuring Instruments',
      'description': 'Analog and digital measuring instruments.',
      'language': 'Electrical',
      'link': 'https://www.geeksforgeeks.org/electrical-measuring-instruments/',
    },

    // ================= Vector Analysis & Linear Algebra =================
    {
      'title': 'Vector Calculus',
      'description': 'Gradient, divergence, curl.',
      'language': 'Math',
      'link': 'https://www.geeksforgeeks.org/vector-calculus/',
    },
    {
      'title': 'Matrices & Linear Equations',
      'description': 'Matrices and linear systems.',
      'language': 'Math',
      'link': 'https://www.geeksforgeeks.org/matrices/',
    },
    {
      'title': 'Eigenvalues & Eigenvectors',
      'description': 'Eigenvalues and eigenvectors.',
      'language': 'Math',
      'link': 'https://www.geeksforgeeks.org/eigenvalues-and-eigenvectors/',
    },

    // ================= Economics =================
    {
      'title': 'Introduction to Economics',
      'description': 'Basic concepts of economics.',
      'language': 'Economics',
      'link': 'https://www.investopedia.com/terms/e/economics.asp',
    },
    {
      'title': 'Demand, Supply & Elasticity',
      'description': 'Market demand, supply, and elasticity.',
      'language': 'Economics',
      'link': 'https://www.investopedia.com/terms/l/lawofdemand.asp',
    },
    {
      'title': 'Economy of Bangladesh',
      'description': 'Economic structure of Bangladesh.',
      'language': 'Economics',
      'link': 'https://en.wikipedia.org/wiki/Economy_of_Bangladesh',
    },

    // ================= Government & Sociology =================
    {
      'title': 'State and Government',
      'description': 'Concept of state and governance.',
      'language': 'Civics',
      'link':
          'https://www.britannica.com/topic/state-sovereign-political-entity',
    },
    {
      'title': 'Forms of Government',
      'description': 'Democracy, monarchy, dictatorship.',
      'language': 'Civics',
      'link': 'https://www.britannica.com/topic/government',
    },
    {
      'title': 'Introduction to Sociology',
      'description': 'Society, culture, and social system.',
      'language': 'Sociology',
      'link': 'https://www.britannica.com/topic/sociology',
    },
    {
      'title': 'Social Problems of Bangladesh',
      'description': 'Social development issues.',
      'language': 'Sociology',
      'link': 'https://en.wikipedia.org/wiki/Social_issues_in_Bangladesh',
    },
  ];

  String dailyAdvice =
      "📌 Consistency beats intensity. Learn a little every day!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daily Learn'), centerTitle: true),
      body: Column(
        children: [
          // 🔥 Streak Card
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
                    "🎯 Daily Goal: $completedLessons / ${dailyLessons.length}",
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

          // 📚 Lesson List
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
                      "${lesson['description']}\nSubject: ${lesson['language']}",
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
                            youtubeLink: lesson['youtube'],
                            gdriveLink: lesson['gdrive'],
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

// ================= Lesson Detail Page =================
class LessonDetailPage extends StatelessWidget {
  final String title;
  final String description;
  final String link;
  final String? youtubeLink;
  final String? gdriveLink;

  const LessonDetailPage({
    super.key,
    required this.title,
    required this.description,
    required this.link,
    this.youtubeLink,
    this.gdriveLink,
  });

  Future<void> _openLink(String url) async {
    final uri = Uri.parse(url);
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

            // Docs button
            ElevatedButton.icon(
              icon: const Icon(Icons.link),
              label: const Text("Open Docs"),
              onPressed: () => _openLink(link),
            ),

            const SizedBox(height: 12),

            // YouTube button
            if (youtubeLink != null)
              ElevatedButton.icon(
                icon: const Icon(Icons.play_circle_fill),
                label: const Text("Watch on YouTube"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () => _openLink(youtubeLink!),
              ),

            const SizedBox(height: 12),

            // Google Drive button
            if (gdriveLink != null)
              ElevatedButton.icon(
                icon: const Icon(Icons.cloud),
                label: const Text("Open on Google Drive"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () => _openLink(gdriveLink!),
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
