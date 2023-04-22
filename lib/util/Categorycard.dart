import 'package:flutter/material.dart';

    class CategoryCard extends StatelessWidget{
      final String categoryName;

      const CategoryCard({super.key,
        required this.categoryName,
    });

      @override
      Widget build(BuildContext context) {
        return Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Container(
            color: Color(0xFF93D9E1),
            padding: EdgeInsets.all(10),
            child: Row(
              children: [
                Text(categoryName,
                style: TextStyle(color: Colors.black87,
                  fontSize: 20,
                ),
                ),

              ],
            ),

          ),

        );
      }
    }