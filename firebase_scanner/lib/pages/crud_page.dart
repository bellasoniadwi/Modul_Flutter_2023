import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CrudPage extends StatefulWidget {
  const CrudPage({super.key});

  @override
  State<CrudPage> createState() => _CrudPageState();
}

class _CrudPageState extends State<CrudPage> {
  // Mendefinisikan variabel
  final CollectionReference _products = FirebaseFirestore.instance.collection('products');
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('CRUD Firebase'),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _create(),
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: StreamBuilder(
        stream: _products.snapshots(), //build connection
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length, //number of rows
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(documentSnapshot['name']),
                    subtitle: Text("Rp "+documentSnapshot['price'].toString()),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                              icon: Icon(Icons.edit),
                              color: Colors.indigo,
                              onPressed: () => _update(documentSnapshot)),
                          IconButton(
                              icon: Icon(Icons.delete),
                              color: Colors.red,
                              onPressed: () => _delete(documentSnapshot.id)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }


  Future<void> _update([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _nameController.text = documentSnapshot['name'];
      _priceController.text = documentSnapshot['price'].toStringAsFixed(0);
    }
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Container(
            padding: EdgeInsets.only(
              top: 30,
              left: 15,
              right: 15,
              bottom: MediaQuery.of(context).viewInsets.bottom + 50,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Name",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _priceController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Price",
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ], 
                  keyboardType: TextInputType.number, // Keyboard tipe angka
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      final String name = _nameController.text;
                      final String priceString = _priceController.text;
                      if (name != "" && priceString != "") {
                        final int price = int.parse(priceString);

                        await _products.doc(documentSnapshot!.id).update({
                          "name": name,
                          "price": price,
                        });
                        _nameController.text = '';
                        _priceController.text = '';
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(18),
                      child: Text("Update Data",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
    );
  }

  Future<void> _create([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _nameController.text = documentSnapshot['name'];
      _priceController.text = documentSnapshot['price'];
    }
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Container(
            padding: EdgeInsets.only(
              top: 30,
              left: 15,
              right: 15,
              bottom: MediaQuery.of(context).viewInsets.bottom + 50,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Name",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _priceController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Price",
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ], 
                  keyboardType: TextInputType.number, // Keyboard tipe angka
                ),
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      final String name = _nameController.text;
                      final String priceString = _priceController.text;
                      
                      if (name != "" && priceString != "") {
                        final int price = int.parse(priceString);

                        await _products.add({
                          "name": name,
                          "price": price,
                        });
                        _nameController.text = '';
                        _priceController.text = '';
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(18),
                      child: Text("Add data",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                      ),
                    ),
                  ),
              ),
              ],
            ),
          );
        }
    );
  }

  Future<void> _delete(String productId) async {
    await _products.doc(productId).delete();

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Data produk berhasil dihapus!'),
        backgroundColor: Colors.pink));
  }
}
