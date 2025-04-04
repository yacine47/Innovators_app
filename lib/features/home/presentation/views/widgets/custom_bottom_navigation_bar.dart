import 'package:flutter/material.dart';
import 'package:linkdin_app/core/utils/app_colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.currrentIndex,
    this.onItemTapped,
  });

  final int currrentIndex;
  final void Function(int)? onItemTapped;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Theme(
        data: Theme.of(context).copyWith(
          splashColor: Colors.transparent, // Removes splash effect
          highlightColor: Colors.transparent, // Removes highlight effect
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 0,
          currentIndex: currrentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryColor,
          onTap: onItemTapped,
          enableFeedback: false, // Disables haptic feedback
          items: [
            BottomNavigationBarItem(
              icon: currrentIndex == 0
                  ? const Icon(Icons.home, size: 25)
                  : const Icon(Icons.home_outlined, size: 25),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: currrentIndex == 1
                  ? const Icon(Icons.card_giftcard, size: 26)
                  : const Icon(Icons.card_giftcard_outlined, size: 26),
              label: 'Contribution',
            ),
            BottomNavigationBarItem(
              icon: currrentIndex == 2
                  ? const Icon(Icons.add_circle_rounded, size: 26)
                  : const Icon(Icons.add_circle_outline_rounded, size: 26),
              label: 'Post',
            ),
            BottomNavigationBarItem(
              icon: currrentIndex == 3
                  ? const Icon(Icons.volunteer_activism, size: 26)
                  : const Icon(Icons.volunteer_activism_outlined, size: 26),
              label: 'Donate',
            ),
            BottomNavigationBarItem(
              icon: currrentIndex == 4
                  ? const Icon(Icons.person, size: 26)
                  : const Icon(Icons.person_outlined, size: 26),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
