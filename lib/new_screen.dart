import 'package:flutter/material.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({super.key});

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  final TextEditingController _listController = TextEditingController();

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Tasks')),
      body: _selectedIndex == 0
          ? ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Card(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: ListTile(
                    leading: const Icon(
                      Icons.check_circle_outline,
                      color: Colors.deepPurple,
                    ),
                    title: const Text('Complete Flutter project'),
                    subtitle: const Text('Finish designing the Todo List app'),
                  ),
                ),

                Card(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: ListTile(
                    leading: const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.deepPurple,
                    ),
                    title: const Text('Buy groceries'),
                    subtitle: const Text('Buy rice, tomatoes and onions'),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: ListTile(
                    leading: const Icon(
                      Icons.menu_book_outlined,
                      color: Colors.deepPurple,
                    ),
                    title: const Text('Study programming'),
                    subtitle: const Text('Practice Flutter for one hour'),
                  ),
                ),
              ],
            )
          : _selectedIndex == 1
          ? ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    title: const Text('Default'),
                    subtitle: const Text(
                      'Call Mum, 30 minutes running, Prepare presentation',
                    ),
                  ),
                ),
                Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    title: const Text('Grocery'),
                    subtitle: const Text(
                      'Apples, Potatoes, Onions, Carrots, Lemons',
                    ),
                    trailing: const Icon(Icons.edit_outlined),
                  ),
                ),
              ],
            )
          : const Center(child: Text('Settings')),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        onPressed: () {
          if (_selectedIndex == 1) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Add New List'),
                  content: TextField(
                    controller: _listController,
                    decoration: const InputDecoration(
                      hintText: 'Enter list name',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Save'),
                    ),
                  ],
                );
              },
            );
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Add New Task')));
          }
        },
        child: const Icon(Icons.add),
      ),

      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), label: 'Home'),
          NavigationDestination(
            icon: Icon(Icons.list_alt_outlined),
            label: 'Lists',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
