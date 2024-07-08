import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MEDI PACK',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: AppBarTheme(
          color: Colors.blue, // Change app bar color
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // Simple validation for demonstration
                String username = _usernameController.text.trim();
                String password = _passwordController.text.trim();

                // Perform login validation (dummy validation for now)
                if (username == 'admin' && password == 'password') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Login Failed'),
                        content: Text('Invalid username or password.'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Medicine> medicines = [
    Medicine('Paracetamol', 'Paracetamol is a medicine used to treat mild to moderate pain. Paracetamol can also be used to treat fever (high temperature). Its dangerous to take more than the recommended dose of paracetamol. Paracetamol overdose can damage your liver and cause death.', 20.0,'https://5.imimg.com/data5/SELLER/Default/2022/8/CW/BB/DS/129887935/paracetamol-tablets-500-mg-500x500.jpeg'),
    Medicine('Ibuprofen', ' ibuprofen reduces inflammation, whereas paracetamol doesnt. Because theyre different medicines, they can be used together. This is a particularly good option when there is inflammation e.g sinus pain.', 25.0, 'https://5.imimg.com/data5/SELLER/Default/2023/6/319597573/MH/NE/SR/135658020/ibuprofen-400-mg-bp-tablets.jpg'),
    Medicine('Amoxicillin', 'Amoxicillin is an aminopenicillin created by adding an extra amino group to penicillin to battle antibiotic resistance. The medication is effective against a wide range of gram-positive bacteria, offering additional coverage against some gram-negative organisms compared to penicillin.', 30.0, 'https://5.imimg.com/data5/SELLER/Default/2022/11/AS/PC/DV/38103990/amoxicillin-tablets-500-mg.jpg'),
    Medicine('ColdACT', 'Coldact capsule is a combination medicine used to relieve symptoms of common cold associated with fever, which includes stuffy nose, runny nose, sneezing, congestion. It predominantly relieves symptoms associated with allergic rhinitis, breathing difficulties, coughing, nasal congestion, etc. caused by bronchospasm.', 150.0, 'https://cdn.dotpe.in/longtail/store-items/8163091/mtpxxzKt.webp'),
    Medicine('Cetrizine', 'Cetirizine is a relatively safe and effective medication for treating allergic rhinitis, urticaria, and allergic conjunctivitis. As cetirizine is also available over the counter, prescribers should educate patients on the possible side effects, which include drowsiness, fatigue, and dry mouth.', 152.0, 'https://5.imimg.com/data5/SELLER/Default/2023/5/311971664/FU/KT/PV/11858298/cetirizine-tablet.webp'),
    Medicine('Tetracycline', 'Tetracyclines are used to treat infections and to help control acne. Demeclocycline, doxycycline, and minocycline also may be used for other problems as determined by your doctor. Tetracyclines will not work for colds, flu, or other virus infections', 50.0, 'https://5.imimg.com/data5/SELLER/Default/2023/11/359501814/EZ/RO/IO/118391377/tetracycline-hydrochloride-capsules.jpg'),
    Medicine('metranidazole', 'Metronidazole is used to treat infections of the reproductive system, gastrointestinal (GI) tract, skin, heart, bone, joint, lung, blood, nervous system, and other areas of the body. It is also used to treat certain sexually transmitted diseases (STDs).', 170.0, 'https://i0.wp.com/glenburniedentalgroup.com/wp-content/uploads/2022/10/Metronidazole.webp?fit=847%2C460&ssl=1'),
    Medicine('visine', 'Visine is a brand name covering many formulations of eye drops. The main purpose of them is temporary treatment of eye redness and irritation.', 80.0, 'https://media.post.rvohealth.io/wp-content/uploads/2022/07/2389955-CLONE-Market-The-Best-Dry-Eye-Remedies-Available-Over-the-Counter-732x549-Feature.jpg'),       
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MEDI PACK'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('Profile'),
              onTap: () {
                // Navigate to profile screen or implement action
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.mail),
              title: Text('Contact Us'),
              onTap: () {
                // Navigate to contact us screen or implement action
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.add),
              title: Text('Hospital'),
              onTap: () {
                // Navigate to hospital screen or implement action
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                // Navigate to about screen or implement action
                Navigator.pop(context); // Close the drawer
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoctorDetailPage(
                    doctorName: 'Dr. John Doe',
                    specialty: 'Cardiologist',
                    imagePath:
                        'https://t3.ftcdn.net/jpg/02/60/04/08/360_F_260040863_fYxB1SnrzgJ9AOkcT0hoe7IEFtsPiHAD.jpg', // Replace with actual image URL
                  ),
                ),
              );
            },
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://t3.ftcdn.net/jpg/02/60/04/08/360_F_260040863_fYxB1SnrzgJ9AOkcT0hoe7IEFtsPiHAD.jpg'), // Replace with actual image URL
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  'Dr. John Doe',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoctorDetailPage(
                    doctorName: 'Dr. Jane Smith',
                    specialty: 'Pediatrician',
                    imagePath:
                        'https://t3.ftcdn.net/jpg/03/13/77/82/240_F_313778250_Y0o5can6MA490Nt7G6p03Zfu5fKmWCIv.jpg', // Replace with actual image URL
                  ),
                ),
              );
            },
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://t3.ftcdn.net/jpg/03/13/77/82/240_F_313778250_Y0o5can6MA490Nt7G6p03Zfu5fKmWCIv.jpg'), // Replace with actual image URL
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  'Dr. Jane Smith',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DoctorDetailPage(
                    doctorName: 'Dr. Michael Brown',
                    specialty: 'Dermatologist',
                    imagePath:
                        'https://t3.ftcdn.net/jpg/02/95/51/80/240_F_295518052_aO5d9CqRhPnjlNDTRDjKLZHNftqfsxzI.jpg', // Replace with actual image URL
                  ),
                ),
              );
            },
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(
                      'https://t3.ftcdn.net/jpg/02/95/51/80/240_F_295518052_aO5d9CqRhPnjlNDTRDjKLZHNftqfsxzI.jpg'), // Replace with actual image URL
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  'Dr. Michael Brown',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: medicines.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(
                  medicines[index].imagePath,
                  width: 50,
                  height: 50,
                  fit: BoxFit.cover,
                ),
                title: Text(medicines[index].name),
                subtitle: Text(medicines[index].description),
                trailing: Text('\$${medicines[index].price}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          MedicineDetailPage(medicine: medicines[index]),
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class Medicine {
  final String name;
  final String description;
  final double price;
  final String imagePath;

  Medicine(this.name, this.description, this.price, this.imagePath);
}

class MedicineDetailPage extends StatelessWidget {
  final Medicine medicine;

  MedicineDetailPage({required this.medicine});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(medicine.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              medicine.imagePath,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              medicine.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(medicine.description),
            SizedBox(height: 16),
            Text(
              '\$${medicine.price}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Add medicine to cart
                Cart.addToCart(medicine);
                // Show confirmation message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('${medicine.name} added to cart')),
                );
              },
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}

class Cart {
  static List<Medicine> _cartItems = [];

  static List<Medicine> get cartItems => _cartItems;

  static void addToCart(Medicine medicine) {
    _cartItems.add(medicine);
  }

  static void removeFromCart(Medicine medicine) {
    _cartItems.remove(medicine);
  }

  static double get totalPrice {
    return _cartItems.fold(0, (total, current) => total + current.price);
  }
}

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Cart.cartItems.isEmpty
          ? Center(child: Text('Your cart is empty'))
          : ListView.builder(
              itemCount: Cart.cartItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(Cart.cartItems[index].name),
                  subtitle: Text('\$${Cart.cartItems[index].price}'),
                  trailing: IconButton(
                    icon: Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      Cart.removeFromCart(Cart.cartItems[index]);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content:
                                Text('${Cart.cartItems[index].name} removed from cart')),
                      );
                    },
                  ),
                );
              },
            ),
      bottomNavigationBar: Cart.cartItems.isEmpty
          ? null
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total: \$${Cart.totalPrice}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Order Placed'),
                            content: Text('Thank you for your order!'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('OK'),
                                onPressed: () {
                                  Navigator.of(context)
                                      .popUntil((route) => route.isFirst);
                                },
                              ),
                            ],
                          );
                        },
                      );
                      Cart.cartItems.clear();
                    },
                    child: Text('Book Now'),
                  ),
                ],
              ),
            ),
    );
  }
}

class DoctorDetailPage extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final String imagePath;

  DoctorDetailPage({
    required this.doctorName,
    required this.specialty,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Doctor Details'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                doctorName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                specialty,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
