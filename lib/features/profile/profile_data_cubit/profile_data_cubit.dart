import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/storage/local_storage_service.dart';
import 'profile_data_state.dart';

class ProfileDataCubit extends Cubit<ProfileDataState> {
  final LocalStorageService storage;

  ProfileDataCubit(this.storage)
    : super(
        ProfileDataState(
          name: storage.playerName,
          title: storage.playerTitle,
          avatar: storage.playerAvatar,
        ),
      );

  Future<void> refresh() async {
    await storage.ensureInitialized();
    emit(
      ProfileDataState(
        name: storage.playerName,
        title: storage.playerTitle,
        avatar: storage.playerAvatar,
      ),
    );
  }

  Future<void> updateTitle(String title) async {
    await storage.setPlayerTitle(title);
    await refresh();
  }

  Future<void> updateAvatar(String avatarPath) async {
    await storage.setPlayerAvatar(avatarPath);
    await refresh();
  }

  Future<void> updateName(String name) async {
    await storage.setPlayerName(name);
    await refresh();
  }
}
