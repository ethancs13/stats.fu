import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainShell extends StatelessWidget {
  const MainShell({super.key, required this.child});

  final Widget child;

  static const _tabs = [
    _Tab('/home', Icons.home_rounded, Icons.home_outlined, 'Home'),
    _Tab('/stats', Icons.bar_chart_rounded, Icons.bar_chart_outlined, 'Stats'),
    _Tab('/history', Icons.history_rounded, Icons.history_outlined, 'History'),
    _Tab('/friends', Icons.people_rounded, Icons.people_outline_rounded, 'Friends'),
    _Tab('/discover', Icons.explore_rounded, Icons.explore_outlined, 'Discover'),
  ];

  int _locationIndex(BuildContext context) {
    final loc = GoRouterState.of(context).matchedLocation;
    final idx = _tabs.indexWhere((t) => loc.startsWith(t.path));
    return idx < 0 ? 0 : idx;
  }

  @override
  Widget build(BuildContext context) {
    final current = _locationIndex(context);
    return Scaffold(
      body: child,
      bottomNavigationBar: _AnimatedNavBar(
        current: current,
        onTap: (i) => context.go(_tabs[i].path),
        tabs: _tabs,
      ),
    );
  }
}

class _Tab {
  const _Tab(this.path, this.activeIcon, this.inactiveIcon, this.label);
  final String path;
  final IconData activeIcon;
  final IconData inactiveIcon;
  final String label;
}

class _AnimatedNavBar extends StatelessWidget {
  const _AnimatedNavBar({
    required this.current,
    required this.onTap,
    required this.tabs,
  });

  final int current;
  final void Function(int) onTap;
  final List<_Tab> tabs;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF111111),
        border: Border(
          top: BorderSide(color: theme.dividerColor, width: 0.5),
        ),
      ),
      child: SafeArea(
        child: SizedBox(
          height: 60,
          child: Row(
            children: tabs.indexed.map((pair) {
              final (i, tab) = pair;
              final selected = i == current;
              return Expanded(
                child: _NavItem(
                  tab: tab,
                  selected: selected,
                  onTap: () => onTap(i),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.tab,
    required this.selected,
    required this.onTap,
  });

  final _Tab tab;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    const green = Color(0xFF1DB954);
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Icon(
                selected ? tab.activeIcon : tab.inactiveIcon,
                key: ValueKey(selected),
                color: selected ? green : const Color(0xFF6B6B6B),
                size: 24,
              ),
            ),
            const SizedBox(height: 3),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: TextStyle(
                fontSize: 11,
                fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                color: selected ? green : const Color(0xFF6B6B6B),
                letterSpacing: 0.2,
              ),
              child: Text(tab.label),
            ),
          ],
        ),
      ),
    );
  }
}
