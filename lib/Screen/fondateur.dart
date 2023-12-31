import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Fondateur extends StatefulWidget {
  Fondateur({Key? key}) : super(key: key);

  @override
  State<Fondateur> createState() => _FondateurState();
}

class _FondateurState extends State<Fondateur> {
  List<dynamic> fondateur = [];
  bool _isLoading = false;
  fetchfondateurs() async {
    setState(() {
      _isLoading = true;
    });
    const url = 'http://192.168.223.195/test/vfond.php';
    
    final uri = Uri.parse(url);
    final reponse = await http.get(uri);
    final resultat = jsonDecode(reponse.body);
    fondateur = resultat;
    debugPrint(reponse.body);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchfondateurs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  
      body: 
      
      _isLoading
          ? const Center(
              child: CircularProgressIndicator(color: Colors.blue),
            )
          :
      SingleChildScrollView(
        child: Column(
            children: List.generate(
                fondateur.length,
                (index) => fondateurwidegt(
                    image: fondateur[index]['image'],
                    noms: fondateur[index]['noms'],
                    detail: fondateur[index]['detail']))),
      ),
    );
  }
}

class fondateurwidegt extends StatelessWidget {
  const fondateurwidegt({
    required this.image,
    required this.noms,
    required this.detail,
    Key? key,
  }) : super(key: key);

  final String image;
  final String noms;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.network(
            'http://192.168.223.195/test/postimages/${image}',
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.all(3.0),
            child: Text(
              '${noms}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black,
              ),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
        const SizedBox(
          height: 0.2,
        ),
         Center(
          child: Padding(
            padding: EdgeInsets.all(3.0),
            child: Text(
              'CEO Provide Academy',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.blue.shade400,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                '${detail}',
                style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Colors.black,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        )
      ],
    );
  }
}
