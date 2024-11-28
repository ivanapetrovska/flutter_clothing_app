import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clothing Shop',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Colors.grey[200],
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.black87),
        ),
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  final List<Map<String, String>> products = [
    {
      'name': 'T-Shirt',
      'price': '899 MKD',
      'description': 'A comfortable cotton T-shirt.',
      'image': 'assets/images/t-shirt.png',
    },
    {
      'name': 'Jeans',
      'price': '1899 MKD',
      'description': 'Stylish denim jeans.',
      'image': 'assets/images/jeans.png',
    },
    {
      'name': 'Jacket',
      'price': '3999 MKD',
      'description': 'A warm winter jacket.',
      'image': 'assets/images/jacket.png',
    },
    {
      'name': 'Shoes',
      'price': '2599 MKD',
      'description': 'Comfortable sports shoes.',
      'image': 'assets/images/shoes.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('203148'),
        backgroundColor: Colors.teal,
        elevation: 4.0,
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              contentPadding: EdgeInsets.all(10.0),
              leading: Image.asset(
                product['image']!,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(product['name']!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Price: ${product['price']}'),
                  SizedBox(height: 4),
                  Text('Description: ${product['description']}'),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(product: product),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  final Map<String, String> product;

  ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product['name']!),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              product['image']!,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(product['name']!, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Price: ${product['price']}'),
            SizedBox(height: 8),
            Text('Description:'),
            SizedBox(height: 8),
            Text(product['description']!),
          ],
        ),
      ),
    );
  }
}
