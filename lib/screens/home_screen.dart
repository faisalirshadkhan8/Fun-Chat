import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // Dummy data for chat list
  final List<Map<String, dynamic>> _chats = [
    {
      'name': 'John Doe',
      'avatar': 'https://randomuser.me/api/portraits/men/1.jpg',
      'message': 'Hey, how are you doing?',
      'time': '10:30 AM',
      'unread': 2,
    },
    {
      'name': 'Sarah Smith',
      'avatar': 'https://randomuser.me/api/portraits/women/2.jpg',
      'message': 'Did you finish the project?',
      'time': '9:45 AM',
      'unread': 0,
    },
    {
      'name': 'Mike Johnson',
      'avatar': 'https://randomuser.me/api/portraits/men/3.jpg',
      'message': 'Let\'s meet tomorrow!',
      'time': 'Yesterday',
      'unread': 1,
    },
    {
      'name': 'Emma Wilson',
      'avatar': 'https://randomuser.me/api/portraits/women/4.jpg',
      'message': 'Thanks for your help!',
      'time': 'Yesterday',
      'unread': 0,
    },
    {
      'name': 'Alex Brown',
      'avatar': 'https://randomuser.me/api/portraits/men/5.jpg',
      'message': 'I\'ll send you the files soon',
      'time': '2 days ago',
      'unread': 0,
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fun Chat',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Search functionality would go here
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {
              // More options functionality would go here
            },
          ),
        ],
      ),
      body: _selectedIndex == 0 ? _buildChatList() : _buildProfileView(),
      floatingActionButton:
          _selectedIndex == 0
              ? FloatingActionButton(
                onPressed: () {
                  // New chat functionality would go here
                },
                backgroundColor: Colors.deepPurple,
                child: const Icon(Icons.chat, color: Colors.white),
              )
              : null,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Chats',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildChatList() {
    return ListView.builder(
      itemCount: _chats.length,
      itemBuilder: (context, index) {
        final chat = _chats[index];
        return ListTile(
          leading: CircleAvatar(backgroundImage: NetworkImage(chat['avatar'])),
          title: Text(
            chat['name'],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            chat['message'],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                chat['time'],
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(height: 5),
              if (chat['unread'] > 0)
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.deepPurple,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    chat['unread'].toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ),
            ],
          ),
          onTap: () {
            // Chat details functionality would go here
          },
        );
      },
    );
  }

  Widget _buildProfileView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 60,
            backgroundImage: NetworkImage(
              'https://randomuser.me/api/portraits/men/7.jpg',
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'User Name',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'user@email.com',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: () {
              // Edit profile functionality would go here
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
            ),
            child: const Text('Edit Profile'),
          ),
          const SizedBox(height: 16),
          OutlinedButton(
            onPressed: () {
              // Sign out functionality would go here
              Navigator.pushReplacementNamed(context, '/');
            },
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}
