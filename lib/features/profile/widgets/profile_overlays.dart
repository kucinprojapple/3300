import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_gym_club/features/profile/widgets/medal_select_overlay.dart';
import 'package:green_gym_club/features/profile/widgets/select_picture_bottom_sheet_overlay.dart';



import '../profile_data_cubit/profile_data_cubit.dart';
import '../profile_data_cubit/profile_data_state.dart';
import '../profile_overlay_bloc/profile_overlay_bloc.dart';
import 'title_select_overlay.dart';
import 'profile_general_overlay.dart';

class ProfileOverlays extends StatelessWidget {
  const ProfileOverlays({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<ProfileDataCubit, ProfileDataState>(
          listener: (context, state) {
            context.read<ProfileOverlayBloc>().add(const HideOverlayEvent());
          },
        ),
      ],
      child: BlocBuilder<ProfileOverlayBloc, ProfileOverlayState>(
        builder: (context, state) {
          if (state is ProfileOverlayInitial) {
            return const SizedBox.shrink();
          } else if (state is ProfileOverlaySelectPicture) {
            return const ProfileGeneralOverlay(
              child: SelectPictureBottomSheetOverlay(),
            );
          } else if (state is ProfileOverlayTitleSelectState) {
            return const ProfileGeneralOverlay(child: TitleSelectOverlay());
          } else if (state is ProfileOverlayMedalSelectState) {
            return const ProfileGeneralOverlay(child: MedalSelectOverlay());
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}