import 'package:flutter/material.dart';
import 'package:water_this_plant/data/mock_data.dart';
import 'package:water_this_plant/screens/transparency_center_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = MockData.currentUser;
    const _emerald = Color(0xFF059669);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundImage: AssetImage(user.avatarUrl.isNotEmpty
                      ? user.avatarUrl
                      : 'assets/images/avatars/${user.id}.jpg'),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF0F172A))),
                      const SizedBox(height: 2),
                      Text(user.email, style: const TextStyle(color: Color(0xFF64748B), fontSize: 13)),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.edit_outlined, color: Color(0xFF94A3B8)),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          _sectionHeader('Platform'),
          const SizedBox(height: 8),
          _settingsTile(
            context,
            icon: Icons.bar_chart_rounded,
            title: 'Transparency Center',
            subtitle: 'View revenue, donations, and community impact',
            color: _emerald,
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TransparencyCenterScreen())),
          ),
          _settingsTile(
            context,
            icon: Icons.notifications_outlined,
            title: 'Notifications',
            subtitle: 'Manage your notification preferences',
            color: const Color(0xFF0D9488),
            onTap: () {},
          ),
          _settingsTile(
            context,
            icon: Icons.lock_outline_rounded,
            title: 'Privacy & Security',
            subtitle: 'Control your data and privacy settings',
            color: const Color(0xFF0284C7),
            onTap: () {},
          ),
          const SizedBox(height: 24),
          _sectionHeader('Support'),
          const SizedBox(height: 8),
          _settingsTile(
            context,
            icon: Icons.help_outline_rounded,
            title: 'Help Center',
            subtitle: 'FAQs and support resources',
            color: const Color(0xFF8B5CF6),
            onTap: () {},
          ),
          _settingsTile(
            context,
            icon: Icons.info_outline_rounded,
            title: 'About',
            subtitle: 'Version 1.0.0',
            color: const Color(0xFF64748B),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: Color(0xFF94A3B8),
          letterSpacing: 0.5,
        ),
      ),
    );
  }

  Widget _settingsTile(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14, color: Color(0xFF0F172A))),
                    const SizedBox(height: 2),
                    Text(subtitle, style: const TextStyle(color: Color(0xFF64748B), fontSize: 12)),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right_rounded, color: Color(0xFFCBD5E1), size: 22),
            ],
          ),
        ),
      ),
    );
  }
}
