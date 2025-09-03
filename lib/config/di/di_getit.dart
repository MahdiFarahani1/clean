import 'package:dio/dio.dart';
import 'package:flutter_application_1/core/bloc/navbar_cubit/navbar_cubit.dart';
import 'package:flutter_application_1/features/content_books/data/repository/book_content_repositoy_impl.dart';
import 'package:flutter_application_1/features/content_books/domain/repository/book_content_repository.dart';
import 'package:flutter_application_1/features/content_books/domain/use_case/add_usecase.dart';
import 'package:flutter_application_1/features/content_books/domain/use_case/delete_usecase.dart';
import 'package:flutter_application_1/features/content_books/domain/use_case/get_content_books_usecase.dart';
import 'package:flutter_application_1/features/content_books/presentation/bloc/database/database_bloc.dart';
import 'package:flutter_application_1/features/home/data/data_source/remote/api_book_provider.dart';
import 'package:flutter_application_1/features/home/data/repository/book_repository_impl.dart';
import 'package:flutter_application_1/features/home/domain/repository/book_repository.dart';
import 'package:flutter_application_1/features/home/domain/use_case/book_usecase.dart';
import 'package:flutter_application_1/features/home/domain/use_case/question_usecase.dart';
import 'package:flutter_application_1/features/home/presentation/bloc/Home/home_bloc.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

dependencyInjection() {
  locator.registerSingleton<Dio>(Dio());
  locator.registerSingleton<ApiBookProvider>(ApiBookProvider(dio: locator()));
  locator.registerSingleton<HomeRepository>(BookRepositoryImpl(locator()));

  locator.registerSingleton<BookUsecase>(BookUsecase(locator()));
  locator.registerSingleton<QuestionUsecase>(
    QuestionUsecase(homeRepository: locator()),
  );

  locator.registerSingleton<HomeBloc>(
    HomeBloc(bookUsecase: locator(), questionUsecase: locator()),
  );

  locator.registerSingleton<NavbarCubit>(NavbarCubit());

  //* DataBase Locator start
  locator.registerSingleton<BookContentRepository>(BookContentRepositoryImpl());
  locator.registerSingleton<GetContentBooksUsecase>(
    GetContentBooksUsecase(bookContentRepository: locator()),
  );

  locator.registerSingleton<DeleteContentBookUseCase>(
    DeleteContentBookUseCase(bookContentRepository: locator()),
  );
  locator.registerSingleton<AddBookContentUsecase>(
    AddBookContentUsecase(bookContentRepository: locator()),
  );

  locator.registerSingleton<DatabaseBloc>(
    DatabaseBloc(
      getContentBooksUsecase: locator(),
      deleteContentBookUseCase: locator(),
      addBookContentUsecase: locator(),
    ),
  );
  //* DataBase Locator end
}
