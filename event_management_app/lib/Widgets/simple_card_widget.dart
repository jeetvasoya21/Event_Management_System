import 'package:flutter/material.dart';
import 'package:event_management_app/Widgets/event_class.dart';

class SimpleCardWidget extends StatelessWidget {

  final MyData e;

  const SimpleCardWidget({
    super.key,
    required this.e,
  });

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;

    double imageHeight;

    if (screenWidth > 1200) {
      imageHeight = 120;
    } else if (screenWidth > 600) {
      imageHeight = 150;
    } else {
      imageHeight = screenWidth * 0.32;
    }

    return Container(

      decoration: BoxDecoration(

        color: const Color.fromARGB(255, 20, 30, 48),

        borderRadius: BorderRadius.circular(18),

        border: Border.all(
          color: const Color(0xFF81D4FA).withAlpha((0.12*255).round()),
        ),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha((0.28*255).round()),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),

      child: Padding(
        padding: const EdgeInsets.all(14),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            /// IMAGE
            ClipRRect(
              borderRadius: BorderRadius.circular(14),

              child: SizedBox(
                width: double.infinity,
                height: imageHeight,

                child: Stack(
                  children: [

                    Image.asset(
                      'assets/placeholder.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),

                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,

                          colors: [
                            Colors.transparent,
                            Colors.black.withAlpha((0.22*255).round()),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            /// TITLE
            Text(
              e.name,

              maxLines: 1,
              overflow: TextOverflow.ellipsis,

              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFFB3E5FC),
              ),
            ),

            const SizedBox(height: 10),

            /// COLLEGE + DEPARTMENT
            Row(
              children: [

                Expanded(
                  child: infoItem(
                    Icons.apartment,
                    e.college,
                  ),
                ),

                const SizedBox(width: 8),

                Expanded(
                  child: infoItem(
                    Icons.school,
                    e.department,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            /// DATE + LOCATION
            Row(
              children: [

                Expanded(
                  child: infoItem(
                    Icons.date_range,
                    e.date
                        .toString()
                        .split(' ')[0]
                        .split('-')
                        .reversed
                        .join('-'),
                  ),
                ),

                const SizedBox(width: 8),

                Expanded(
                  child: infoItem(
                    Icons.location_on,
                    e.location,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            /// TAGLINE
            Expanded(
              child: Container(

                width: double.infinity,

                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),

                decoration: BoxDecoration(
                  color: Colors.white.withAlpha((0.04*255).round()),

                  borderRadius: BorderRadius.circular(12),

                  border: Border.all(
                    color: Colors.white.withAlpha((0.05*255).round()),
                  ),
                ),

                child: Text(
                  e.tagline,

                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,

                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF81D4FA),
                    height: 1.4,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget infoItem(IconData icon, String text) {

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [

        Container(
          padding: const EdgeInsets.all(5),

          decoration: BoxDecoration(
            color: const Color(0xFF81D4FA).withAlpha((0.12*255).round()),
            borderRadius: BorderRadius.circular(8),
          ),

          child: Icon(
            icon,
            size: 14,
            color: const Color(0xFF81D4FA),
          ),
        ),

        const SizedBox(width: 6),

        Expanded(
          child: Text(
            text,

            maxLines: 1,
            overflow: TextOverflow.ellipsis,

            style: const TextStyle(
              fontSize: 13,
              color: Colors.white70,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}