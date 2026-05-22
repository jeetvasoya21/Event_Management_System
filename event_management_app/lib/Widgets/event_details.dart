import 'package:event_management_app/Widgets/event_class.dart';
import 'package:flutter/material.dart';




class EventDetails extends StatelessWidget {

  final MyData myData;
  final int index;
  final Function(MyData) removeEvent;

  const EventDetails({super.key, required this.myData, required this.index,required this.removeEvent});
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
  backgroundColor: const Color(0xFF081B2A),

  body: Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromARGB(255, 1, 36, 57),
          Color.fromARGB(228, 21, 0, 46),
        ],
      ),
    ),

    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// TOP BAR
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color(0xFF81D4FA),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),

                  const Text(
                    'Event Details',
                    style: TextStyle(
                      color: Color(0xFF81D4FA),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// IMAGE
          Container(
            width: double.infinity,
            height: imageHeight,

            margin: const EdgeInsets.symmetric(horizontal: 12),

            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha((0.35*255).round()),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),

            clipBehavior: Clip.antiAlias,

            child: Image(
              image: myData.image.image,
              width: double.infinity,
              height: imageHeight,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: EdgeInsets.all(padding),

            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 20, 30, 48),

                borderRadius: BorderRadius.circular(22),

                border: Border.all(
                  color: const Color(0xFF81D4FA).withAlpha((0.15*255).round()),
                ),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha((0.25*255).round()),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),

              child: Padding(
                padding: EdgeInsets.all(padding),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    /// TITLE
                    Text(
                      myData.name,
                      style: TextStyle(
                        fontSize: titleFontSize,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFFB3E5FC),
                      ),
                    ),

                    SizedBox(height: padding),

                    /// TAGLINE
                    Text(
                      myData.tagline,
                      style: TextStyle(
                        fontSize: descriptionFontSize,
                        color: const Color(0xFF81D4FA),
                        height: 1.6,
                        fontStyle: FontStyle.italic,
                      ),
                    ),

                    SizedBox(height: padding * 1.5),

                    /// DESCRIPTION
                    Text(
                      myData.description,
                      style: TextStyle(
                        fontSize: descriptionFontSize,
                        color: Colors.white.withAlpha((0.9*255).round()),
                        height: 1.7,
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// EVENT INFO
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

                    SizedBox(height: padding * 1.5),

                    /// BUTTONS
                    Row(
                      children: [

                        /// REGISTER BUTTON
                        Expanded(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(14),

                            onTap: () {
                              myData.registrationLink;
                            },

                            child: Container(
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFF81D4FA),
                                    Color.fromARGB(255, 0, 180, 216),
                                  ],
                                ),

                                borderRadius: BorderRadius.circular(14),

                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withAlpha((0.25*255).round()),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),

                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: padding,
                                ),

                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.center,

                                  children: [
                                    const Icon(
                                      Icons.check_circle,
                                      color: Color.fromARGB(255, 21, 0, 46),
                                      size: 20,
                                    ),

                                    SizedBox(width: padding * 0.5),

                                    Text(
                                      'Register',
                                      style: TextStyle(
                                        color:
                                            const Color.fromARGB(255, 21, 0, 46),
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

                        /// EDIT BUTTON
                        InkWell(
                          borderRadius: BorderRadius.circular(12),

                          onTap: () async {
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

                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 20, 30, 48),

                              borderRadius: BorderRadius.circular(12),

                              border: Border.all(
                                color: const Color(0xFF81D4FA),
                                width: 1.5,
                              ),
                            ),

                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: padding,
                                horizontal: padding * 0.75,
                              ),

                              child: const Icon(
                                Icons.edit,
                                color: Color(0xFF81D4FA),
                                size: 22,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),

                        /// DELETE BUTTON
                        InkWell(
                          borderRadius: BorderRadius.circular(12),

                          onTap: () {
                            final pageContext = context;

                            showDialog(
                              context: pageContext,

                              builder: (dialogContext) => AlertDialog(
                                backgroundColor:
                                    const Color.fromARGB(255, 20, 30, 48),

                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),

                                title: const Text(
                                  'Delete Event',
                                  style: TextStyle(
                                    color: Color(0xFFB3E5FC),
                                  ),
                                ),

                                content: const Text(
                                  'Are you sure you want to delete this event?',
                                  style: TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),

                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(dialogContext),

                                    child: const Text(
                                      'Cancel',
                                      style: TextStyle(
                                        color: Color(0xFF81D4FA),
                                      ),
                                    ),
                                  ),

                                  TextButton(
                                    onPressed: () {
                                      removeEvent(myData);

                                      Navigator.pop(dialogContext);

                                      Navigator.pop(pageContext);
                                    },

                                    child: const Text(
                                      'Delete',
                                      style: TextStyle(
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },

                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 20, 30, 48),

                              borderRadius: BorderRadius.circular(12),

                              border: Border.all(
                                color: Colors.redAccent.withAlpha((0.7*255).round()),
                                width: 1.5,
                              ),
                            ),

                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: padding,
                                horizontal: padding * 0.75,
                              ),

                              child: const Icon(
                                Icons.delete,
                                color: Colors.redAccent,
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
            ),
          ),
        ],
      ),
    ),
  ),
);
  }
Widget eventInfoRow(
  IconData icon,
  String label,
  String value,
  double fontSize,
) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,

    children: [
      Icon(
        icon,
        color: const Color(0xFF81D4FA),
        size: 20,
      ),

      const SizedBox(width: 12),

      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: fontSize * 0.85,
                color: Colors.white60,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              value,
              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),

              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    ],
  );
}
}