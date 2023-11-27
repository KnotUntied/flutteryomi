import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

//import 'package:flutteryomi/presentation/browse/extension/extensions.dart';
//import 'package:flutteryomi/presentation/browse/migration/sources/migrate_source.dart';
import 'package:flutteryomi/presentation/browse/source/sources.dart';
import 'package:flutteryomi/presentation/browse/source/sources_filter.dart';
import 'package:flutteryomi/presentation/components/app_bar.dart';
import 'package:flutteryomi/presentation/components/tab_text.dart';
import 'package:flutteryomi/presentation/components/tabbed_content.dart';

final Uri _migrationGuideUrl =
    Uri.parse('https://github.com/KnotUntied/flutteryomi');

class BrowseTab extends StatefulWidget {
  const BrowseTab({super.key});

  @override
  State<BrowseTab> createState() => _BrowseTabState();
}

class _BrowseTabState extends State<BrowseTab>
    with
        AutomaticKeepAliveClientMixin<BrowseTab>,
        SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final lang = AppLocalizations.of(context);
    // Put tab data here instead of separate files as they
    // depend on context
    List<TabContent> tabs = [
      TabContent(
        titleRes: lang.label_sources,
        actions: [
          AppBarAction(
            title: lang.action_global_search,
            iconData: Icons.travel_explore_outlined,
            //onClick: () {
            //  Navigator.push(
            //    context,
            //    MaterialPageRoute(
            //      builder: (context) => GlobalSearchScreen(),
            //    ),
            //  );
            //},
            onClick: () {},
          ),
          AppBarAction(
            title: lang.action_filter,
            iconData: Icons.filter_list,
            onClick: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SourcesFilterScreen(),
                ),
              );
            },
          ),
        ],
        //content: SourcesScreen(
        //  state: state,
        //  onClickItem: (source, listing) {
        //    Navigator.push(
        //      context,
        //      MaterialPageRoute(
        //        builder: (context) => BrowseSourceScreen(source.id, listing.query),
        //      ),
        //    );
        //  },
        //  onClickPin: () {},
        //  onLongClickItem: () {},
        //),
        content: const Placeholder(),
      ),
      TabContent(
        titleRes: lang.label_extensions,
        badgeNumber: 1,
        searchEnabled: true,
        actions: [
          AppBarAction(
            title: lang.action_filter,
            iconData: Icons.translate_outlined,
            //onClick: () {
            //  Navigator.push(
            //    context,
            //    MaterialPageRoute(
            //      builder: (context) => ExtensionFilterScreen(),
            //    ),
            //  );
            //},
            onClick: () {},
          ),
        ],
        //content: ExtensionsScreen(
        //  //state: state,
        //  //searchQuery: state.searchQuery,
        //  searchQuery: '',
        //  onLongClickItem: () {},
        //  onClickItemCancel: () {},
        //  onClickUpdateAll: () {},
        //  onInstallExtension: () {},
        //  //onOpenExtension: () {
        //  //  Navigator.push(
        //  //    context,
        //  //    MaterialPageRoute(
        //  //      builder: (context) => ExtensionDetailsScreen(pkgName),
        //  //    ),
        //  //  );
        //  //},
        //  onAddExtension: () {},
        //  onTrustExtension: () {},
        //  onUninstallExtension: () {},
        //  onUpdateExtension: () {},
        //  onRefresh: () {},
        //),
        content: const Placeholder(),
      ),
      TabContent(
        titleRes: lang.label_migration,
        actions: [
          AppBarAction(
            title: lang.migration_help_guide,
            iconData: Icons.help_outline_outlined,
            onClick: _launchMigrationGuideUrl,
          ),
        ],
        //content: MigrateSourceScreen(
        //  //state: state,
        //  //onClickItem: (source) {
        //  //  Navigator.push(
        //  //    context,
        //  //    MaterialPageRoute(
        //  //      builder: (context) => MigrateMangaScreen(source.id),
        //  //    ),
        //  //  );
        //  //},
        //  onToggleSortingDirection: () {},
        //  onToggleSortingMode: () {},
        //),
        content: const Placeholder(),
      ),
    ];

    return Scaffold(
      appBar: SearchToolbar(
        titleContent: Text(lang.browse),
        actions: tabs[_tabController.index].actions,
        bottom: TabBar(
          controller: _tabController,
          tabs: tabs
              .map((tab) => Tab(
                    icon: TabText(
                      text: tab.titleRes,
                      badgeCount: tab.badgeNumber,
                    ),
                  ))
              .toList(),
        ),
        searchEnabled: tabs[_tabController.index].searchEnabled,
        onChangeSearchQuery: (String? value) {},
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((tab) => tab.content).toList(),
      ),
    );
  }
}

Future<void> _launchMigrationGuideUrl() async {
  if (!await launchUrl(_migrationGuideUrl)) {
    throw Exception('Could not open $_migrationGuideUrl');
  }
}
