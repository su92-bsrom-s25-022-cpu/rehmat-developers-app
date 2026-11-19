import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const RehmatDevelopersApp());
}

const navy = Color(0xFF07111F);
const panel = Color(0xFF101F31);
const cyan = Color(0xFF20D6E8);
const muted = Color(0xFF9CB0C5);

class RehmatDevelopersApp extends StatelessWidget {
  const RehmatDevelopersApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rehmat Developers',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: navy,
        colorScheme: ColorScheme.fromSeed(
          seedColor: cyan,
          brightness: Brightness.dark,
          surface: panel,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final pages = const [
    HomePage(),
    ServicesPage(),
    AboutPage(),
    ContactPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[selectedIndex]),
      bottomNavigationBar: NavigationBar(
        backgroundColor: const Color(0xFF0B1929),
        indicatorColor: cyan.withOpacity(0.16),
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() => selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home, color: cyan),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.grid_view_rounded),
            selectedIcon: Icon(Icons.grid_view_rounded, color: cyan),
            label: 'Services',
          ),
          NavigationDestination(
            icon: Icon(Icons.groups_outlined),
            selectedIcon: Icon(Icons.groups, color: cyan),
            label: 'About',
          ),
          NavigationDestination(
            icon: Icon(Icons.mail_outline),
            selectedIcon: Icon(Icons.mail, color: cyan),
            label: 'Contact',
          ),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(22, 20, 22, 28),
      children: [
        const BrandHeader(),
        const SizedBox(height: 34),
        Container(
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(26),
            gradient: const LinearGradient(
              colors: [Color(0xFF142B43), Color(0xFF0B1929)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(color: cyan.withOpacity(0.25)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.circle, color: cyan, size: 9),
                  SizedBox(width: 8),
                  Text(
                    'AVAILABLE FOR NEW PROJECTS',
                    style: TextStyle(
                      color: cyan,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),
              const Text(
                'Transforming Ideas Into Digital Reality',
                style: TextStyle(
                  fontSize: 31,
                  height: 1.15,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'We build high-performance websites and digital solutions that help businesses grow.',
                style: TextStyle(color: muted, height: 1.55, fontSize: 14),
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: () => openWhatsApp(
                  'Hello Rehmat Developers, I would like to discuss a project.',
                ),
                icon: const Icon(Icons.rocket_launch_outlined),
                label: const Text('Start Your Project'),
                style: FilledButton.styleFrom(
                  backgroundColor: cyan,
                  foregroundColor: navy,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),
        const SectionHeading(title: 'What We Do', subtitle: 'Digital solutions for your business'),
        const SizedBox(height: 14),
        const ServicePreview(
          icon: Icons.language,
          title: 'Custom Web Development',
          description: 'Modern, responsive websites built around your needs.',
        ),
        const ServicePreview(
          icon: Icons.layers_outlined,
          title: 'Full-Stack Applications',
          description: 'Powerful frontend, backend and database solutions.',
        ),
        const ServicePreview(
          icon: Icons.shopping_bag_outlined,
          title: 'E-Commerce Solutions',
          description: 'Online stores designed to turn visitors into customers.',
        ),
        const SizedBox(height: 22),
        const SectionHeading(title: 'Why Choose Us', subtitle: 'Quality work, clear communication'),
        const SizedBox(height: 14),
        const FeatureTile(
          icon: Icons.bolt,
          title: 'Fast Delivery',
          description: 'Focused workflows and clear project timelines.',
        ),
        const FeatureTile(
          icon: Icons.verified_outlined,
          title: 'Quality Code',
          description: 'Scalable solutions built with care.',
        ),
        const FeatureTile(
          icon: Icons.support_agent,
          title: 'Dedicated Support',
          description: 'Support for your digital presence after delivery.',
        ),
        const SizedBox(height: 24),
        const FooterNote(),
      ],
    );
  }
}

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  static const services = [
    (Icons.language, 'Custom Web Development',
        'Tailor-made websites designed to match your brand and business goals.'),
    (Icons.layers_outlined, 'Full-Stack Applications',
        'Complete web applications with frontend, backend and database integration.'),
    (Icons.shopping_cart_outlined, 'E-Commerce Solutions',
        'Feature-rich online stores with product and shopping experiences.'),
    (Icons.palette_outlined, 'UI/UX Design',
        'Clean, intuitive interfaces that make digital products easier to use.'),
    (Icons.rocket_launch_outlined, 'Landing Pages',
        'Focused landing pages to present your services and generate leads.'),
    (Icons.build_outlined, 'Maintenance & Support',
        'Website updates, improvements and ongoing technical support.'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(22, 20, 22, 28),
      children: [
        const BrandHeader(),
        const SizedBox(height: 30),
        const SectionHeading(
          title: 'Our Services',
          subtitle: 'Everything you need to build your digital presence',
        ),
        const SizedBox(height: 18),
        for (final service in services)
          ServicePreview(
            icon: service.$1,
            title: service.$2,
            description: service.$3,
          ),
        const SizedBox(height: 18),
        FilledButton.icon(
          onPressed: () => openWhatsApp(
            'Hello Rehmat Developers, please share details about your services.',
          ),
          icon: const Icon(Icons.chat_outlined),
          label: const Text('Discuss a Service'),
          style: FilledButton.styleFrom(
            backgroundColor: cyan,
            foregroundColor: navy,
            padding: const EdgeInsets.all(16),
          ),
        ),
      ],
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(22, 20, 22, 28),
      children: [
        const BrandHeader(),
        const SizedBox(height: 30),
        const SectionHeading(
          title: 'About Rehmat Developers',
          subtitle: 'Turning ideas into useful digital experiences',
        ),
        const SizedBox(height: 16),
        const Text(
          'Rehmat Developers is a web development agency creating modern websites and digital solutions for businesses. We focus on thoughtful design, reliable functionality and solutions that support business growth.',
          style: TextStyle(color: muted, height: 1.7, fontSize: 15),
        ),
        const SizedBox(height: 26),
        const SectionHeading(title: 'Our Team', subtitle: 'The people behind our work'),
        const SizedBox(height: 14),
        const TeamCard(
          initials: 'MW',
          name: 'Muhammad Waleed',
          role: 'Founder & CEO | Frontend & Backend Developer',
        ),
        const TeamCard(
          initials: 'AJ',
          name: 'Muhammad Ahsan Jameel',
          role: 'WordPress Website Development Expert',
        ),
        const SizedBox(height: 20),
        const FooterNote(),
      ],
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(22, 20, 22, 28),
      children: [
        const BrandHeader(),
        const SizedBox(height: 30),
        const SectionHeading(
          title: 'Let’s Talk',
          subtitle: 'Tell us about the project you have in mind',
        ),
        const SizedBox(height: 20),
        const ContactTile(
          icon: Icons.phone_outlined,
          title: 'Call Us',
          detail: '+92 328 4461097',
        ),
        const ContactTile(
          icon: Icons.email_outlined,
          title: 'Email',
          detail: 'rehmat.developers022@gmail.com',
        ),
        const ContactTile(
          icon: Icons.location_on_outlined,
          title: 'Location',
          detail: 'Raja Jang, Kasur, Punjab, Pakistan',
        ),
        const SizedBox(height: 20),
        FilledButton.icon(
          onPressed: () => openWhatsApp(
            'Hello Rehmat Developers, I want to get a quote for my project.',
          ),
          icon: const Icon(Icons.chat),
          label: const Text('Chat on WhatsApp'),
          style: FilledButton.styleFrom(
            backgroundColor: cyan,
            foregroundColor: navy,
            padding: const EdgeInsets.all(16),
          ),
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: openEmail,
          icon: const Icon(Icons.mail_outline),
          label: const Text('Send an Email'),
          style: OutlinedButton.styleFrom(
            foregroundColor: cyan,
            side: const BorderSide(color: cyan),
            padding: const EdgeInsets.all(16),
          ),
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: openWebsite,
          icon: const Icon(Icons.language),
          label: const Text('Visit Official Website'),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            side: BorderSide(color: Colors.white.withOpacity(0.25)),
            padding: const EdgeInsets.all(16),
          ),
        ),
        const SizedBox(height: 24),
        const FooterNote(),
      ],
    );
  }
}

class BrandHeader extends StatelessWidget {
  const BrandHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 46,
          width: 46,
          decoration: BoxDecoration(
            color: cyan.withOpacity(0.12),
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: cyan.withOpacity(0.4)),
          ),
          child: const Icon(Icons.code_rounded, color: cyan, size: 27),
        ),
        const SizedBox(width: 12),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'REHMAT DEVELOPERS',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 3),
              Text(
                'Digital solutions that move you forward',
                style: TextStyle(color: muted, fontSize: 10),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SectionHeading extends StatelessWidget {
  final String title;
  final String subtitle;

  const SectionHeading({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 23, fontWeight: FontWeight.w800),
        ),
        const SizedBox(height: 6),
        Text(subtitle, style: const TextStyle(color: muted, fontSize: 13)),
      ],
    );
  }
}

class ServicePreview extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const ServicePreview({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: panel,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: cyan.withOpacity(0.12),
              borderRadius: BorderRadius.circular(13),
            ),
            child: Icon(icon, color: cyan),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(color: muted, height: 1.45, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FeatureTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const FeatureTile({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: cyan, size: 27),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(description, style: const TextStyle(color: muted)),
    );
  }
}

class TeamCard extends StatelessWidget {
  final String initials;
  final String name;
  final String role;

  const TeamCard({
    super.key,
    required this.initials,
    required this.name,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: panel,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: cyan.withOpacity(0.15),
            child: Text(
              initials,
              style: const TextStyle(color: cyan, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(role, style: const TextStyle(color: muted, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContactTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String detail;

  const ContactTile({
    super.key,
    required this.icon,
    required this.title,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: panel,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: cyan, size: 25),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 5),
                Text(detail, style: const TextStyle(color: muted, fontSize: 12)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FooterNote extends StatelessWidget {
  const FooterNote({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '© 2026 Rehmat Developers · Made with care',
        textAlign: TextAlign.center,
        style: TextStyle(color: muted, fontSize: 11),
      ),
    );
  }
}

Future<void> openWhatsApp(String message) async {
  final uri = Uri.parse(
    'https://wa.me/923284461097?text=${Uri.encodeComponent(message)}',
  );
  await launchUrl(uri, mode: LaunchMode.externalApplication);
}

Future<void> openEmail() async {
  final uri = Uri(
    scheme: 'mailto',
    path: 'rehmat.developers022@gmail.com',
    queryParameters: {'subject': 'Project Inquiry - Rehmat Developers'},
  );
  await launchUrl(uri);
}

Future<void> openWebsite() async {
  final uri = Uri.parse('https://rehmatdevelopers.github.io/rehmatdevelopers/');
  await launchUrl(uri, mode: LaunchMode.externalApplication);
}
