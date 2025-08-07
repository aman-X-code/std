import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../widgets/multimedia_item.dart';

class MultimediaScreen extends StatefulWidget {
  const MultimediaScreen({super.key});

  @override
  State<MultimediaScreen> createState() => _MultimediaScreenState();
}

class _MultimediaScreenState extends State<MultimediaScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<List<Map<String, dynamic>>> tabData = [
      // All
      [
        {
          'title': 'Mathematics Lecture - Chapter 5',
          'uploader': 'Prof. Smith',
          'time': '2 hours ago',
          'type': 'video',
          'icon': Icons.play_circle_outline,
        },
        {
          'title': 'Assignment Guidelines.pdf',
          'uploader': 'Admin',
          'time': '1 day ago',
          'type': 'document',
          'icon': Icons.description_outlined,
        },
        {
          'title': 'Chemistry Lab Photos',
          'uploader': 'Dr. Johnson',
          'time': '3 days ago',
          'type': 'image',
          'icon': Icons.image_outlined,
        },
      ],
      // Videos
      [
        {
          'title': 'Mathematics Lecture - Chapter 5',
          'uploader': 'Prof. Smith',
          'time': '2 hours ago',
          'type': 'video',
          'icon': Icons.play_circle_outline,
        },
        {
          'title': 'Physics Experiment Demo',
          'uploader': 'Dr. Wilson',
          'time': '1 day ago',
          'type': 'video',
          'icon': Icons.play_circle_outline,
        },
      ],
      // Images
      [
        {
          'title': 'Chemistry Lab Photos',
          'uploader': 'Dr. Johnson',
          'time': '3 days ago',
          'type': 'image',
          'icon': Icons.image_outlined,
        },
        {
          'title': 'School Event Pictures',
          'uploader': 'Admin',
          'time': '1 week ago',
          'type': 'image',
          'icon': Icons.image_outlined,
        },
      ],
      // Documents
      [
        {
          'title': 'Assignment Guidelines.pdf',
          'uploader': 'Admin',
          'time': '1 day ago',
          'type': 'document',
          'icon': Icons.description_outlined,
        },
        {
          'title': 'Study Material - History.pdf',
          'uploader': 'Prof. Brown',
          'time': '2 days ago',
          'type': 'document',
          'icon': Icons.description_outlined,
        },
      ],
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Multimedia'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'All'),
            Tab(text: 'Videos'),
            Tab(text: 'Images'),
            Tab(text: 'Documents'),
          ],
          indicatorColor: Theme.of(context).colorScheme.primary,
          labelColor: Theme.of(context).colorScheme.primary,
          unselectedLabelColor: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: List.generate(4, (tabIndex) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: ListView.builder(
              key: ValueKey(tabIndex),
              padding: const EdgeInsets.all(16),
              itemCount: tabData[tabIndex].length,
              itemBuilder: (context, itemIndex) {
                final item = tabData[tabIndex][itemIndex];
                return MultimediaItem(
                  title: item['title'],
                  uploader: item['uploader'],
                  time: item['time'],
                  type: item['type'],
                  icon: item['icon'],
                  onTap: () {},
                  onDownload: () {},
                )
                    .animate()
                    .slideX(
                  delay: (itemIndex * 100).ms,
                  begin: 0.3,
                  duration: 400.ms,
                )
                    .fade(delay: (itemIndex * 100).ms, duration: 400.ms);
              },
            ),
          );
        }),
      ),
    );
  }
}