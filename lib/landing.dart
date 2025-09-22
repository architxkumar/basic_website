import 'package:basic_website/service.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {},
            child: Text('Home'),
          ),
          TextButton(
            onPressed: () {},
            child: Text('Projects'),
          ),
          TextButton(
            onPressed: () {},
            child: Text('Articles'),
          ),
          TextButton(
            onPressed: () {},
            child: Text('Contact'),
          ),
        ],
        leading: Icon(Icons.person),
        title: Text('Archit Kumar'),
      ),
      body: Column(
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(maxHeight: 250),
            child: Center(
              child: Text(
                'Flutter Developer',
                style: TextTheme.of(context).displayMedium,
              ),
            ),
          ),
          IntrinsicHeight(
            child: Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: ProjectBlock(),
                  ),
                  VerticalDivider(
                    color: Colors.black,
                  ),
                  Expanded(
                    flex: 1,
                    child: WorkExperienceBlock(),
                  ),
                  VerticalDivider(
                    color: Colors.black,
                  ),
                  Expanded(
                    flex: 1,
                    child: QualificationBlock(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectBlock extends StatelessWidget {
  const ProjectBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Projects',
            style: TextTheme.of(context).titleLarge,
          ),
        ),
        ProjectItem('HTML Only Portfolio'),
        Divider(
          color: Colors.black,
        ),
        ProjectItem('Calculator App'),
        Divider(
          color: Colors.black,
        ),
        ProjectItem('Quiz App'),
        Divider(
          color: Colors.black,
        ),
        ProjectItem('Countdown Timer'),
        Divider(
          color: Colors.black,
        ),
        ProjectItem('Product Upcoming Page'),
      ],
    );
  }
}

class ProjectItem extends StatelessWidget {
  final String text;

  const ProjectItem(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 32.0),
      child: Text(
        text,
        style: TextTheme.of(context).titleMedium,
      ),
    );
  }
}

class WorkExperienceBlock extends StatelessWidget {
  const WorkExperienceBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Work Experience',
            style: TextTheme.of(context).titleLarge,
          ),
        ),
        WorkExperienceItem(
          companyName: 'roadmap.sh',
          role: 'Solved all the frontend projects',
          profileLink: 'https://roadmap.sh/u/architxkumar',
        ),
        Divider(
          color: Colors.black,
        ),
        WorkExperienceItem(
          companyName: 'Open Source Work',
          role: 'Update resource link for golang on roadmap.sh',
          profileLink: 'https://github.com/architxkumar',
        ),
      ],
    );
  }
}

class WorkExperienceItem extends StatelessWidget {
  final String companyName;
  final String role;
  final String profileLink;

  const WorkExperienceItem({
    super.key,
    required this.companyName,
    required this.role,
    required this.profileLink,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        spacing: 8.0,
        children: [
          Text(
            companyName,
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
          Text(
            role,
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () async {
                final result = await urlLauncher(profileLink);
                if (result.isError()) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Could not launch URL')),
                    );
                  }
                }
              },
              child: Text(
                'Visit my Profile',
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QualificationBlock extends StatelessWidget {
  const QualificationBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8.0,
        children: [
          Text(
            'Qualification',
            style: TextTheme.of(context).titleLarge,
          ),
          Text('Pursuing B.E from Panjab University'),
          Text('Courses I took:'),
          Padding(
            padding: EdgeInsets.only(left: 16.0, top: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              spacing: 4.0,
              children: [
                _bulletPoint('Data Structures and Algorithms'),
                _bulletPoint('Operating Systems'),
                _bulletPoint('Database Management Systems'),
                _bulletPoint('Computer Networks'),
                _bulletPoint('Object Oriented Programming using C++'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('• '),
        Expanded(child: Text(text)),
      ],
    );
  }
}
