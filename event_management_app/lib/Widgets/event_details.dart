import 'package:event_management_app/Widgets/my_events.dart';
import 'package:flutter/material.dart';

class EventDetails extends StatelessWidget {

  final MyData myData;


  const EventDetails({
    super.key,
    required this.myData,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    // Responsive values
    double imageHeight = screenHeight * 0.25;
    double titleFontSize = screenWidth > 600 ? 28 : 24;
    double descriptionFontSize = screenWidth > 600 ? 14 : 13;
    double infoFontSize = screenWidth > 600 ? 14 : 13;
    double padding = screenWidth > 600 ? 16.0 : 12.0;
    
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FB),
      appBar: AppBar(
        title: Text(
          myData.name,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: screenWidth > 600 ? 18 : 16,
          ),
        ),
        backgroundColor: const Color.fromARGB(245, 39, 2, 88),
        elevation: 2,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Container(
              width: double.infinity,
              height: imageHeight,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: FittedBox(
                fit: BoxFit.cover,
                child: myData.image,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    myData.name,
                    style: TextStyle(
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(245, 39, 2, 88),
                    ),
                  ),
                  SizedBox(height: padding),

                  // Description
                  Text(
                    myData.description,
                    style: TextStyle(
                      fontSize: descriptionFontSize,
                      color: Colors.grey,
                      height: 1.6,
                    ),
                  ),
                  SizedBox(height: padding * 1.5),

                  // Event Info
                  eventInfoRow(Icons.apartment, 'College', myData.college, infoFontSize),
                  SizedBox(height: padding),
                  eventInfoRow(Icons.school, 'Department', myData.department, infoFontSize),
                  SizedBox(height: padding),
                  eventInfoRow(Icons.date_range, 'Date', myData.date!.toString(), infoFontSize),
                  SizedBox(height: padding),
                  eventInfoRow(Icons.location_on, 'Location', myData.location, infoFontSize),
                  SizedBox(height: padding * 1.75),
                  eventInfoRow(Icons.info, 'Registration Info', myData.registrationInfo, infoFontSize),
                  SizedBox(height: padding),

                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(245, 39, 2, 88),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: padding),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(Icons.check_circle, color: Colors.white, size: 20),
                                SizedBox(width: padding * 0.5),
                                Text(
                                  'Register',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: infoFontSize,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: padding),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color.fromARGB(245, 39, 2, 88),
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: padding, horizontal: padding * 0.75),
                          child: const Icon(
                            Icons.share,
                            color: Color.fromARGB(245, 39, 2, 88),
                            size: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget eventInfoRow(IconData icon, String label, String value, double fontSize) {
    return Row(
      children: [
        Icon(
          icon,
          color: const Color.fromARGB(245, 39, 2, 88),
          size: 20,
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: fontSize * 0.85,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              value,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
}
}