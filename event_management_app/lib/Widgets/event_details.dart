import 'package:event_management_app/Widgets/event_class.dart';
import 'package:flutter/material.dart';


  final MyData myData;
  final void Function(MyData) removeEvent;

  const EventDetails({
    super.key,
    required this.myData,
    required this.removeEvent,
  });


class EventDetails extends StatelessWidget {
  final MyData myData;
  final int index;

  const EventDetails({super.key, required this.myData, required this.index});
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

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Color.fromARGB(245, 39, 2, 88),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                const Text(
                  'Event Details',
                  style: TextStyle(
                    color: Color.fromARGB(245, 39, 2, 88),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),

            Container(
              width: double.infinity,
              height: imageHeight,
              decoration: const BoxDecoration(color: Colors.white),
              child: Image(
                image: myData.image.image,
                width: double.infinity,
                height: imageHeight,
                fit: BoxFit.cover,
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
                    myData.tagline,
                    style: TextStyle(
                      fontSize: descriptionFontSize,
                      color: Colors.grey,
                      height: 1.6,
                    ),
                  ),
                  SizedBox(height: padding * 1.5),
                  Text(
                    myData.description,
                    style: TextStyle(
                      fontSize: descriptionFontSize,
                      color: Colors.black87,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Event Info
                  eventInfoRow(
                    Icons.apartment,
                    'College',
                    myData.college,
                    infoFontSize,
                  ),
                  SizedBox(height: padding),
                  eventInfoRow(
                    Icons.school,
                    'Department',
                    myData.department,
                    infoFontSize,
                  ),
                  SizedBox(height: padding),
                  eventInfoRow(
                    Icons.date_range,
                    'Date',
                    myData.date!.toString().split(' ')[0],
                    infoFontSize,
                  ),
                  SizedBox(height: padding),
                  eventInfoRow(
                    Icons.location_on,
                    'Location',
                    myData.location,
                    infoFontSize,
                  ),
                  SizedBox(height: padding * 1.75),
                  eventInfoRow(
                    Icons.info,
                    'Registration Info',
                    myData.registrationInfo,
                    infoFontSize,
                  ),
                  SizedBox(height: padding),

                  // Action Buttons
                  Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            myData.registrationLink; // Handle registration link tap
                          },
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
                                  const Icon(
                                    Icons.check_circle,
                                    color: Colors.white,
                                    size: 20,
                                  ),
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
                      ),
                      SizedBox(width: padding),
                      InkWell(
                        onTap: () async {
                          // Handle edit event tap
                          await Navigator.pushNamed(
                            context,
                            '/edit-event',
                            arguments: {
                              'index': index,
                              'event': myData,
                            },
                          );
                          if (context.mounted) {
      Navigator.pop(context);
    }
                        },
                        
                        child:Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color.fromARGB(245, 39, 2, 88),
                            width: 2,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: padding,
                            horizontal: padding * 0.75,
                          ),
                          child: const Icon(
                            Icons.edit,
                            color: Color.fromARGB(245, 39, 2, 88),
                            size: 22,
                          ),
                        ),
                      ),
                      ),
                      const SizedBox(width: 12),
                      InkWell(
                        onTap: () {
                          final pageContext = context;

                          showDialog(
                            context: pageContext,
                            builder: (dialogContext) => AlertDialog(
                              title: const Text('Delete Event'),
                              content: const Text(
                                'Are you sure you want to delete this event?',
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(dialogContext),
                                  child: const Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    removeEvent(myData);

                                    // Close dialog
                                    Navigator.pop(dialogContext);

                                    // Close EventDetails page
                                    Navigator.pop(pageContext);
                                  },
                                  child: const Text(
                                    'Delete',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: const Color.fromARGB(245, 39, 2, 88),
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: padding,
                              horizontal: padding * 0.75,
                            ),
                            child: const Icon(
                              Icons.delete,
                              color: Color.fromARGB(245, 39, 2, 88),
                              size: 22,
                            ),
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Navigator.pushNamed(
      //     //   context,
      //     //   '/edit-event',
      //     //   arguments: {'index': index, 'event': myDataList[index]},
      //     // );
      //   },
      //   backgroundColor: const Color.fromARGB(245, 39, 2, 88),
      //   child: const Icon(Icons.edit, color: Colors.white),
      // ),
    );
  }

  Widget eventInfoRow(
    IconData icon,
    String label,
    String value,
    double fontSize,
  ) {
    return Row(
      children: [
        Icon(icon, color: const Color.fromARGB(245, 39, 2, 88), size: 20),
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
