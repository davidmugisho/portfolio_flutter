import 'package:flutter/material.dart';

class WorkScreen extends StatelessWidget {
  const WorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'mainImage': 'images/girlSchool.jpeg',
        'sideImage': 'images/girl.jpeg',
        'name': 'School Project',
        'year': '2022',
      },
      {
        'mainImage': 'images/girl.jpeg',
        'sideImage': 'images/pichild.jpeg',
        'name': 'Girl Project',
        'year': '2023',
      },
      {
        'mainImage': 'images/pichild.jpeg',
        'sideImage': 'images/girlSchool.jpeg',
        'name': 'Child Project',
        'year': '2024',
      },
    ];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              // Top Row: About (left), About me (right, clickable)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'About',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('About me clicked!')),
                      );
                    },
                    child: const Text(
                      'About me',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Gray line with shadow
              Container(
                height: 2,
                decoration: BoxDecoration(
                  color: Colors.grey[400],
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Projects List
              Expanded(
                child: ListView.separated(
                  itemCount: projects.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 32),
                  itemBuilder: (context, index) {
                    final project = projects[index];
                    return ProjectCard(
                      mainImage: project['mainImage']!,
                      sideImage: project['sideImage']!,
                      name: project['name']!,
                      year: project['year']!,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectCard extends StatefulWidget {
  final String mainImage;
  final String sideImage;
  final String name;
  final String year;

  const ProjectCard({
    super.key,
    required this.mainImage,
    required this.sideImage,
    required this.name,
    required this.year,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  int likeCount = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Main image carousel in square with border radius
        Container(
          width: 220,
          height: 220,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(28),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(28),
            child: Image.asset(widget.mainImage, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 24),
        // Row: Animated small image (left), project info (right)
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Small side image
            Container(
              width: 69,
              height: 107,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(widget.sideImage, fit: BoxFit.cover),
              ),
            ),
            const SizedBox(width: 24),
            // Project info and actions
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.year,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (likeCount > 0) likeCount--;
                          });
                        },
                      ),
                      Text('$likeCount', style: const TextStyle(fontSize: 16)),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            likeCount++;
                          });
                        },
                      ),
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text('View More'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
