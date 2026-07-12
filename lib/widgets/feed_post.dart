import 'package:flutter/material.dart';
import 'package:water_this_plant/models/post.dart';

class FeedPost extends StatefulWidget {
  final Post post;
  final VoidCallback? onAvatarTap;

  const FeedPost({super.key, required this.post, this.onAvatarTap});

  @override
  State<FeedPost> createState() => _FeedPostState();
}

class _FeedPostState extends State<FeedPost> {
  late int _likes;
  late bool _isLiked;
  late bool _isSaved;

  @override
  void initState() {
    super.initState();
    _likes = widget.post.likes;
    _isLiked = widget.post.isLiked;
    _isSaved = widget.post.isSaved;
  }

  Color _catColor(String cat) {
    switch (cat) {
      case 'community': return const Color(0xFF0D9488);
      case 'environment': return const Color(0xFF059669);
      case 'agriculture': return const Color(0xFFD97706);
      case 'relief': return const Color(0xFFDC2626);
      default: return const Color(0xFF0D9488);
    }
  }

  IconData _typeIcon(String type) {
    switch (type) {
      case 'photo': return Icons.photo_camera_outlined;
      case 'video': return Icons.videocam_outlined;
      case 'reel': return Icons.smart_display_outlined;
      case 'artwork': return Icons.palette_outlined;
      case 'music': return Icons.music_note_outlined;
      case 'update': return Icons.edit_note_rounded;
      default: return Icons.photo_camera_outlined;
    }
  }

  String _timeAgo(DateTime dt) {
    final diff = DateTime.now().difference(dt);
    if (diff.inMinutes < 60) return '${diff.inMinutes}m';
    if (diff.inHours < 24) return '${diff.inHours}h';
    if (diff.inDays < 7) return '${diff.inDays}d';
    return '${diff.inDays ~/ 7}w';
  }

  String _formatCount(int n) {
    if (n >= 1000000) return '${(n / 1000000).toStringAsFixed(1)}M';
    if (n >= 1000) return '${(n / 1000).toStringAsFixed(1)}K';
    return '$n';
  }

  @override
  Widget build(BuildContext context) {
    final color = _catColor(widget.post.category);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          child: Row(
            children: [
              GestureDetector(
                onTap: widget.onAvatarTap,
                child: CircleAvatar(
                  radius: 18,
                  backgroundColor: color.withValues(alpha: 0.2),
                  child: Text(widget.post.userName[0],
                    style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 16)),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: widget.onAvatarTap,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(widget.post.userName,
                          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: Color(0xFF0F172A))),
                        const SizedBox(width: 4),
                        Text('\u2022 ${_timeAgo(widget.post.timestamp)}',
                          style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8))),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(_typeIcon(widget.post.type), size: 10, color: const Color(0xFF94A3B8)),
                        const SizedBox(width: 4),
                        Text(widget.post.type[0].toUpperCase() + widget.post.type.substring(1),
                          style: const TextStyle(fontSize: 10, color: Color(0xFF94A3B8))),
                      ],
                    ),
                  ],
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.more_horiz, size: 20, color: Color(0xFF64748B)),
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        ),
        AspectRatio(
          aspectRatio: 1,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [color, color.withValues(alpha: 0.6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Icon(_typeIcon(widget.post.type), size: 64, color: Colors.white.withValues(alpha: 0.3)),
                if (widget.post.type == 'reel')
                  Positioned(
                    right: 12,
                    bottom: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.play_arrow_rounded, size: 14, color: Colors.white),
                          SizedBox(width: 4),
                          Text('REEL', style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                  ),
                if (widget.post.type == 'music')
                  Positioned(
                    child: Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.play_arrow_rounded, size: 32, color: Colors.white),
                    ),
                  ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 10, 14, 0),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isLiked = !_isLiked;
                    _likes += _isLiked ? 1 : -1;
                  });
                },
                child: Icon(
                  _isLiked ? Icons.favorite_rounded : Icons.favorite_outline_rounded,
                  size: 26,
                  color: _isLiked ? Colors.red : const Color(0xFF0F172A),
                ),
              ),
              const SizedBox(width: 16),
              const Icon(Icons.chat_bubble_outline_rounded, size: 24, color: Color(0xFF0F172A)),
              const SizedBox(width: 16),
              const Icon(Icons.send_outlined, size: 24, color: Color(0xFF0F172A)),
              const Spacer(),
              GestureDetector(
                onTap: () => setState(() => _isSaved = !_isSaved),
                child: Icon(
                  _isSaved ? Icons.bookmark_rounded : Icons.bookmark_border_rounded,
                  size: 26,
                  color: const Color(0xFF0F172A),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 6, 14, 0),
          child: Text(
            '${_formatCount(_likes)} likes',
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: Color(0xFF0F172A)),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 4, 14, 0),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 13, color: Color(0xFF0F172A), height: 1.4),
              children: [
                TextSpan(
                  text: '${widget.post.userName} ',
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                TextSpan(text: widget.post.caption),
              ],
            ),
          ),
        ),
        if (widget.post.comments > 0)
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 4, 14, 0),
            child: Text(
              'View all ${_formatCount(widget.post.comments)} comments',
              style: const TextStyle(fontSize: 13, color: Color(0xFF94A3B8)),
            ),
          ),
        if (widget.post.shares > 0)
          Padding(
            padding: const EdgeInsets.fromLTRB(14, 2, 14, 0),
            child: Text(
              '${_formatCount(widget.post.shares)} shares',
              style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8)),
            ),
          ),
        Padding(
          padding: const EdgeInsets.fromLTRB(14, 2, 14, 8),
          child: Text(
            _timeAgo(widget.post.timestamp),
            style: const TextStyle(fontSize: 10, color: Color(0xFF94A3B8), letterSpacing: 0.3),
          ),
        ),
        const Divider(height: 1, color: Color(0xFFF1F5F9)),
      ],
    );
  }
}
