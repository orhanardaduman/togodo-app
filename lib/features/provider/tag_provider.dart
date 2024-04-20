import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/data/model/profil/profil_model.dart';
import 'package:togodo/gen/assets.gen.dart';

final hobyStateNotifierProvider = StateNotifierProvider.family<
    HobyStateNotifier, List<TagsModel>, BuildContext>(
  HobyStateNotifier.new,
);

class HobyStateNotifier extends StateNotifier<List<TagsModel>> {
  HobyStateNotifier(this._read, this._context) : super([]) {
    initializeHobyData();
  }
  // ignore: unused_field
  final Ref _read;
  final BuildContext _context;
  void initializeHobyData() {
    final l10n = L10n.of(_context)!;
    final hobyData = [
      TagsModel(id: 0, name: l10n.all),
      TagsModel(
        id: 1,
        name: l10n.hoby_music,
        iconPath: Assets.icons.hoby.icHobi.path,
        subTags: [
          TagsModel(
            id: 101,
            iconPath: Assets.icons.hoby.icHobi.path,
            name: l10n.hoby_live_concerts,
          ),
          TagsModel(
            id: 102,
            iconPath: Assets.icons.hoby.icHobi.path,
            name: l10n.hoby_rock,
          ),
          TagsModel(
            id: 103,
            iconPath: Assets.icons.hoby.icHobi.path,
            name: l10n.hoby_jazz,
          ),
          TagsModel(
            id: 105,
            iconPath: Assets.icons.hoby.icHobi.path,
            name: l10n.hoby_rap,
          ),
          TagsModel(
            id: 106,
            iconPath: Assets.icons.hoby.icHobi.path,
            name: l10n.hoby_pop,
          ),
          TagsModel(
            id: 904,
            iconPath: Assets.icons.hoby.icHobi.path,
            name: l10n.hoby_classic_music,
          ),
        ],
      ),
      TagsModel(
        id: 2,
        name: l10n.hoby_festival,
        iconPath: Assets.icons.hoby.icFestival.path,
        subTags: [
          TagsModel(
            id: 203,
            iconPath: Assets.icons.hoby.icFestival.path,
            name: l10n.hoby_film,
          ),
          TagsModel(
            id: 204,
            iconPath: Assets.icons.hoby.icFestival.path,
            name: l10n.hoby_food,
          ),
          TagsModel(
            id: 205,
            iconPath: Assets.icons.hoby.icFestival.path,
            name: l10n.hoby_technology,
          ),
        ],
      ),
      TagsModel(
        id: 3,
        name: l10n.hoby_theater,
        iconPath: Assets.icons.hoby.icTiyatro.path,
        subTags: [
          TagsModel(
            id: 301,
            iconPath: Assets.icons.hoby.icTiyatro.path,
            name: l10n.hoby_theater_festivals,
          ),
          TagsModel(
            id: 302,
            iconPath: Assets.icons.hoby.icTiyatro.path,
            name: l10n.hoby_classic_theater,
          ),
        ],
      ),
      TagsModel(
        id: 4,
        name: l10n.hoby_cinema,
        iconPath: Assets.icons.hoby.icSinema.path,
        subTags: [
          TagsModel(
            id: 401,
            iconPath: Assets.icons.hoby.icSinema.path,
            name: l10n.hoby_film_showings,
          ),
          TagsModel(
            id: 402,
            iconPath: Assets.icons.hoby.icSinema.path,
            name: l10n.hoby_film_festivals,
          ),
          TagsModel(
            id: 403,
            iconPath: Assets.icons.hoby.icSinema.path,
            name: l10n.hoby_film_criticism,
          ),
        ],
      ),
      TagsModel(
        id: 5,
        name: l10n.hoby_business,
        iconPath: Assets.icons.hoby.icIsHayati.path,
        subTags: [
          TagsModel(
            id: 501,
            iconPath: Assets.icons.hoby.icIsHayati.path,
            name: l10n.hoby_networking,
          ),
          TagsModel(
            id: 502,
            iconPath: Assets.icons.hoby.icIsHayati.path,
            name: l10n.hoby_entrepreneurship,
          ),
          TagsModel(
            id: 503,
            iconPath: Assets.icons.hoby.icIsHayati.path,
            name: l10n.hoby_social_responsibility,
          ),
        ],
      ),
      TagsModel(
        id: 6,
        name: l10n.hoby_education,
        iconPath: Assets.icons.hoby.icEgitim.path,
        subTags: [
          TagsModel(
            id: 601,
            iconPath: Assets.icons.hoby.icEgitim.path,
            name: l10n.hoby_seminars_conferences,
          ),
          TagsModel(
            id: 602,
            iconPath: Assets.icons.hoby.icEgitim.path,
            name: l10n.hoby_workshops,
          ),
          TagsModel(
            id: 603,
            iconPath: Assets.icons.hoby.icEgitim.path,
            name: l10n.hoby_personal_development,
          ),
        ],
      ),
      TagsModel(
        id: 7,
        name: l10n.hoby_fair,
        iconPath: Assets.icons.hoby.icFuar.path,
        subTags: [
          TagsModel(
            id: 701,
            iconPath: Assets.icons.hoby.icFuar.path,
            name: l10n.hoby_trade_fair,
          ),
          TagsModel(
            id: 702,
            iconPath: Assets.icons.hoby.icFuar.path,
            name: l10n.hoby_book_fair,
          ),
          TagsModel(
            id: 703,
            iconPath: Assets.icons.hoby.icFuar.path,
            name: l10n.hoby_game_entertainment_fair,
          ),
          TagsModel(
            id: 704,
            iconPath: Assets.icons.hoby.icFuar.path,
            name: l10n.hoby_fashion_fair,
          ),
          TagsModel(
            id: 705,
            iconPath: Assets.icons.hoby.icFuar.path,
            name: l10n.hoby_automotive_fair,
          ),
        ],
      ),
      TagsModel(
        id: 8,
        name: l10n.hoby_social_event,
        iconPath: Assets.icons.hoby.icSosyalEtkinlik.path,
        subTags: [
          TagsModel(
            id: 801,
            iconPath: Assets.icons.hoby.icSosyalEtkinlik.path,
            name: l10n.hoby_community_meeting,
          ),
          TagsModel(
            id: 802,
            iconPath: Assets.icons.hoby.icSosyalEtkinlik.path,
            name: l10n.hoby_charity_campaign,
          ),
        ],
      ),
      TagsModel(
        id: 9,
        name: l10n.hoby_food_drink,
        iconPath: Assets.icons.hoby.icIcme.path,
        subTags: [
          TagsModel(
            id: 901,
            iconPath: Assets.icons.hoby.icIcme.path,
            name: l10n.hoby_restaurant_promotion,
          ),
          TagsModel(
            id: 902,
            iconPath: Assets.icons.hoby.icIcme.path,
            name: l10n.hoby_chef_table_experience,
          ),
          TagsModel(
            id: 903,
            iconPath: Assets.icons.hoby.icIcme.path,
            name: l10n.hoby_drink_tasting,
          ),
          TagsModel(
            id: 904,
            iconPath: Assets.icons.hoby.icIcme.path,
            name: l10n.hoby_gourmet_tour,
          ),
        ],
      ),
      TagsModel(
        id: 10,
        name: l10n.hoby_comedy,
        iconPath: Assets.icons.hoby.icKomedi.path,
        subTags: [
          TagsModel(
            id: 1001,
            iconPath: Assets.icons.hoby.icKomedi.path,
            name: l10n.hoby_open_mic,
          ),
          TagsModel(
            id: 1002,
            iconPath: Assets.icons.hoby.icKomedi.path,
            name: l10n.hoby_stand_up,
          ),
        ],
      ),
      TagsModel(
        id: 12,
        name: l10n.hoby_sports,
        iconPath: Assets.icons.hoby.icSpor.path,
        subTags: [
          TagsModel(
            id: 1201,
            iconPath: Assets.icons.hoby.icSpor.path,
            name: l10n.hoby_basketball,
          ),
          TagsModel(
            id: 1202,
            iconPath: Assets.icons.hoby.icSpor.path,
            name: l10n.hoby_football,
          ),
          TagsModel(
            id: 1203,
            iconPath: Assets.icons.hoby.icSpor.path,
            name: l10n.hoby_volleyball,
          ),
          TagsModel(
            id: 1204,
            iconPath: Assets.icons.hoby.icSpor.path,
            name: l10n.hoby_running,
          ),
          TagsModel(
            id: 1205,
            iconPath: Assets.icons.hoby.icSpor.path,
            name: l10n.hoby_walking,
          ),
          TagsModel(
            id: 1206,
            iconPath: Assets.icons.hoby.icSpor.path,
            name: l10n.hoby_bicycling,
          ),
          TagsModel(
            id: 1207,
            iconPath: Assets.icons.hoby.icSpor.path,
            name: l10n.hoby_tennis,
          ),
          TagsModel(
            id: 1208,
            iconPath: Assets.icons.hoby.icSpor.path,
            name: l10n.hoby_motor_sports,
          ),
          TagsModel(
            id: 1209,
            iconPath: Assets.icons.hoby.icSpor.path,
            name: l10n.hoby_sailing,
          ),
          TagsModel(
            id: 1210,
            iconPath: Assets.icons.hoby.icSpor.path,
            name: l10n.hoby_yoga,
          ),
          TagsModel(
            id: 1211,
            iconPath: Assets.icons.hoby.icSpor.path,
            name: l10n.hoby_fitness,
          ),
          TagsModel(
            id: 1212,
            iconPath: Assets.icons.hoby.icSpor.path,
            name: l10n.hoby_swimming,
          ),
          TagsModel(
            id: 1213,
            iconPath: Assets.icons.hoby.icSpor.path,
            name: l10n.hoby_table_tennis,
          ),
        ],
      ),
      TagsModel(
        id: 13,
        name: l10n.hoby_art,
        iconPath: Assets.icons.hoby.icSanat.path,
      ),
      TagsModel(
        id: 14,
        name: l10n.hoby_travel,
        iconPath: Assets.icons.hoby.icSeyahat.path,
        subTags: [
          TagsModel(
            id: 1401,
            iconPath: Assets.icons.hoby.icSeyahat.path,
            name: l10n.hoby_cultural_events,
          ),
          TagsModel(
            id: 1402,
            iconPath: Assets.icons.hoby.icSeyahat.path,
            name: l10n.hoby_nature_exploration,
          ),
          TagsModel(
            id: 1403,
            iconPath: Assets.icons.hoby.icSeyahat.path,
            name: l10n.hoby_city_tours,
          ),
          TagsModel(
            id: 1404,
            iconPath: Assets.icons.hoby.icSeyahat.path,
            name: l10n.hoby_camping,
          ),
          TagsModel(
            id: 1405,
            iconPath: Assets.icons.hoby.icSeyahat.path,
            name: l10n.hoby_sea_beach,
          ),
        ],
      ),
      TagsModel(
        id: 15,
        name: l10n.hoby_technology,
        iconPath: Assets.icons.hoby.icTeknoloji.path,
        subTags: [
          TagsModel(
            id: 1501,
            iconPath: Assets.icons.hoby.icTeknoloji.path,
            name: l10n.hoby_coding,
          ),
          TagsModel(
            id: 1502,
            iconPath: Assets.icons.hoby.icTeknoloji.path,
            name: l10n.hoby_artificial_intelligence,
          ),
          TagsModel(
            id: 1503,
            iconPath: Assets.icons.hoby.icTeknoloji.path,
            name: l10n.hoby_hackathon,
          ),
          TagsModel(
            id: 1504,
            iconPath: Assets.icons.hoby.icTeknoloji.path,
            name: l10n.hoby_digital_design,
          ),
          TagsModel(
            id: 1505,
            iconPath: Assets.icons.hoby.icTeknoloji.path,
            name: l10n.hoby_data_science,
          ),
        ],
      ),
      TagsModel(
        id: 16,
        name: l10n.hoby_dance,
        iconPath: Assets.icons.hoby.icDans.path,
        subTags: [
          TagsModel(
            id: 1601,
            iconPath: Assets.icons.hoby.icDans.path,
            name: l10n.hoby_folk_dance,
          ),
          TagsModel(
            id: 1602,
            iconPath: Assets.icons.hoby.icDans.path,
            name: l10n.hoby_ballet,
          ),
          TagsModel(
            id: 1603,
            iconPath: Assets.icons.hoby.icDans.path,
            name: l10n.hoby_latin_dance,
          ),
          TagsModel(
            id: 1604,
            iconPath: Assets.icons.hoby.icDans.path,
            name: l10n.hoby_modern_dance,
          ),
          TagsModel(
            id: 1605,
            iconPath: Assets.icons.hoby.icDans.path,
            name: l10n.hoby_break_dance,
          ),
        ],
      ),
      TagsModel(
        id: 17,
        name: l10n.hoby_party,
        iconPath: Assets.icons.hoby.icParti.path,
        subTags: [
          TagsModel(
            id: 1701,
            iconPath: Assets.icons.hoby.icParti.path,
            name: l10n.hoby_thematic_party,
          ),
          TagsModel(
            id: 1702,
            iconPath: Assets.icons.hoby.icParti.path,
            name: l10n.hoby_cocktail,
          ),
          TagsModel(
            id: 1703,
            iconPath: Assets.icons.hoby.icParti.path,
            name: l10n.hoby_birthday_party,
          ),
        ],
      ),
      TagsModel(
        id: 18,
        name: l10n.hoby_hobby,
        iconPath: Assets.icons.hoby.icHobi.path,
        subTags: [
          TagsModel(
            id: 1801,
            iconPath: Assets.icons.hoby.icHobi.path,
            name: l10n.hoby_cooking,
          ),
          TagsModel(
            id: 1802,
            iconPath: Assets.icons.hoby.icHobi.path,
            name: l10n.hoby_gardening,
          ),
          TagsModel(
            id: 1803,
            iconPath: Assets.icons.hoby.icHobi.path,
            name: l10n.hoby_book_club,
          ),
          TagsModel(
            id: 1804,
            iconPath: Assets.icons.hoby.icHobi.path,
            name: l10n.hoby_handicrafts,
          ),
          TagsModel(
            id: 1805,
            iconPath: Assets.icons.hoby.icHobi.path,
            name: l10n.hoby_astronomy,
          ),
          TagsModel(
            id: 1806,
            iconPath: Assets.icons.hoby.icHobi.path,
            name: l10n.hoby_pet_care,
          ),
          TagsModel(
            id: 1807,
            iconPath: Assets.icons.hoby.icHobi.path,
            name: l10n.hoby_home_decoration,
          ),
        ],
      ),
      TagsModel(
        id: 19,
        name: l10n.hoby_chat,
        iconPath: Assets.icons.hoby.icSohbet.path,
        subTags: [
          TagsModel(
            id: 1901,
            iconPath: Assets.icons.hoby.icSohbet.path,
            name: l10n.hoby_current_affairs,
          ),
          TagsModel(
            id: 1902,
            iconPath: Assets.icons.hoby.icSohbet.path,
            name: l10n.hoby_sports_chat,
          ),
          TagsModel(
            id: 1903,
            iconPath: Assets.icons.hoby.icSohbet.path,
            name: l10n.hoby_art_discussion,
          ),
          TagsModel(
            id: 1904,
            iconPath: Assets.icons.hoby.icSohbet.path,
            name: l10n.hoby_casual_chat,
          ),
        ],
      ),
    ];
    state = hobyData;
  }
}
