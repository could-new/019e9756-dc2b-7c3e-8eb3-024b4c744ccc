import 'package:flutter/material.dart';

void main() {
  runApp(const PunjabiMusicApp());
}

class PunjabiMusicApp extends StatelessWidget {
  const PunjabiMusicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ghaint Punjabi Songs',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.orange,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> songs = [
      {
        'title': 'Excuses',
        'artist': 'AP Dhillon, Gurinder Gill',
        'duration': '2:56',
        'image': 'https://images.unsplash.com/photo-1511671782779-c97d3d27a1d4?auto=format&fit=crop&q=80&w=256&h=256',
      },
      {
        'title': 'Brown Munde',
        'artist': 'AP Dhillon, Gurinder Gill, Shinda Kahlon',
        'duration': '4:27',
        'image': 'https://images.unsplash.com/photo-1614145121029-83a9f7b68bf4?auto=format&fit=crop&q=80&w=256&h=256',
      },
      {
        'title': 'Moosetape Intro',
        'artist': 'Sidhu Moose Wala',
        'duration': '1:34',
        'image': 'https://images.unsplash.com/photo-1514525253161-7a46d19cd819?auto=format&fit=crop&q=80&w=256&h=256',
      },
      {
        'title': 'Lemonade',
        'artist': 'Diljit Dosanjh',
        'duration': '3:15',
        'image': 'https://images.unsplash.com/photo-1493225457124-a1a2a5956093?auto=format&fit=crop&q=80&w=256&h=256',
      },
      {
        'title': 'We Rollin',
        'artist': 'Shubh',
        'duration': '3:19',
        'image': 'https://images.unsplash.com/photo-1506157786151-b8491531f063?auto=format&fit=crop&q=80&w=256&h=256',
      },
      {
        'title': 'No Love',
        'artist': 'Shubh',
        'duration': '2:50',
        'image': 'https://images.unsplash.com/photo-1459749411175-04bf5292ceea?auto=format&fit=crop&q=80&w=256&h=256',
      },
      {
        'title': '295',
        'artist': 'Sidhu Moose Wala',
        'duration': '4:30',
        'image': 'https://images.unsplash.com/photo-1470225620780-dba8ba36b745?auto=format&fit=crop&q=80&w=256&h=256',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Ghaint Punjabi Songs', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: songs.length,
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemBuilder: (context, index) {
          final song = songs[index];
          return ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                song['image']!,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 56,
                  height: 56,
                  color: Colors.grey[800],
                  child: const Icon(Icons.music_note),
                ),
              ),
            ),
            title: Text(
              song['title']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(song['artist']!),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(song['duration']!, style: TextStyle(color: Colors.grey[400])),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.play_circle_fill),
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Playing ${song['title']}... 🎶'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
