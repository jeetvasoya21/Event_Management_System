import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    final avatarRadius = size.width * 0.16;

    final double nameFont =
        (size.width * 0.056).clamp(18.0, 28.0);

    final double roleFont =
        (size.width * 0.04).clamp(12.0, 18.0);

    final double sectionTitleFont =
        (size.width * 0.045).clamp(16.0, 20.0);

    final double infoValueFont =
        (size.width * 0.04).clamp(14.0, 18.0);

    return SingleChildScrollView(

      child: Container(

        width: double.infinity,

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

        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.06,
            vertical: size.height * 0.03,
          ),

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              SizedBox(height: size.height * 0.02),

              /// PROFILE AVATAR
              Container(

                decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha((0.3*255).round()),
                      blurRadius: 14,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),

                child: CircleAvatar(

                  radius: avatarRadius.clamp(46.0, 74.0),

                  backgroundColor:
                      const Color.fromARGB(255, 20, 30, 48),

                  child: Icon(
                    Icons.person,

                    size:
                        (avatarRadius * 1.02).clamp(46.0, 74.0),

                    color: const Color(0xFF81D4FA),
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.025),

              /// USER NAME
              Text(
                'User Name',

                style: TextStyle(
                  fontSize: nameFont,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFB3E5FC),
                  letterSpacing: 0.4,
                ),
              ),

              const SizedBox(height: 6),

              /// ROLE
              Text(
                'Student',

                style: TextStyle(
                  fontSize: roleFont,
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: size.height * 0.035),

              /// DETAILS CARD
              Container(

                decoration: BoxDecoration(

                  color: const Color.fromARGB(255, 20, 30, 48),

                  borderRadius: BorderRadius.circular(22),

                  border: Border.all(
                    color:
                        const Color(0xFF81D4FA).withAlpha((0.12*255).round()),
                  ),

                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha((0.25*255).round()),
                      blurRadius: 12,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),

                child: Padding(
                  padding: const EdgeInsets.all(20),

                  child: Column(

                    crossAxisAlignment:
                        CrossAxisAlignment.start,

                    children: [

                      /// TITLE
                      Text(
                        'Personal Details',

                        style: TextStyle(
                          fontSize: sectionTitleFont,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFFB3E5FC),
                        ),
                      ),

                      const SizedBox(height: 20),

                      profileInfoRow(
                        Icons.email_outlined,
                        'Email',
                        'email@example.com',
                        infoValueFont,
                      ),

                      const SizedBox(height: 16),

                      profileInfoRow(
                        Icons.phone_outlined,
                        'Phone',
                        '+91 98765 43210',
                        infoValueFont,
                      ),

                      const SizedBox(height: 16),

                      profileInfoRow(
                        Icons.school_outlined,
                        'Department',
                        'Computer Science',
                        infoValueFont,
                      ),

                      const SizedBox(height: 16),

                      profileInfoRow(
                        Icons.badge,
                        'ID Number',
                        '1234',
                        infoValueFont,
                      ),

                      const SizedBox(height: 16),

                      profileInfoRow(
                        Icons.apartment_outlined,
                        'College',
                        'College 1',
                        infoValueFont,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.035),

              /// LOGOUT BUTTON
              SizedBox(

                width: double.infinity,

                child: ElevatedButton.icon(

                  onPressed: () {
                    // Logout logic
                  },

                  icon: const Icon(
                    Icons.logout,
                    color: Color.fromARGB(255, 21, 0, 46),
                  ),

                  label: const Text(
                    'Logout',

                    style: TextStyle(
                      color: Color.fromARGB(255, 21, 0, 46),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),

                  style: ElevatedButton.styleFrom(

                    elevation: 6,

                    backgroundColor:
                        const Color(0xFF81D4FA),

                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),

              SizedBox(height: size.height * 0.02),
            ],
          ),
        ),
      ),
    );
  }
}

Widget profileInfoRow(
  IconData icon,
  String label,
  String value,
  double fontSize,
) {

  return Row(

    crossAxisAlignment: CrossAxisAlignment.start,

    children: [

      Container(

        padding: const EdgeInsets.all(7),

          decoration: BoxDecoration(
          color: const Color(0xFF81D4FA).withAlpha((0.12*255).round()),
          borderRadius: BorderRadius.circular(10),
        ),

        child: Icon(
          icon,
          color: const Color(0xFF81D4FA),
          size: 18,
        ),
      ),

      const SizedBox(width: 14),

      Expanded(
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [

            Text(
              label,

              style: TextStyle(
                fontSize: fontSize * 0.82,
                color: Colors.white60,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 3),

            Text(
              value,

              maxLines: 2,
              overflow: TextOverflow.ellipsis,

              style: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}