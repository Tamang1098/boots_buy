// import 'package:boots_buy/features/auth/presentation/view/View/login.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:boots_buy/features/auth/presentation/view_model/login_viewmodel/login_viewmodel.dart';
// import 'package:boots_buy/app/service_locator/service_locator.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   TextEditingController searchController = TextEditingController();

//   List<Map<String, String>> allProducts = [
//     {
//       "image": "assets/images/adidascopa.jpg",
//       "name": "Adidas Copa",
//       "price": "NPR:5,199",
//     },
//     {
//       "image": "assets/images/cr7-lunaboot.jpg",
//       "name": "CR7-LunaBoot",
//       "price": "NPR:2,699",
//     },
//     {
//       "image": "assets/images/nikeboost.jpg",
//       "name": "Nike Boost",
//       "price": "NPR:3,199",
//     },
//     {
//       "image": "assets/images/pumaonesyn.png",
//       "name": "Puma OneSYN",
//       "price": "NPR:4,399",
//     },

//     {
//       "image": "assets/images/cr7-superflycleats.jpg",
//       "name": "CR7-SuperFlyCleats",
//       "price": "NPR:7,499",
//     },
//     {
//       "image": "assets/images/nikefly.jpg",
//       "name": "Nike Fly",
//       "price": "NPR:3,299",
//     },
//     {
//       "image": "assets/images/pumaxseries.jpg",
//       "name": "Puma X-Series",
//       "price": "NPR:3,750",
//     },
//     {
//       "image": "assets/images/adidaspro.png",
//       "name": "Adidas Pro",
//       "price": "NPR:5,765",
//     },
//     {
//       "image": "assets/images/nikeluna.jpg",
//       "name": "Nike Luna",
//       "price": "NPR:4,689",
//     },
//     {
//       "image": "assets/images/pumazoom.jpg",
//       "name": "Puma Zoom",
//       "price": "NPR:7,355",
//     },


//   ];

//   String searchQuery = '';

//   void _logout(BuildContext context) {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (context) => BlocProvider<LoginViewModel>(
//           create: (_) => serviceLocator<LoginViewModel>(),
//           child: const LoginScreen(),
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<Map<String, String>> filteredProducts = allProducts
//         .where((product) => product['name']!
//         .toLowerCase()
//         .contains(searchQuery.toLowerCase()))
//         .toList();

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Boots Buy'),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.logout),
//             onPressed: () => _logout(context),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Search Bar


//               // Promotional Banner
//               Container(
//                 height: 200,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   image: const DecorationImage(
//                     image: AssetImage('assets/images/banner.png'),
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 controller: searchController,
//                 decoration: InputDecoration(
//                   hintText: 'Search by brand...',
//                   prefixIcon: const Icon(Icons.search),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                 ),
//                 onChanged: (value) {
//                   setState(() {
//                     searchQuery = value;
//                   });
//                 },
//               ),
//               const SizedBox(height: 16),

//               const Text(
//                 'Available Brands',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 20),

//               SizedBox(
//                 height: 45,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//                   children: [

//                     Image.asset('assets/logo/adidas_logo.png'),
//                     const SizedBox(width: 25),
//                     Image.asset('assets/logo/puma_logo.png'),
//                     const SizedBox(width: 25),
//                     Image.asset('assets/logo/nike_logo.png'),
//                     const SizedBox(width: 25),
//                     Image.asset('assets/logo/cr7_logo.png'),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),

//               const Text(
//                 'Recommended for You',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 12),

//               LayoutBuilder(
//                 builder: (context, constraints) {
//                   return GridView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: filteredProducts.length,
//                     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                       maxCrossAxisExtent: 250,
//                       mainAxisSpacing: 12,
//                       crossAxisSpacing: 12,
//                       childAspectRatio: 0.75,
//                     ),
//                     itemBuilder: (context, index) {
//                       final product = filteredProducts[index];
//                       return productCard(
//                         image: product['image']!,
//                         name: product['name']!,
//                         price: product['price']!,
//                       );
//                     },
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget productCard({
//     required String image,
//     required String name,
//     required String price,
//   }) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 4,
//             offset: Offset(2, 2),
//           )
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
//             child: Image.asset(
//               image,
//               height: 140,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   name,
//                   style: const TextStyle(
//                       fontWeight: FontWeight.bold, fontSize: 15),
//                 ),
//                 const SizedBox(height: 4),
//                 Text(
//                   price,
//                   style: TextStyle(
//                     color: Colors.deepOrange.shade700,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:boots_buy/features/auth/presentation/view/View/login.dart';
import 'package:boots_buy/features/auth/presentation/view_model/login_viewmodel/login_viewmodel.dart';
import 'package:boots_buy/app/service_locator/service_locator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  List<Map<String, String>> allProducts = [
    {"image": "assets/images/adidascopa.jpg", "name": "Adidas Copa", "price": "5199"},
    {"image": "assets/images/cr7-lunaboot.jpg", "name": "CR7-LunaBoot", "price": "2699"},
    {"image": "assets/images/nikeboost.jpg", "name": "Nike Boost", "price": "3199"},
    {"image": "assets/images/pumaonesyn.png", "name": "Puma OneSYN", "price": "4399"},
    {"image": "assets/images/cr7-superflycleats.jpg", "name": "CR7-SuperFlyCleats", "price": "7499"},
    {"image": "assets/images/nikefly.jpg", "name": "Nike Fly", "price": "3299"},
    {"image": "assets/images/pumaxseries.jpg", "name": "Puma X-Series", "price": "3750"},
    {"image": "assets/images/adidaspro.png", "name": "Adidas Pro", "price": "5765"},
    {"image": "assets/images/nikeluna.jpg", "name": "Nike Luna", "price": "4689"},
    {"image": "assets/images/pumazoom.jpg", "name": "Puma Zoom", "price": "7355"},
  ];

  String searchQuery = '';

  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => BlocProvider<LoginViewModel>(
          create: (_) => serviceLocator<LoginViewModel>(),
          child: const LoginScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int gridCount = screenWidth > 900
        ? 4
        : screenWidth > 600
            ? 3
            : 2;

    List<Map<String, String>> filteredProducts = allProducts
        .where((product) =>
            product['name']!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Boots Buy'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: screenWidth > 600 ? 250 : 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/banner.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Search by brand...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onChanged: (value) => setState(() => searchQuery = value),
              ),
              const SizedBox(height: 16),
              const Text('Available Brands',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              SizedBox(
                height: 45,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Image.asset('assets/logo/adidas_logo.png'),
                    const SizedBox(width: 25),
                    Image.asset('assets/logo/puma_logo.png'),
                    const SizedBox(width: 25),
                    Image.asset('assets/logo/nike_logo.png'),
                    const SizedBox(width: 25),
                    Image.asset('assets/logo/cr7_logo.png'),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Text('Recommended for You',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 12),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredProducts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: gridCount,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return productCard(
                    context: context,
                    image: product['image']!,
                    name: product['name']!,
                    price: product['price']!,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget productCard({
    required BuildContext context,
    required String image,
    required String name,
    required String price,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              image,
              height: 120,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 4),
                Text("NPR: $price",
                    style: TextStyle(
                        color: Colors.deepOrange.shade700,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white
                      
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ViewProductScreen(
                            image: image,
                            name: name,
                            price: int.parse(price),
                          ),
                        ),
                      );
                    },
                    child: const Text("View Product"),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ViewProductScreen extends StatefulWidget {
  final String image;
  final String name;
  final int price;

  const ViewProductScreen({
    super.key,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  State<ViewProductScreen> createState() => _ViewProductScreenState();
}

class _ViewProductScreenState extends State<ViewProductScreen> {
  int quantity = 1;
  int selectedSize = 6;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int totalPrice = widget.price * quantity;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Image.asset(widget.image,
                        height: screenWidth > 600 ? 280 : 300),
                    const SizedBox(height: 16),
                    Text(widget.name,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text("Price: NPR ${widget.price}",
                        style: const TextStyle(fontSize: 18)),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Quantity:"),
                        IconButton(
                          icon: const Icon(Icons.remove_circle_outline),
                          onPressed:
                              quantity > 1 ? () => setState(() => quantity--) : null,
                        ),
                        Text('$quantity', style: const TextStyle(fontSize: 16)),
                        IconButton(
                          icon: const Icon(Icons.add_circle_outline),
                          onPressed: () => setState(() => quantity++),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Size:"),
                        const SizedBox(width: 12),
                        DropdownButton<int>(
                          value: selectedSize,
                          items: [6, 7, 8, 9]
                              .map((size) => DropdownMenuItem(
                                  value: size, child: Text('$size')))
                              .toList(),
                          onChanged: (value) =>
                              setState(() => selectedSize = value ?? 6),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text("Total: NPR $totalPrice",
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Product added to cart!')));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child:
                    const Text("Add to Cart", style: TextStyle(fontSize: 16)),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
