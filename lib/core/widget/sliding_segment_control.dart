import 'package:flutter/material.dart';

class SlidingSegmentedControl extends StatefulWidget {
  final Function(int)? onSegmentChanged;
  const SlidingSegmentedControl({super.key, this.onSegmentChanged});

  @override
  State<SlidingSegmentedControl> createState() =>
      _SlidingSegmentedControlState();
}

class _SlidingSegmentedControlState extends State<SlidingSegmentedControl> {
  int _selectedIndex = 0;
  final List<String> _options = ['Haftalik', 'Oylik', 'Yillik'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          AnimatedAlign(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            alignment: Alignment(
              (_selectedIndex / (_options.length - 1)) * 2 - 1,
              0,
            ),
            child: FractionallySizedBox(
              heightFactor: 1,
              widthFactor: 1 / _options.length,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: List.generate(_options.length, (index) {
              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() => _selectedIndex = index);
                    widget.onSegmentChanged?.call(index);
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Center(
                    child: Text(
                      _options[index],
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: _selectedIndex == index
                            ? const Color(0xFF3269E1)
                            : const Color(0xFF677689),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
