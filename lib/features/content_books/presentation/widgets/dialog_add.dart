import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/content_books/domain/entity/content_book_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_application_1/features/content_books/presentation/bloc/database/database_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class DialogAdd {
  static Future<void> showAddItemDialog(BuildContext context) async {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController pageController = TextEditingController();

    final confirm = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("اضافه کردن آیتم"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: "عنوان"),
            ),
            TextField(
              controller: pageController,
              decoration: InputDecoration(labelText: "شماره صفحه"),
              keyboardType: TextInputType.number,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text("لغو"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: Text("اضافه کن"),
          ),
        ],
      ),
    );

    if (confirm == true) {
      // ایونت Insert رو به Bloc می‌فرستیم
      final String title = titleController.text;
      final String page = pageController.text;

      context.read<DatabaseBloc>().add(
        AddContentBook(
          entity: ContentBookEntity(page: page, title: title),
        ),
      );
      showTopSnackBar(
        Overlay.of(context),
        CustomSnackBar.success(
          message: "Good job, your release is successful. Have a nice day",
        ),
      );
    }
  }
}
