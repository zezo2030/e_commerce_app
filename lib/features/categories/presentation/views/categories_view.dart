import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/category_header.dart';
import '../widgets/category_search_bar.dart';
import '../widgets/categories_grid.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

  void _handleVoiceSearch() {
    // In a real app, this would implement speech-to-text functionality
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Voice search functionality would be implemented here'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      builder:
          (context) => Padding(
            padding: EdgeInsets.all(16.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Filter Categories',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.h),
                // Add filter options here
                Wrap(
                  spacing: 8.w,
                  children: [
                    _buildFilterChip('Popular'),
                    _buildFilterChip('New'),
                    _buildFilterChip('A-Z'),
                    _buildFilterChip('Z-A'),
                  ],
                ),
                SizedBox(height: 16.h),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 12.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text('Apply Filters'),
                  ),
                ),
              ],
            ),
          ),
    );
  }

  Widget _buildFilterChip(String label) {
    return FilterChip(
      label: Text(label),
      onSelected: (selected) {
        // Handle filter selection
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16.h),
            CategoryHeader(onFilterTap: _showFilterBottomSheet),
            SizedBox(height: 16.h),
            CategorySearchBar(
              searchController: _searchController,
              onChanged: _onSearchChanged,
              onVoiceSearch: _handleVoiceSearch,
            ),
            SizedBox(height: 16.h),
            Expanded(child: SingleChildScrollView(child: CategoriesGrid())),
          ],
        ),
      ),
    );
  }
}
