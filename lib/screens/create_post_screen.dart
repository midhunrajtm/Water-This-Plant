import 'package:flutter/material.dart';
import 'package:water_this_plant/data/mock_data.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final _captionController = TextEditingController();
  String _selectedType = 'Photo';

  final _contentTypes = ['Photo', 'Video', 'Reel', 'Artwork', 'Music', 'Update'];

  IconData _typeIcon(String type) {
    switch (type) {
      case 'Photo': return Icons.photo_camera_outlined;
      case 'Video': return Icons.videocam_outlined;
      case 'Reel': return Icons.smart_display_outlined;
      case 'Artwork': return Icons.palette_outlined;
      case 'Music': return Icons.music_note_outlined;
      case 'Update': return Icons.edit_note_rounded;
      default: return Icons.photo_camera_outlined;
    }
  }

  @override
  void dispose() {
    _captionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = MockData.currentUser;

    return Scaffold(
      appBar: AppBar(
        leading: TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel', style: TextStyle(color: Color(0xFF0F172A), fontWeight: FontWeight.w500)),
        ),
        title: const Text('New Post', style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Posted! (demo)'),
                    behavior: SnackBarBehavior.floating,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                );
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Share', style: TextStyle(fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Media picker (demo)'), behavior: SnackBarBehavior.floating),
                );
              },
              child: Container(
                height: 220,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: const Color(0xFFE2E8F0), width: 2),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.add_photo_alternate_outlined, size: 52, color: Colors.grey[400]),
                    const SizedBox(height: 8),
                    Text('Tap to add ${_selectedType.toLowerCase()}', style: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: const Color(0xFF0D9488).withValues(alpha: 0.2),
                  child: Text(user.name[0], style: const TextStyle(color: Color(0xFF0D9488), fontWeight: FontWeight.bold)),
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(user.name, style: const TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF0F172A))),
                    Text('Public', style: TextStyle(fontSize: 11, color: Colors.grey[500])),
                  ],
                ),
                const Spacer(),
                Icon(Icons.arrow_drop_down_rounded, color: Colors.grey[500]),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _captionController,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: "Write a caption...",
                border: InputBorder.none,
                hintStyle: TextStyle(color: Color(0xFF94A3B8)),
              ),
              style: const TextStyle(fontSize: 15, color: Color(0xFF0F172A)),
            ),
            const SizedBox(height: 8),
            const Divider(),
            _menuRow(Icons.tag_rounded, 'Tag people'),
            const Divider(),
            _menuRow(Icons.location_on_outlined, 'Add location'),
            const Divider(),
            _menuRow(Icons.link_rounded, 'Link a cause (optional)'),
            const Divider(height: 16),
            const Text('Content Type', style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF0F172A))),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: _contentTypes.map((type) {
                final isSelected = _selectedType == type;
                return GestureDetector(
                  onTap: () => setState(() => _selectedType = type),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFF0D9488).withValues(alpha: 0.1) : const Color(0xFFF1F5F9),
                      borderRadius: BorderRadius.circular(12),
                      border: isSelected ? Border.all(color: const Color(0xFF0D9488)) : null,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(_typeIcon(type), size: 16, color: isSelected ? const Color(0xFF0D9488) : const Color(0xFF64748B)),
                        const SizedBox(width: 6),
                        Text(type, style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: isSelected ? const Color(0xFF0D9488) : const Color(0xFF64748B),
                          fontSize: 13,
                        )),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuRow(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(icon, size: 20, color: const Color(0xFF64748B)),
          const SizedBox(width: 12),
          Text(label, style: const TextStyle(color: Color(0xFF0F172A), fontWeight: FontWeight.w500)),
          const Spacer(),
          const Icon(Icons.chevron_right_rounded, color: Color(0xFF94A3B8), size: 20),
        ],
      ),
    );
  }
}
