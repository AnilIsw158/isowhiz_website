import 'package:isowhiz_website/widgets/imports.dart';

class ResponsiveScaffold extends StatefulWidget {
  final String title;
  final Widget body;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final Widget? drawerContent;
  final bool centerTitle;
  final Color? backgroundColor;
  final PreferredSizeWidget? bottom;
  final double desktopBreakpoint;

  /// Provide items for side menu instead of a full widget
  final List<SideMenuItem>? sideMenuItems;

  const ResponsiveScaffold({
    super.key,
    required this.title,
    required this.body,
    this.actions,
    this.floatingActionButton,
    this.drawerContent,
    this.sideMenuItems,
    this.centerTitle = false,
    this.backgroundColor,
    this.bottom,
    this.desktopBreakpoint = 800,
  });

  @override
  State<ResponsiveScaffold> createState() => _ResponsiveScaffoldState();
}

class _ResponsiveScaffoldState extends State<ResponsiveScaffold> {
  bool isMenuCollapsed = false;

  double get menuWidth => isMenuCollapsed ? 70 : 250;

  bool _isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= widget.desktopBreakpoint;

  @override
  Widget build(BuildContext context) {
    final isDesktop = _isDesktop(context);

    return Scaffold(
      backgroundColor:
          widget.backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      appBar: isDesktop
          ? null
          : CustomAppBar(
              title: widget.title,
              actions: widget.actions,
              bottom: widget.bottom,
              centerTitle: widget.centerTitle,
            ),
      drawer: isDesktop
          ? null
          : (widget.drawerContent != null
                ? Drawer(child: widget.drawerContent!)
                : null),
      body: SafeArea(
        child: Row(
          children: [
            if (isDesktop && widget.sideMenuItems != null)
              AnimatedContainer(
                width: menuWidth,
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  border: Border(
                    right: BorderSide(color: Colors.grey.shade300),
                  ),
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        icon: Icon(
                          isMenuCollapsed
                              ? Icons.arrow_right
                              : Icons.arrow_left,
                        ),
                        onPressed: () {
                          setState(() {
                            isMenuCollapsed = !isMenuCollapsed;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: widget.sideMenuItems!.map((item) {
                          return ListTile(
                            autofocus: true,
                            hoverColor: Theme.of(context).hoverColor,
                            leading: Icon(item.icon),
                            title: isMenuCollapsed ? null : Text(item.label),
                            onTap: item.onTap,
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            Expanded(
              child: Column(
                children: [
                  if (isDesktop)
                    CustomAppBar(
                      title: widget.title,
                      actions: widget.actions,
                      bottom: widget.bottom,
                      centerTitle: widget.centerTitle,
                    ),
                  Expanded(child: widget.body),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: widget.floatingActionButton,
    );
  }
}

/// Side menu item model
class SideMenuItem {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  SideMenuItem({required this.icon, required this.label, required this.onTap});
}
