/*
import 'package:crudapi/screens/add_new_product_screen.dart';
import 'package:flutter/material.dart';
import '../screens/product_list_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //also use Expansiontile
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return productActionDialog(context);//here also given the code with out method Extraction
              */
/*AlertDialog(
                title: const Text('Select action'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: const Text('Edit'),
                      leading: const Icon(Icons.edit),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddNewProductScreen(),
                            ));
                      },
                    ),
                    const Divider(
                      height: 0,
                    ),
                    ListTile(
                      title: Text('Delete'),
                      leading: Icon(Icons.delete),
                      onTap: (){
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              )*//*

            });
      },
      leading: Image.network(
        product.image,
        width: 80,
      ),
      title:  Text(product.productName),
      subtitle:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(product.productCode),
            ],
          ),

          Text('total price : ${product.totalPrice}'),
        ],
      ),
     // trailing: const Text('\$120'),
    );
  }

  AlertDialog productActionDialog(BuildContext context) {
    return AlertDialog(
              title: const Text('Select action'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text('Edit'),
                    leading: const Icon(Icons.edit),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AddNewProductScreen(),
                          ));
                    },
                  ),
                  const Divider(
                    height: 0,
                  ),
                   ListTile(
                    title: Text('Delete'),
                    leading: Icon(Icons.delete),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  )
                ],
              ),
            );
  }
}
*/
import 'package:crudapi/screens/add_new_product_screen.dart';
import 'package:crudapi/screens/product.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {super.key, required this.product, required this.onPressDelete});

  final Product product;
  final Function(String) onPressDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        showDialog(
            context: context,
            builder: (context) {
              return productActionDialog(context);
            });
      },
      leading: Image.network(
        product.image,
        width: 80,
      ),
      title: Text(product.productName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(product.productCode),
          Text('Total price : ${product.totalPRice}'),
          Text('Quantity : ${product.quantity}'),
        ],
      ),
      trailing: Text('\$${product.unitPRice}'),
    );
  }

  AlertDialog productActionDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Select action'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: const Text('Edit'),
            leading: const Icon(Icons.edit),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddNewProductScreen(
                    product: product,
                  ),
                ),
              );
            },
          ),
          const Divider(
            height: 0,
          ),
          ListTile(
            title: const Text('Delete'),
            leading: const Icon(Icons.delete_outline),
            onTap: () {
              Navigator.pop(context);
              onPressDelete(product.id);
            },
          ),
        ],
      ),
    );
  }
}