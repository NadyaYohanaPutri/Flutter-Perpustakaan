import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({super.key});

  @override
  _BookListPageState createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  List<Map<String, dynamic>> Buku = [];

  @override
  void initState() {
    super.initState();
    fetchBooks();
  }

  Future<void> fetchBooks() async{
    final response = await Supabase.instance.client
    .from('Buku')
    .select();

    setState(() {
      Buku = List<Map<String, dynamic>>.from(response);
    });
  }
  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Buku'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: fetchBooks,
          ),
        ],
      ),
      body: Buku.isEmpty
      ? const Center(child: CircularProgressIndicator())
      : ListView.builder(
        itemCount: Buku.length,
        itemBuilder: (context, index) {  
          final book = Buku[index];
          return ListTile(
            title: Text(book['judul'] ?? 'No judul', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(book['penulis'] ?? 'No penulis', style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),),
                Text(book['deskripsi'] ?? 'No deskripsi', style: TextStyle(fontSize: 12),),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: const Icon(Icons.edit, color: Colors.blue),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {},
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}