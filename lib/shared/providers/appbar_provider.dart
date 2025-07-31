import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_store/shared/viewmodels/appbar_viewmodel.dart';

final appBarUserProvider = ChangeNotifierProvider<AppBarUserViewmodel>((ref) {
  return AppBarUserViewmodel();
});
