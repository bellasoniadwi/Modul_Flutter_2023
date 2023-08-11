import 'package:flutter/material.dart';
import 'package:modul_flutter_6/db_helper.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> _allData = [];

  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  // get all data from database
  void _refreshData() async {
    final data = await DBHelper.getAllData();
    setState(() {
      _allData = data;
      _isLoading = false;
    });
  }

  // add data
  Future<void> _addData() async {
    await DBHelper.createData(
        _titleController.text, _descriptionController.text);
    _refreshData();
  }

  // update data
  Future<void> _updateData(int id) async {
    await DBHelper.updateData(
        id, _titleController.text, _descriptionController.text);
    _refreshData();
  }

  // delete data
  void _deleteData(int id) async {
    await DBHelper.deleteData(id);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.pinkAccent, content: Text('Data dihapus!')));
    _refreshData();
  }

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  void showBottomSheet(int? id) async {

    if(id!=null){
      final existingData = _allData.firstWhere((element) => element['id'] == id);
      _titleController.text = existingData['title'];
      _descriptionController.text = existingData['description'];
    }

    showModalBottomSheet(
      elevation: 5,
      isScrollControlled: true,
      context: context, 
      builder: (_) => Container(
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
              controller: _titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Title",
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _descriptionController,
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Description",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  if(id==null){
                    await _addData();
                  }
                  if(id!=null){
                    await _updateData(id);
                  }
                  _titleController.text = '';
                  _descriptionController.text = '';

                  Navigator.of(context).pop(); 
                },
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: Text(id == null ? "Add data" : "Update Data",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('CRUD SQFlite'),
      ),
      body: _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            itemCount: _allData.length,
            itemBuilder: (context, index) => Card(
              margin: EdgeInsets.all(15),
              child: ListTile(
              title: Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  _allData[index]['title'],
                style: TextStyle(
                  fontSize: 20
                ),
                ),
              ),
              subtitle: Text(
                _allData[index]['description']
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: (){
                      showBottomSheet(_allData[index]['id']);
                    }, 
                    icon: Icon(Icons.edit), 
                    color: Colors.indigo,
                  ),
                  IconButton(
                    onPressed: (){
                      _deleteData(_allData[index]['id']);
                    }, 
                    icon: Icon(Icons.delete), 
                    color: Colors.red,
                  )
                ],
              ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () => showBottomSheet(null),
            child: Icon(Icons.add),
          ),
    );
  }
}
