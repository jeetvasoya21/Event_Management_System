import 'package:flutter/material.dart';

class SimpleCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final Image image;
  final String college;
  final String department;
  final dynamic date;
  final String location;
  

  const SimpleCardWidget({
    super.key,
    required this.title,
    required this.description,
    required this.image,
    required this.college,
    required this.department,
    required this.date,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    
    // Calculate responsive image height based on screen size
    double imageHeight;
    if (screenWidth > 1200) {
      // Web/large tablet: smaller height to prevent overflow
      imageHeight = 120;
    } else if (screenWidth > 600) {
      // Tablet: medium height
      imageHeight = 150;
    } else {
      // Mobile: larger height ratio
      imageHeight = screenWidth * 0.35;
    }

   
        return Container(
          decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 4,
          
            offset: const Offset(0, 2),
          ),
        ],
      ),
        constraints: const BoxConstraints(minHeight: 56),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        
       
        child: 
            Column(

              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                
                SizedBox(
                  width: double.infinity,
                  height: imageHeight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.asset(
                      'assets/placeholder.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                
               Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Icon(Icons.apartment, size: 16, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              college,
                              style: const TextStyle(fontSize: 16, color: Colors.grey),
                             
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                  
                    Expanded(
                      child: Row(
                        children: [
                          Icon(Icons.school, size: 16, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              department,
                              style: const TextStyle(fontSize: 16, color: Colors.grey),
                              
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                ),
                const SizedBox(height: 6),
                
                  Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Icon(Icons.date_range, size: 16, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              date.toString().split(' ')[0].split('-').reversed.join('-'),
                              style: const TextStyle(fontSize: 16, color: Colors.grey),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    
                    Expanded(
                      child: Row(
                        children: [
                          Icon(Icons.location_on, size: 16, color: Colors.grey[600]),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              location,
                              style: const TextStyle(fontSize: 16, color: Colors.grey),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],

                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          
        )
      );
    
  }
}