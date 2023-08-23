import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UserProfile {
  final String username;
  String name;
  String email;
  String? profilePicture;

  UserProfile({
    required this.username,
    required this.name,
    required this.email,
    this.profilePicture,
  });
}

class ProfileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Profiles',
      home: ProfileList(),
    );
  }
}

class ProfileList extends StatefulWidget {
  @override
  _ProfileListState createState() => _ProfileListState();
}

class _ProfileListState extends State<ProfileList> {
  List<UserProfile> profiles = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profiles'),
      ),
      body: ListView.builder(
        itemCount: profiles.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(profiles[index].name),
            subtitle: Text(profiles[index].email),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      ProfileDetailScreen(profile: profiles[index]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  CreateProfileScreen(addProfile: _addProfile),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _addProfile(UserProfile newProfile) {
    setState(() {
      profiles.add(newProfile);
    });
  }
}

class ProfileDetailScreen extends StatelessWidget {
  final UserProfile profile;

  ProfileDetailScreen({required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (profile.profilePicture != null)
              CircleAvatar(
                radius: 50,
                backgroundImage: FileImage(File(profile.profilePicture!)),
              ),
            Text('Username: ${profile.username}'),
            Text('Name: ${profile.name}'),
            Text('Email: ${profile.email}'),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class CreateProfileScreen extends StatefulWidget {
  final void Function(UserProfile) addProfile;

  CreateProfileScreen({required this.addProfile});

  @override
  _CreateProfileScreenState createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  late TextEditingController _usernameController;
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  File? _pickedImage;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _pickedImage = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (_pickedImage != null)
              CircleAvatar(
                radius: 50,
                backgroundImage: FileImage(_pickedImage!),
              ),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Select Profile Picture'),
            ),
            TextField(
              controller: _usernameController,
              style: TextStyle(fontSize: 18), // Increase text size
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            TextField(
              controller: _nameController,
              style: TextStyle(fontSize: 18), // Increase text size
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: _emailController,
              style: TextStyle(fontSize: 18), // Increase text size
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _createProfile();
              },
              child: Text('Create Profile'),
            ),
          ],
        ),
      ),
    );
  }

  void _createProfile() {
    final username = _usernameController.text;
    final name = _nameController.text;
    final email = _emailController.text;

    if (username.isNotEmpty && name.isNotEmpty && email.isNotEmpty) {
      final newProfile = UserProfile(
          username: username,
          name: name,
          email: email,
          profilePicture: _pickedImage?.path);
      widget.addProfile(newProfile);
      Navigator.pop(context);
    }
  }
}
