import 'dart:async';

import 'package:ecommerce_app/models/category_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/category/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;
  StreamSubscription? categpryStreamSubscription;
  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(CategoryLoading()) {
    on<LoadCategories>(_onLoadCategories);
    on<UpdateCategories>(_onUpdateCategories);
  }

  void _onLoadCategories(event, Emitter<CategoryState> emit) async {
    categpryStreamSubscription = _categoryRepository.getAllCategories().listen(
      (categories) {
        return add(
          UpdateCategories(categories: categories),
        );
      },
    );
  }

  void _onUpdateCategories(event, Emitter<CategoryState> emit) async {
    emit(CategoryLoaded(categories: event.categories));
  }
}
