import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "HomePage",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.grey,
          centerTitle: true,
        ),
      ),
      home: const HomePage2(),
    );
  }
}

class Contact {
  String name;
  String contact;

  Contact({
    required this.name,
    required this.contact,
  });
}

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() {
    return HomePage2State();
  }
}

class HomePage2State extends State<HomePage2> {
  List<Contact> contacts = List.empty(growable: true);

  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        return FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Contacts List",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Center(
          child: SizedBox(
            width: 350.0,
            child: Column(
              children: [
                const SizedBox(height: 50.0),
                TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: "Contact Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  controller: contactController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  decoration: InputDecoration(
                    hintText: "Contact Number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11.0),
                    ),
                  ),
                ),
                const SizedBox(height: 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        String name = nameController.text.trim();
                        String contact = contactController.text.trim();

                        if (name.isNotEmpty && contact.isNotEmpty) {
                          setState(
                            () {
                              contacts.add(
                                Contact(name: name, contact: contact),
                              );
                            },
                          );
                        }
                        nameController.clear();
                        contactController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        fixedSize: const Size(120.0, 50.0),
                      ),
                      child: const Text(
                        "Save",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20.0),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        String name = nameController.text.trim();
                        String contact = contactController.text.trim();

                        if (name.isNotEmpty && contact.isNotEmpty) {
                          setState(
                            () {
                              contacts[selectedIndex].name = name;
                              contacts[selectedIndex].contact = contact;
                            },
                          );
                        }
                        nameController.clear();
                        contactController.clear();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        fixedSize: const Size(120.0, 50.0),
                      ),
                      child: const Text(
                        "Update",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40.0),
                contacts.isEmpty
                    ? const Text(
                        "No Contacts Yet...",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25.0),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: contacts.length,
                          itemBuilder: (context, index) {
                            return getRow(index);
                          },
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: index % 2 == 0 ? Colors.blue : Colors.purple,
          child: Text(
            contacts[index].name[0].toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 25.0),
          ),
        ),
        title: Text(
          contacts[index].name,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(contacts[index].contact),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                nameController.text = contacts[index].name;
                contactController.text = contacts[index].contact;

                setState(
                  () {
                    selectedIndex = index;
                  },
                );
              },
              icon: const Icon(Icons.edit),
            ),
            IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text(
                        "Delete Data",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      content: const Text("Are you sure ?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content:
                                    Text("${contacts[index].name} deleted..."),
                                duration: const Duration(seconds: 2),
                              ),
                            );
                            setState(
                              () {
                                contacts.removeAt(index);
                              },
                            );
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "delete",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "cancel",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
