import 'package:flutter/material.dart';
import 'package:stock_management/models/product_model.dart';
import 'package:stock_management/widgets/default_scaffold.dart';
import 'sales_form.dart';

class SalesScreen extends StatefulWidget {
  const SalesScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SalesScreenState();
  }
}

class _SalesScreenState extends State<SalesScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultScaffold(
      floatingButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SalesForm()),
              );},
      ),
      title: "View Sales",
      body: Container(
        width: double.infinity,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration( 
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.3),
              spreadRadius: 4,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
      
        child: DataTable(
        columnSpacing: 16,
        columns: const [
          DataColumn(
            label: Text(
              'Product',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              'Actions',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              'Quantity',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          DataColumn(
            label: Text(
              'Price',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
        rows: [
          DataRow(cells: [
            DataCell(Text('Product 1')),
           DataCell(GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SalesForm()),
              );
            },
            child: Row(
              children: [
                Icon(Icons.edit),
                SizedBox(width: 5),
                Text('Edit'),
                 IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
              ],
            ),
          )),

            const DataCell(Text(
              '10',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            const DataCell(Text(
              '\$100',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ]),

          DataRow(cells: [
            DataCell(Text('Product 2')),
            DataCell(GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SalesForm()),
              );
            },
            child: Row(
              children: [
                Icon(Icons.edit),
                SizedBox(width: 5),
                Text('Edit'),
                 IconButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
              ],
            ),
          )),
            const DataCell(Text(
              '5',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
            const DataCell(Text(
              '\$50',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
          ]),
        ],
      ),
      ),
    );
  }
}

