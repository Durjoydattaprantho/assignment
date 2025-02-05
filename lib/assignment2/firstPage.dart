import 'package:flutter/material.dart';

class Contact {
  String name;
  String number;

  Contact({required this.name, required this.number});
}

class pageOne extends StatefulWidget {
  @override
  _pageOneState createState() => _pageOneState();
}

class _pageOneState extends State<pageOne> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  List<Contact> contacts = [];

  void addContact() {
    String name = nameController.text.trim();
    String number = numberController.text.trim();

    if (name.isNotEmpty && number.isNotEmpty) {
      setState(() {
        contacts.add(Contact(name: name, number: number));
      });

      nameController.clear();
      numberController.clear();
    }
  }

  void deleteContact(int index) {
    setState(() {
      contacts.removeAt(index);
    });
  }

  void showDeleteConfirmationDialog(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Confirmation"),
        content: const Text("Are you sure you want to delete?"),
        actions: [
          IconButton(
            icon: const Icon(Icons.cancel, color: Colors.grey),
            onPressed: () => Navigator.pop(context),
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.blueGrey),
            onPressed: () {
              deleteContact(index);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }


  void confirmDelete(String id) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirmation'),
        content: Text('Are you sure for Delete?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Icon(Icons.content_paste_off,color: Colors.blue,),
          ),
          TextButton(
            onPressed: () {
              // deleteContact(id);
              Navigator.pop(context);
            },
            child: Icon(Icons.delete,color: Colors.blue,),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact List"),
        backgroundColor: Colors.blueGrey,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Name",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Empty for the name option";
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: numberController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Number",
              ),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty || value.length < 11) {
                  return "Number must be it lest 11 ct";
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueGrey,
                ),
                onPressed: addContact,
                child: Text(
                  "Add",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.account_circle),
                      title: Text(
                        contacts[index].name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(contacts[index].number),
                      trailing: const Icon(Icons.call, color: Colors.blue),
                      onLongPress: () => showDeleteConfirmationDialog(index),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
