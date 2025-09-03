import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/content_books/domain/entity/content_book_entity.dart';
import 'package:flutter_application_1/features/content_books/presentation/bloc/database/database_bloc.dart';
import 'package:flutter_application_1/features/content_books/presentation/bloc/database/database_status.dart';
import 'package:flutter_application_1/features/content_books/presentation/widgets/dialog_add.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class ContentBookVeiw extends StatefulWidget {
  const ContentBookVeiw({super.key});

  @override
  State<ContentBookVeiw> createState() => _ContentBookVeiwState();
}

class _ContentBookVeiwState extends State<ContentBookVeiw> {
  @override
  void initState() {
    BlocProvider.of<DatabaseBloc>(context).add(LoadContentBooks());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('DataBase', style: TextStyle(color: Colors.amber, fontSize: 20)),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              DialogAdd.showAddItemDialog(context);
            },
            child: Text('add'),
          ),
        ),

        BlocBuilder<DatabaseBloc, DatabaseState>(
          builder: (context, state) {
            if (state.databaseStatus is DatabaseError) {
              final e = (state.databaseStatus as DatabaseError).message;
              return Center(child: Text(e));
            }
            if (state.databaseStatus is DatabaseLoading) {
              return Center(child: CircularProgressIndicator());
            }

            if (state.databaseStatus is DatabaseComplete) {
              final List<ContentBookEntity> fullData =
                  (state.databaseStatus as DatabaseComplete).data;

              return Expanded(
                child: ListView.builder(
                  itemCount: fullData.length,
                  itemBuilder: (context, index) {
                    final data = fullData[index];
                    return ListTile(
                      leading: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          final confirm = await showDialog<bool>(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: Text("حذف آیتم"),
                              content: Text("آیا مطمئنی می‌خواهی حذف کنی؟"),
                              actions: [
                                TextButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(false),
                                  child: Text("خیر"),
                                ),
                                ElevatedButton(
                                  onPressed: () =>
                                      Navigator.of(context).pop(true),
                                  child: Text("بله"),
                                ),
                              ],
                            ),
                          );

                          if (confirm == true) {
                            context.read<DatabaseBloc>().add(
                              DeleteContentBook(id: data.id!),
                            );

                            showTopSnackBar(
                              Overlay.of(context),
                              CustomSnackBar.success(
                                message:
                                    "Good job, your release is successful. Have a nice day",
                              ),
                            );
                          } else {
                            showTopSnackBar(
                              Overlay.of(context),
                              CustomSnackBar.success(
                                message:
                                    "Good job, your release is successful. Have a nice day",
                              ),
                            );
                          }
                        },
                      ),

                      title: Text(data.title),
                      subtitle: Text(data.page.toString()),
                    );
                  },
                ),
              );
            }

            return SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
