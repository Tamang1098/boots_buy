// import 'package:flutter/material.dart';
//
// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Boots Buy'),
//         centerTitle: true,
//         actions: const [
//           Padding(
//             padding: EdgeInsets.only(right: 12),
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Promotional Banner
//               Container(
//                 height: 200,
//
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   image: const DecorationImage(
//                     image: AssetImage('assets/images/banner.png'),
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//
//               const Text(
//                 'Categories',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 12),
//
//               // // Horizontal Categories
//               SizedBox(
//                 height: 45,
//                 child: ListView(
//                   scrollDirection: Axis.horizontal,
//
//                   children: [
//                     Image.asset('assets/logo/adidas_logo.png'),
//                     const SizedBox(width: 25,),
//                     Image.asset('assets/logo/puma_logo.png'),
//                     const SizedBox(width: 25,),
//                     Image.asset('assets/logo/nike_logo.png'),
//
//
//                   ],
//                 ),
//               ),
//
//
//
//
//               const SizedBox(height: 20),
//
//               const Text(
//                 'Recommended for You',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 12),
//
//               // Grid of Products
//               GridView.count(
//                 crossAxisCount: 2,
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 mainAxisSpacing: 12,
//                 crossAxisSpacing: 12,
//                 childAspectRatio: 0.75,
//                 children: List.generate(4, (index) {
//                   return productCard(
//                     image: 'assets/images/boot${index + 1}.jpg',
//                     name: 'Boots Buy',
//                     price: '\$${(index + 1) * 2}.99',
//                   );
//                 }),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget categoryCard(IconData icon, String label) {
//     return Container(
//       margin: const EdgeInsets.only(right: 12),
//       width: 80,
//       decoration: BoxDecoration(
//         color: Colors.deepOrange.shade100,
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(icon, size: 28, color: Colors.deepOrange),
//           const SizedBox(height: 6),
//           Text(
//             label,
//             style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
//           ),
//         ],
//       ),
//     );
//   }
//
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
//               fit: BoxFit.cover
//               ,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(name,
//                     style: const TextStyle(
//                         fontWeight: FontWeight.bold, fontSize: 15)),
//                 const SizedBox(height: 4),
//                 Text(price,
//                     style: TextStyle(
//                         color: Colors.deepOrange.shade700,
//                         fontWeight: FontWeight.bold)),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
//
//
//
//
//













import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Boots Buy'),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Promotional Banner
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/banner.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'Categories',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              // Horizontal Categories
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
                  ],
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Recommended for You',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),

              // Responsive Grid of Products
              LayoutBuilder(
                builder: (context, constraints) {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 250,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return productCard(
                        image: 'assets/images/boot${index + 1}.jpg',
                        name: 'Boots Buy',
                        price: '\$${(index + 1) * 2}.99',
                      );
                    },
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
    required String image,
    required String name,
    required String price,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(2, 2),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.asset(
              image,
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: TextStyle(
                    color: Colors.deepOrange.shade700,
                    fontWeight: FontWeight.bold,
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
