import 'package:flutter/material.dart';

void main() {
  runApp(const VietWayApp());
}


const Color primaryColor = Color(0xFF0D9488);
const Color secondaryColor = Color(0xFF0284C7);
const Color tertiaryColor = Color(0xFFD97706);
const Color backgroundColor = Color(0xFFF8FAFC);
const Color surfaceColor = Colors.white;
const Color inputColor = Color(0xFFF1F5F9);
const Color mainTextColor = Color(0xFF0F172A);
const Color mutedTextColor = Color(0xFF475569);
const Color borderColor = Color(0xFFE2E8F0);


bool isTablet(BuildContext context) {
  final width = MediaQuery.sizeOf(context).width;
  return width >= 600 && width < 1024;
}

bool isDesktop(BuildContext context) => MediaQuery.sizeOf(context).width >= 1024;

double responsiveContentWidth(BuildContext context) {
  if (isDesktop(context)) return 1160;
  if (isTablet(context)) return 880;
  return 520;
}

EdgeInsets responsivePagePadding(BuildContext context, {double bottom = 32}) {
  final horizontal = isDesktop(context) ? 24.0 : isTablet(context) ? 20.0 : 16.0;
  return EdgeInsets.fromLTRB(horizontal, 8, horizontal, bottom);
}

class VietWayApp extends StatelessWidget {
  const VietWayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VietWay',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          primary: primaryColor,
          secondary: secondaryColor,
          tertiary: tertiaryColor,
          surface: surfaceColor,
        ),
        scaffoldBackgroundColor: backgroundColor,
        fontFamily: 'Be Vietnam Pro',
        appBarTheme: const AppBarTheme(
          backgroundColor: backgroundColor,
          foregroundColor: mainTextColor,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: inputColor,
          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: primaryColor, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFEF4444)),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(48),
            backgroundColor: primaryColor,
            foregroundColor: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
          ),
        ),
      ),
      initialRoute: '/',
      
      routes: {
        '/': (context) => const HomeScreen(),
        '/trip-builder': (context) => const TripBuilderScreen(),
        '/booking': (context) => const PlaceholderScreen(title: 'Đặt chuyến'),
        '/payment': (context) => const PaymentScreen(),
      },
    );
  }
}


class Trip {
  final String id;
  final String destination;
  final String province;
  final String image;
  final int pricePerPerson;
  final double rating;
  final String duration;
  final int days;
  final String description;
  final List<String> interests;
  final String tag;

  const Trip({
    required this.id,
    required this.destination,
    required this.province,
    required this.image,
    required this.pricePerPerson,
    required this.rating,
    required this.duration,
    required this.days,
    required this.description,
    required this.interests,
    required this.tag,
  });
}

class CostOption {
  final String name;
  final int pricePerPerson;
  final IconData icon;

  const CostOption(this.name, this.pricePerPerson, this.icon);
}

class Activity {
  final String name;
  final int pricePerPerson;
  final IconData icon;

  const Activity(this.name, this.pricePerPerson, this.icon);
}

class BookingData {
  final Trip trip;
  final String departure;
  final int numberOfPeople;
  final int budget;
  final int totalPrice;
  final CostOption transport;
  final CostOption accommodation;
  final CostOption food;
  final List<Activity> selectedActivities;
  final String fullName;
  final String phone;
  final String email;

  const BookingData({
    required this.trip,
    required this.departure,
    required this.numberOfPeople,
    required this.budget,
    required this.totalPrice,
    required this.transport,
    required this.accommodation,
    required this.food,
    required this.selectedActivities,
    required this.fullName,
    required this.phone,
    required this.email,
  });
}

class PaymentData {
  final BookingData booking;
  final String departureDate;

  const PaymentData({required this.booking, required this.departureDate});
}

const List<Trip> mockTrips = [
  Trip(
    id: 'nha-trang',
    destination: 'Nha Trang',
    province: 'Khánh Hòa',
    image: 'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=900&q=80',
    pricePerPerson: 2450000,
    rating: 4.9,
    duration: '3 ngày 2 đêm',
    days: 3,
    description: 'Biển xanh cát trắng, hải sản tươi sống và VinWonders sôi động.',
    interests: ['Biển', 'Ẩm thực', 'Nghỉ dưỡng'],
    tag: 'Phổ biến nhất',
  ),
  Trip(
    id: 'da-lat',
    destination: 'Đà Lạt',
    province: 'Lâm Đồng',
    image: 'https://images.unsplash.com/photo-1528127269322-539801943592?auto=format&fit=crop&w=900&q=80',
    pricePerPerson: 2100000,
    rating: 4.9,
    duration: '3 ngày 2 đêm',
    days: 3,
    description: 'Thành phố ngàn hoa, khí hậu se lạnh và những quán cà phê thơ mộng.',
    interests: ['Thiên nhiên', 'Ẩm thực', 'Khám phá'],
    tag: 'Không khí mát lành',
  ),
  Trip(
    id: 'vung-tau',
    destination: 'Vũng Tàu',
    province: 'Bà Rịa - Vũng Tàu',
    image: 'https://images.unsplash.com/photo-1500534623283-312aade485b7?auto=format&fit=crop&w=900&q=80',
    pricePerPerson: 1600000,
    rating: 4.7,
    duration: '2 ngày 1 đêm',
    days: 2,
    description: 'Kỳ nghỉ biển ngắn ngày, hải sản ngon và chi phí dễ chịu.',
    interests: ['Biển', 'Nghỉ dưỡng', 'Ẩm thực'],
    tag: 'Tiết kiệm nhất',
  ),
  Trip(
    id: 'phan-thiet',
    destination: 'Phan Thiết',
    province: 'Bình Thuận',
    image: 'https://images.unsplash.com/photo-1510414842594-a61c69b5ae57?auto=format&fit=crop&w=900&q=80',
    pricePerPerson: 2200000,
    rating: 4.8,
    duration: '3 ngày 2 đêm',
    days: 3,
    description: 'Đồi cát, biển xanh và những cung đường đầy nắng gió.',
    interests: ['Biển', 'Khám phá', 'Thiên nhiên'],
    tag: 'Được yêu thích',
  ),
  Trip(
    id: 'quy-nhon',
    destination: 'Quy Nhơn',
    province: 'Bình Định',
    image: 'https://images.unsplash.com/photo-1544551763-46a013bb70d5?auto=format&fit=crop&w=900&q=80',
    pricePerPerson: 3200000,
    rating: 4.8,
    duration: '4 ngày 3 đêm',
    days: 4,
    description: 'Eo Gió, Kỳ Co và những làng chài bình yên ven biển.',
    interests: ['Biển', 'Thiên nhiên', 'Khám phá'],
    tag: 'Cảnh đẹp bản địa',
  ),
  Trip(
    id: 'da-nang',
    destination: 'Đà Nẵng',
    province: 'Đà Nẵng',
    image: 'https://images.unsplash.com/photo-1529156069898-49953e39b3ac?auto=format&fit=crop&w=900&q=80',
    pricePerPerson: 3800000,
    rating: 4.9,
    duration: '4 ngày 3 đêm',
    days: 4,
    description: 'Thành phố biển hiện đại, cầu Rồng và Hội An lãng mạn.',
    interests: ['Biển', 'Ẩm thực', 'Văn hóa'],
    tag: 'Trải nghiệm đa dạng',
  ),
];

const List<CostOption> transportOptions = [
  CostOption('Xe khách giường nằm', 700000, Icons.directions_bus_rounded),
  CostOption('Tàu hỏa', 1200000, Icons.train_rounded),
  CostOption('Máy bay', 2200000, Icons.flight_rounded),
];

const List<CostOption> accommodationOptions = [
  CostOption('Homestay gần biển', 900000, Icons.cottage_rounded),
  CostOption('Khách sạn 3 sao', 1500000, Icons.hotel_rounded),
  CostOption('Khách sạn 4 sao', 2400000, Icons.apartment_rounded),
];

const List<CostOption> foodOptions = [
  CostOption('Tự túc địa phương', 700000, Icons.restaurant_rounded),
  CostOption('Gói tiêu chuẩn', 1200000, Icons.ramen_dining_rounded),
  CostOption('Gói thoải mái', 1800000, Icons.restaurant_menu_rounded),
];

const List<Activity> defaultActivities = [
  Activity('VinWonders', 1000000, Icons.attractions_rounded),
  Activity('Tour đảo & lặn ngắm san hô', 300000, Icons.scuba_diving_rounded),
  Activity('Tháp Bà & chợ Đầm', 0, Icons.location_city_rounded),
  Activity('Tắm bùn khoáng nóng', 350000, Icons.spa_rounded),
];

String formatMoney(int value) {
  final text = value.toString();
  final result = StringBuffer();

  for (int i = 0; i < text.length; i++) {
    if (i > 0 && (text.length - i) % 3 == 0) {
      result.write('.');
    }
    result.write(text[i]);
  }

  return '${result.toString()}đ';
}

int parseMoney(String value) => int.tryParse(value.replaceAll(RegExp(r'[^0-9]'), '')) ?? 0;

int daysFromDuration(String duration) => int.tryParse(RegExp(r'\d+').firstMatch(duration)?.group(0) ?? '') ?? 3;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onNavigationTap(int index) {
    if (index == 0) {
      setState(() => _currentIndex = index);
      return;
    }
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Tính năng đang được phát triển')),
    );
  }

  void _goToBuilder() {
    // Chuyển sang màn tạo chuyến bằng Named Route.
    Navigator.pushNamed(context, '/trip-builder');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: responsiveContentWidth(context)),
            child: Column(
              children: [
                _HomeHeader(onSearch: () {
                  showSearch(context: context, delegate: TripSearchDelegate());
                }),
                Expanded(
                  child: ListView(
                    padding: responsivePagePadding(context, bottom: 24),
                    children: [
                      const _GreetingCard(),
                      const SizedBox(height: 16),
                      const _BudgetHero(),
                      const SizedBox(height: 16),
                      const TravelBanner(),
                      const SizedBox(height: 20),
                      const ServiceGrid(),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Điểm đến nổi bật', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                              SizedBox(height: 2),
                              Text('Hành trình được yêu thích nhất tuần này', style: TextStyle(fontSize: 12, color: mutedTextColor)),
                            ],
                          ),
                          TextButton(onPressed: _goToBuilder, child: const Text('Xem thêm')),
                        ],
                      ),
                      const SizedBox(height: 8),
                      _buildFeaturedDestinations(),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: _goToBuilder,
                        icon: const Icon(Icons.explore_rounded),
                        label: const Text('Tạo chuyến đi theo ngân sách'),
                      ),
                      const SizedBox(height: 8),
                      const Center(
                        child: Text('✓ Lên kế hoạch thông minh trong 30 giây — Miễn phí 100%', style: TextStyle(fontSize: 11, color: mutedTextColor)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: _onNavigationTap,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.explore_outlined), selectedIcon: Icon(Icons.explore), label: 'Khám phá'),
          NavigationDestination(icon: Icon(Icons.map_outlined), selectedIcon: Icon(Icons.map), label: 'Chuyến đi'),
          NavigationDestination(icon: Icon(Icons.bookmark_outline), selectedIcon: Icon(Icons.bookmark), label: 'Đã lưu'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Hồ sơ'),
        ],
      ),
    );
  }

  Widget _buildFeaturedDestinations() {
    final cards = [
      DestinationCard(trip: mockTrips[1], compact: false, onTap: _goToBuilder),
      DestinationCard(trip: mockTrips[0], compact: false, onTap: _goToBuilder),
    ];
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return Column(children: [cards.first, const SizedBox(height: 12), cards.last]);
        }
        return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(child: cards.first),
          const SizedBox(width: 16),
          Expanded(child: cards.last),
        ]);
      },
    );
  }
}

class _HomeHeader extends StatelessWidget {
  final VoidCallback onSearch;
  const _HomeHeader({required this.onSearch});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 12, 4),
      child: Row(
        children: [
          Image.asset('assets/images/vietway_logo.png', height: 36, errorBuilder: (_, __, ___) => const Icon(Icons.route, color: primaryColor, size: 32)),
          const SizedBox(width: 8),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('VietWay', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w800, color: primaryColor)),
                Text('Discover', style: TextStyle(fontSize: 10, color: mutedTextColor)),
              ],
            ),
          ),
          IconButton(onPressed: onSearch, icon: const Icon(Icons.search_rounded)),
          const CircleAvatar(radius: 16, backgroundColor: primaryColor, child: Icon(Icons.person_rounded, color: Colors.white, size: 19)),
        ],
      ),
    );
  }
}

class _GreetingCard extends StatelessWidget {
  const _GreetingCard();

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            const CircleAvatar(radius: 14, backgroundColor: Color(0xFFCCFBF1), child: Icon(Icons.verified_user_rounded, size: 17, color: Color(0xFF115E59))),
            const SizedBox(width: 8),
            const Expanded(child: Text('VIETWAY ĐỒNG HÀNH', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: primaryColor))),
            Container(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3), decoration: BoxDecoration(color: const Color(0xFFE5EEFF), borderRadius: BorderRadius.circular(20)), child: const Text('Phiên bản 2.4', style: TextStyle(fontSize: 10))),
          ]),
          const SizedBox(height: 12),
          const Text('Chào bạn, hôm nay muốn đi đâu?', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          const SizedBox(height: 3),
          const Text('Your Trip, Your Way — Tự do trải nghiệm theo cách của riêng bạn.', style: TextStyle(fontSize: 12, color: mutedTextColor)),
        ],
      ),
    );
  }
}

class _BudgetHero extends StatelessWidget {
  const _BudgetHero();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [primaryColor, Color(0xFF008378)], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [BoxShadow(color: Color(0x33115E59), blurRadius: 12, offset: Offset(0, 4))],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Row(children: [Icon(Icons.savings_rounded, color: Color(0xFF89F5E7), size: 20), SizedBox(width: 6), Text('TỐI ƯU HOÁ CHI TIÊU', style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Color(0xFF89F5E7)))]),
        const SizedBox(height: 10),
        const Text('Bạn có bao nhiêu tiền?\nVietWay giúp bạn đi được đến đó!', style: TextStyle(color: Colors.white, fontSize: 19, height: 1.25, fontWeight: FontWeight.w800)),
        const SizedBox(height: 8),
        const Text('Gợi ý lộ trình linh hoạt từ 499k đến nghỉ dưỡng cao cấp khắp Việt Nam.', style: TextStyle(color: Color(0xFFF4FFFC), fontSize: 12)),
        const SizedBox(height: 12),
        Wrap(spacing: 8, runSpacing: 6, children: const [
          HeroChip(icon: Icons.bolt_rounded, text: '< 1 Triệu'),
          HeroChip(icon: Icons.trending_up_rounded, text: '1 - 3 Triệu'),
          HeroChip(icon: Icons.star_rounded, text: 'Đề xuất linh hoạt', light: true),
        ]),
      ]),
    );
  }
}

class HeroChip extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool light;
  const HeroChip({super.key, required this.icon, required this.text, this.light = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
      decoration: BoxDecoration(color: light ? const Color(0xFF89F5E7) : Colors.white.withValues(alpha: .16), borderRadius: BorderRadius.circular(24)),
      child: Row(mainAxisSize: MainAxisSize.min, children: [Icon(icon, size: 14, color: light ? const Color(0xFF00201D) : Colors.white), const SizedBox(width: 4), Text(text, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700, color: light ? const Color(0xFF00201D) : Colors.white))]),
    );
  }
}

class TravelBanner extends StatelessWidget {
  const TravelBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: SizedBox(
        height: 168,
        child: Stack(fit: StackFit.expand, children: [
          VietWayNetworkImage(url: 'https://images.unsplash.com/photo-1528181304800-259b08848526?auto=format&fit=crop&w=900&q=80'),
          const DecoratedBox(decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.transparent, Color(0xD90F172A)], begin: Alignment.topCenter, end: Alignment.bottomCenter))),
          const Positioned(left: 16, right: 16, bottom: 14, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SmallBadge(text: 'DU LỊCH THÔNG MINH', color: Color(0xFFFFDCC3), textColor: Color(0xFF6E3900)),
            SizedBox(height: 6),
            Text('Khám phá Việt Nam tiết kiệm tới 35%', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 16)),
            Text('Gợi ý chặng xe, điểm dừng chân và ưu đãi giờ chót', overflow: TextOverflow.ellipsis, style: TextStyle(color: Color(0xFFEAF1FF), fontSize: 11)),
          ])),
        ]),
      ),
    );
  }
}

class ServiceGrid extends StatelessWidget {
  const ServiceGrid({super.key});

  void _showNotice(BuildContext context, String title) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$title đang được phát triển')));
  }

  @override
  Widget build(BuildContext context) {
    const services = [
      (Icons.flight_rounded, 'Vé máy bay', 'Săn vé rẻ', secondaryColor),
      (Icons.directions_bus_rounded, 'Xe khách', 'Liên tỉnh', primaryColor),
      (Icons.cottage_rounded, 'Homestay', 'Bản địa ấm cúng', tertiaryColor),
      (Icons.hotel_rounded, 'Khách sạn', 'Giá ưu đãi', secondaryColor),
      (Icons.ramen_dining_rounded, 'Ăn uống', 'Quán ngon rẻ', tertiaryColor),
      (Icons.attractions_rounded, 'Vui chơi', 'Vé tour & show', secondaryColor),
    ];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Dịch vụ tiện ích', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)), Text('Tất cả (6)', style: TextStyle(fontSize: 11, color: secondaryColor, fontWeight: FontWeight.w700))]),
      const SizedBox(height: 8),
      GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: services.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisExtent: 112, crossAxisSpacing: 8, mainAxisSpacing: 8),
        itemBuilder: (context, index) {
          final service = services[index];
          return InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () => _showNotice(context, service.$2),
            child: AppCard(
              padding: const EdgeInsets.all(8),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(width: 44, height: 44, decoration: BoxDecoration(color: service.$4.withValues(alpha: .13), borderRadius: BorderRadius.circular(12)), child: Icon(service.$1, color: service.$4)),
                const SizedBox(height: 6),
                Text(service.$2, textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700)),
                const SizedBox(height: 1),
                Text(service.$3, textAlign: TextAlign.center, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 9, color: service.$4)),
              ]),
            ),
          );
        },
      ),
    ]);
  }
}

class DestinationCard extends StatelessWidget {
  final Trip trip;
  final bool compact;
  final VoidCallback onTap;
  const DestinationCard({super.key, required this.trip, required this.compact, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: AppCard(
        padding: EdgeInsets.zero,
        child: compact ? _compactCard() : _fullCard(),
      ),
    );
  }

  Widget _fullCard() => Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    SizedBox(height: 140, child: Stack(fit: StackFit.expand, children: [
      ClipRRect(borderRadius: const BorderRadius.vertical(top: Radius.circular(15)), child: VietWayNetworkImage(url: trip.image)),
      Positioned(top: 10, right: 10, child: RatingBadge(rating: trip.rating)),
      Positioned(left: 10, bottom: 10, child: SmallBadge(text: trip.province.toUpperCase(), color: primaryColor.withValues(alpha: .88), textColor: Colors.white)),
    ])),
    Padding(padding: const EdgeInsets.all(14), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [Expanded(child: Text(trip.destination, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800))), PricePill(text: 'Từ ${formatMoney(trip.pricePerPerson)} / người')]),
      const SizedBox(height: 5), Text(trip.description, style: const TextStyle(fontSize: 12, color: mutedTextColor)),
      const SizedBox(height: 10), Row(children: [const Icon(Icons.schedule_rounded, color: primaryColor, size: 16), const SizedBox(width: 4), Text(trip.duration, style: const TextStyle(fontSize: 11, color: mutedTextColor)), const SizedBox(width: 16), const Icon(Icons.trending_down_rounded, color: secondaryColor, size: 16), const SizedBox(width: 4), const Text('Tối ưu ngân sách', style: TextStyle(fontSize: 11, color: mutedTextColor))]),
    ])),
  ]);

  Widget _compactCard() => Padding(padding: const EdgeInsets.all(12), child: Row(children: [
    ClipRRect(borderRadius: BorderRadius.circular(10), child: SizedBox(width: 92, height: 92, child: VietWayNetworkImage(url: trip.image))),
    const SizedBox(width: 12),
    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(trip.tag.toUpperCase(), style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w700, color: primaryColor)),
      const SizedBox(height: 2), Text(trip.destination, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800)),
      const SizedBox(height: 3), Text(trip.description, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 11, color: mutedTextColor)),
      const SizedBox(height: 7), Row(children: [RatingBadge(rating: trip.rating), const Spacer(), Text('Từ ${formatMoney(trip.pricePerPerson)}', style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: primaryColor))]),
    ])),
  ]));
}

class TripBuilderScreen extends StatefulWidget {
  const TripBuilderScreen({super.key});

  @override
  State<TripBuilderScreen> createState() => _TripBuilderScreenState();
}

class _TripBuilderScreenState extends State<TripBuilderScreen> {
  final _formKey = GlobalKey<FormState>();
  final _departureController = TextEditingController(text: 'TP. Hồ Chí Minh');
  final _budgetController = TextEditingController(text: '6.000.000');
  int _numberOfPeople = 2;
  String _duration = '3 ngày 2 đêm';
  final Set<String> _interests = {'Biển', 'Ẩm thực'};
  bool _isLoading = false;
  bool _searched = false;
  List<Trip> _suggestions = [];
  Trip? _selectedTrip;
  CostOption _transport = transportOptions[0];
  CostOption _accommodation = accommodationOptions[0];
  CostOption _food = foodOptions[0];
  final Set<String> _selectedActivityNames = {'VinWonders', 'Tour đảo & lặn ngắm san hô', 'Tháp Bà & chợ Đầm'};

  @override
  void dispose() {
    _departureController.dispose();
    _budgetController.dispose();
    super.dispose();
  }

  int get _budget => parseMoney(_budgetController.text);
  List<Activity> get _selectedActivities => defaultActivities.where((activity) => _selectedActivityNames.contains(activity.name)).toList();

  // Tính tổng chi phí từ state, không hard-code số tiền trong giao diện.
  int calculateTotalPrice() {
    final activityPrice = _selectedActivities.fold<int>(0, (sum, activity) => sum + activity.pricePerPerson);
    return (_transport.pricePerPerson + _accommodation.pricePerPerson + _food.pricePerPerson + activityPrice) * _numberOfPeople;
  }

  void increasePeople() {
    // Tăng số người đi.
    setState(() => _numberOfPeople++);
  }

  void decreasePeople() {
    // Không cho số người đi thấp hơn 1.
    if (_numberOfPeople > 1) {
      setState(() => _numberOfPeople--);
    }
  }

  Future<void> findTrips() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(milliseconds: 500));
    final desiredDays = daysFromDuration(_duration);
    final choices = mockTrips.where((trip) => trip.pricePerPerson * _numberOfPeople <= _budget).toList();
    choices.sort((a, b) {
      final aInterests = a.interests.where(_interests.contains).length;
      final bInterests = b.interests.where(_interests.contains).length;
      if (aInterests != bInterests) return bInterests.compareTo(aInterests);
      final aDuration = (a.days - desiredDays).abs();
      final bDuration = (b.days - desiredDays).abs();
      if (aDuration != bDuration) return aDuration.compareTo(bDuration);
      return (b.pricePerPerson * _numberOfPeople).compareTo(a.pricePerPerson * _numberOfPeople);
    });
    if (!mounted) return;
    setState(() {
      _isLoading = false;
      _searched = true;
      _suggestions = choices.take(3).toList();
      _selectedTrip = choices.isNotEmpty ? choices.first : null;
    });
  }

  void selectTrip(Trip trip) {
    setState(() => _selectedTrip = trip);
  }

  void _chooseOption(String title, List<CostOption> options, CostOption current, ValueChanged<CostOption> onSelected) {
    showModalBottomSheet<void>(
      context: context,
      showDragHandle: true,
      backgroundColor: Colors.white,
      builder: (sheetContext) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
          child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Chọn $title', style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w800)),
            const SizedBox(height: 12),
            ...options.map((option) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {
                  onSelected(option);
                  Navigator.pop(sheetContext);
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: option == current ? const Color(0xFFF0FDFA) : Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: option == current ? primaryColor : borderColor),
                  ),
                  child: Row(children: [
                    Icon(option.icon, color: primaryColor),
                    const SizedBox(width: 10),
                    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(option.name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                      Text('${formatMoney(option.pricePerPerson)} / người', style: const TextStyle(fontSize: 11, color: mutedTextColor)),
                    ])),
                    Icon(option == current ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded, color: option == current ? primaryColor : mutedTextColor),
                  ]),
                ),
              ),
            )),
          ]),
        ),
      ),
    );
  }

  void goToBooking() {
    if (_selectedTrip == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Hãy chọn một chuyến đi trước khi tiếp tục.')));
      return;
    }
    // Truyền object trực tiếp sang xác nhận bằng MaterialPageRoute.
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookingConfirmationScreen(
          trip: _selectedTrip!,
          departure: _departureController.text.trim(),
          numberOfPeople: _numberOfPeople,
          budget: _budget,
          totalPrice: calculateTotalPrice(),
          transport: _transport,
          accommodation: _accommodation,
          food: _food,
          selectedActivities: _selectedActivities,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_rounded)),
        title: const BrandTitle(subtitle: 'Lên kế hoạch'),
      ),
      body: SafeArea(
        top: false,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: ListView(padding: const EdgeInsets.fromLTRB(16, 8, 16, 32), children: [
              _buildTripForm(),
              if (_searched) ...[
                const SizedBox(height: 24),
                _buildSuggestions(),
                if (_selectedTrip != null) ...[
                  const SizedBox(height: 24),
                  _buildCustomization(),
                  const SizedBox(height: 20),
                  _buildItinerary(),
                  const SizedBox(height: 20),
                  _buildCostSummary(),
                ],
              ],
            ]),
          ),
        ),
      ),
    );
  }

  Widget _buildTripForm() {
    const interests = ['Biển', 'Thiên nhiên', 'Ẩm thực', 'Nghỉ dưỡng', 'Khám phá', 'Văn hóa'];
    return AppCard(
      child: Form(
        key: _formKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SmallBadge(text: 'BƯỚC 1 / 3', color: Color(0xFFE5EEFF), textColor: primaryColor),
              SizedBox(height: 8),
              Text('Tạo chuyến đi', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
              SizedBox(height: 4),
              Text('Nhập ngân sách và sở thích, VietWay sẽ gợi ý chuyến đi phù hợp nhất cho bạn.', style: TextStyle(fontSize: 12, color: mutedTextColor)),
            ])),
            const SizedBox(width: 8),
            Container(width: 42, height: 42, decoration: BoxDecoration(color: const Color(0xFFCCFBF1), borderRadius: BorderRadius.circular(12)), child: const Icon(Icons.tune_rounded, color: Color(0xFF115E59))),
          ]),
          const SizedBox(height: 18),
          const FieldLabel(icon: Icons.my_location_rounded, text: 'Điểm xuất phát'),
          const SizedBox(height: 5),
          TextFormField(
            controller: _departureController,
            textInputAction: TextInputAction.next,
            decoration: const InputDecoration(prefixIcon: Icon(Icons.trip_origin_rounded), hintText: 'Nhập nơi bạn bắt đầu'),
            validator: (value) => value == null || value.trim().isEmpty ? 'Vui lòng nhập điểm xuất phát' : null,
          ),
          const SizedBox(height: 12),
          LayoutBuilder(builder: (context, constraints) {
            final wide = constraints.maxWidth >= 380;
            final budgetField = Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const FieldLabel(icon: Icons.savings_rounded, text: 'Ngân sách', color: tertiaryColor),
              const SizedBox(height: 5),
              TextFormField(
                controller: _budgetController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(prefixIcon: Icon(Icons.payments_outlined), suffixText: 'VND'),
                validator: (value) => parseMoney(value ?? '') < 500000 ? 'Tối thiểu 500.000đ' : null,
              ),
            ]));
            final durationField = Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const FieldLabel(icon: Icons.date_range_rounded, text: 'Thời gian', color: secondaryColor),
              const SizedBox(height: 5),
              DropdownButtonFormField<String>(
                initialValue: _duration,
                decoration: const InputDecoration(prefixIcon: Icon(Icons.schedule_rounded)),
                items: const ['2 ngày 1 đêm', '3 ngày 2 đêm', '4 ngày 3 đêm', '5 ngày 4 đêm'].map((duration) => DropdownMenuItem(value: duration, child: Text(duration, overflow: TextOverflow.ellipsis))).toList(),
                onChanged: (value) => setState(() => _duration = value ?? _duration),
              ),
            ]));
            if (wide) return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [budgetField, const SizedBox(width: 8), durationField]);
            return Column(children: [budgetField, const SizedBox(height: 12), durationField]);
          }),
          const SizedBox(height: 12),
          Container(
            height: 52,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(color: inputColor, borderRadius: BorderRadius.circular(12)),
            child: Row(children: [
              const Icon(Icons.group_rounded, color: mutedTextColor),
              const SizedBox(width: 8),
              const Expanded(child: Text('Số người đi')),
              IconButton(onPressed: decreasePeople, icon: const Icon(Icons.remove_rounded), style: IconButton.styleFrom(backgroundColor: Colors.white, minimumSize: const Size(32, 32))),
              SizedBox(width: 28, child: Text('$_numberOfPeople', textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.w800, color: primaryColor))),
              IconButton(onPressed: increasePeople, icon: const Icon(Icons.add_rounded, color: Colors.white), style: IconButton.styleFrom(backgroundColor: primaryColor, minimumSize: const Size(32, 32))),
            ]),
          ),
          const SizedBox(height: 16),
          const Text('Sở thích du lịch (chọn nhiều)', style: TextStyle(fontSize: 12, color: mutedTextColor, fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Wrap(spacing: 8, runSpacing: 8, children: interests.map((interest) => FilterChip(
            label: Text(interest),
            selected: _interests.contains(interest),
            onSelected: (selected) => setState(() {
              if (selected) {
                _interests.add(interest);
              } else {
                _interests.remove(interest);
              }
            }),
            selectedColor: const Color(0xFFCCFBF1),
            checkmarkColor: const Color(0xFF115E59),
            labelStyle: TextStyle(fontSize: 12, color: _interests.contains(interest) ? const Color(0xFF115E59) : mutedTextColor, fontWeight: FontWeight.w600),
            side: BorderSide(color: _interests.contains(interest) ? primaryColor : borderColor),
          )).toList()),
          const SizedBox(height: 18),
          ElevatedButton.icon(
            onPressed: _isLoading ? null : findTrips,
            icon: _isLoading ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)) : const Icon(Icons.auto_awesome_rounded),
            label: Text(_isLoading ? 'Đang tìm gợi ý...' : 'Tìm chuyến đi'),
          ),
        ]),
      ),
    );
  }

  Widget _buildSuggestions() {
    if (_suggestions.isEmpty) {
      return AppCard(
        color: const Color(0xFFFFFBEB),
        child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Icon(Icons.sentiment_dissatisfied_rounded, color: tertiaryColor),
          SizedBox(height: 8),
          Text('Chưa tìm thấy chuyến phù hợp với ngân sách này.', style: TextStyle(fontWeight: FontWeight.w800)),
          SizedBox(height: 4),
          Text('Bạn có thể tăng ngân sách hoặc giảm số ngày.', style: TextStyle(fontSize: 12, color: mutedTextColor)),
        ]),
      );
    }
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('BƯỚC 2 / 3', style: TextStyle(color: secondaryColor, fontSize: 10, fontWeight: FontWeight.w700)),
          SizedBox(height: 3),
          Text('Gợi ý phù hợp với bạn', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
        ]),
        SmallBadge(text: '${_suggestions.length} lựa chọn tối ưu', color: const Color(0xFFCCFBF1), textColor: const Color(0xFF115E59)),
      ]),
      const SizedBox(height: 12),
      ..._suggestions.map((trip) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: TripSuggestionCard(
          trip: trip,
          numberOfPeople: _numberOfPeople,
          selected: trip == _selectedTrip,
          onTap: () => selectTrip(trip),
        ),
      )),
    ]);
  }

  Widget _buildCustomization() {
    final total = calculateTotalPrice();
    final remaining = _budget - total;
    final progress = _budget == 0 ? 0.0 : (total / _budget).clamp(0.0, 1.0);
    final statusColor = remaining < 0 ? const Color(0xFFEF4444) : progress > .85 ? tertiaryColor : primaryColor;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('BƯỚC 3 / 3', style: TextStyle(color: tertiaryColor, fontSize: 10, fontWeight: FontWeight.w700)),
          SizedBox(height: 3),
          Text('Tùy chỉnh & lịch trình', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
        ]),
        SmallBadge(text: '${_selectedTrip!.destination} · ${_selectedTrip!.duration}', color: const Color(0xFFE5EEFF), textColor: mainTextColor),
      ]),
      const SizedBox(height: 12),
      AppCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Kế hoạch chi tiêu', style: TextStyle(fontSize: 12, color: mutedTextColor)), Text(remaining >= 0 ? 'Còn dư ${formatMoney(remaining)}' : 'Vượt ${formatMoney(-remaining)}', style: TextStyle(fontSize: 12, color: statusColor, fontWeight: FontWeight.w800))]),
        const SizedBox(height: 10),
        ClipRRect(borderRadius: BorderRadius.circular(8), child: LinearProgressIndicator(value: progress, minHeight: 10, backgroundColor: const Color(0xFFE2E8F0), color: statusColor)),
        const SizedBox(height: 12),
        Row(children: [
          Expanded(child: MetricBox(label: 'Ngân sách', value: formatMoney(_budget))),
          const SizedBox(width: 8),
          Expanded(child: MetricBox(label: 'Chi phí chọn', value: formatMoney(total), color: primaryColor)),
          const SizedBox(width: 8),
          Expanded(child: MetricBox(label: remaining >= 0 ? 'Dư khả dụng' : 'Vượt ngân sách', value: formatMoney(remaining.abs()), color: statusColor, tinted: true)),
        ]),
      ])),
      const SizedBox(height: 16),
      const Text('Tùy chọn dịch vụ', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800)),
      const SizedBox(height: 8),
      ServiceOptionTile(title: 'Phương tiện', option: _transport, color: secondaryColor, onChange: () => _chooseOption('phương tiện', transportOptions, _transport, (value) => setState(() => _transport = value))),
      const SizedBox(height: 8),
      ServiceOptionTile(title: 'Nơi lưu trú', option: _accommodation, color: primaryColor, onChange: () => _chooseOption('nơi lưu trú', accommodationOptions, _accommodation, (value) => setState(() => _accommodation = value))),
      const SizedBox(height: 8),
      ServiceOptionTile(title: 'Gói ăn uống', option: _food, color: tertiaryColor, onChange: () => _chooseOption('gói ăn uống', foodOptions, _food, (value) => setState(() => _food = value))),
      const SizedBox(height: 10),
      AppCard(padding: const EdgeInsets.all(12), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [const Icon(Icons.attractions_rounded, color: primaryColor, size: 20), const SizedBox(width: 7), const Expanded(child: Text('Điểm vui chơi & trải nghiệm', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w800))), Text('${_selectedActivities.length}/${defaultActivities.length} đã chọn', style: const TextStyle(fontSize: 11, color: mutedTextColor))]),
        const SizedBox(height: 8),
        ...defaultActivities.map((activity) => CheckboxListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          dense: true,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          tileColor: inputColor,
          value: _selectedActivityNames.contains(activity.name),
          activeColor: primaryColor,
          onChanged: (selected) => setState(() { selected == true ? _selectedActivityNames.add(activity.name) : _selectedActivityNames.remove(activity.name); }),
          title: Row(children: [
            Expanded(child: Text(activity.name, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600))),
            Text(activity.pricePerPerson == 0 ? 'Miễn phí' : '+${formatMoney(activity.pricePerPerson)}', style: TextStyle(fontSize: 11, color: activity.pricePerPerson == 0 ? primaryColor : tertiaryColor, fontWeight: FontWeight.w700)),
          ]),
          secondary: Icon(activity.icon, size: 18, color: primaryColor),
          controlAffinity: ListTileControlAffinity.leading,
        )),
      ])),
    ]);
  }

  Widget _buildItinerary() {
    final place = _selectedTrip!.destination;
    final plans = [
      ('N1', 'Ngày 1: Check-in & khám phá $place', 'Khởi hành • Nhận phòng • Dạo phố và thưởng thức đặc sản địa phương', primaryColor),
      ('N2', 'Ngày 2: Trải nghiệm nổi bật', 'Tham quan điểm đến chính • Ăn trưa • Hoạt động theo sở thích', secondaryColor),
      ('N3', 'Ngày 3: Thư giãn & trở về', 'Cà phê buổi sáng • Mua quà • Trả phòng và khởi hành về', tertiaryColor),
    ];
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Lịch trình đề xuất', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800)), Text('Tự động tối ưu', style: TextStyle(fontSize: 11, color: primaryColor))]),
      const SizedBox(height: 8),
      ...plans.take(_selectedTrip!.days.clamp(0, 3)).map((plan) => Padding(padding: const EdgeInsets.only(bottom: 8), child: AppCard(padding: const EdgeInsets.all(12), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CircleAvatar(radius: 16, backgroundColor: plan.$4, child: Text(plan.$1, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.w700))),
        const SizedBox(width: 10),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(plan.$2, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700)), const SizedBox(height: 3), Text(plan.$3, style: const TextStyle(fontSize: 11, color: mutedTextColor))])),
        IconButton(onPressed: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Lịch trình đã được tối ưu tự động.'))), icon: const Icon(Icons.edit_outlined, size: 19, color: mutedTextColor)),
      ])))),
    ]);
  }

  Widget _buildCostSummary() {
    final total = calculateTotalPrice();
    final remaining = _budget - total;
    final rows = [
      ('Phương tiện (${_transport.name})', _transport.pricePerPerson * _numberOfPeople),
      ('Nơi lưu trú (${_accommodation.name})', _accommodation.pricePerPerson * _numberOfPeople),
      ('Gói ăn uống (${_food.name})', _food.pricePerPerson * _numberOfPeople),
      ('Vui chơi & trải nghiệm', _selectedActivities.fold<int>(0, (sum, item) => sum + item.pricePerPerson) * _numberOfPeople),
    ];
    return AppCard(color: const Color(0xFFDCE9FF), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Text('Tóm tắt chi phí dự tính', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800)), SmallBadge(text: remaining >= 0 ? 'Trong ngân sách' : 'Cần điều chỉnh', color: Colors.white, textColor: remaining >= 0 ? primaryColor : const Color(0xFFB91C1C))]),
      const SizedBox(height: 10),
      ...rows.map((row) => Padding(padding: const EdgeInsets.only(bottom: 6), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Expanded(child: Text(row.$1, style: const TextStyle(fontSize: 11, color: mutedTextColor))), Text(formatMoney(row.$2), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700))]))),
      const Divider(height: 20),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.end, children: [
        const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Tổng cộng chi trả', style: TextStyle(fontSize: 11, color: mutedTextColor)), Text('Động theo lựa chọn', style: TextStyle(fontSize: 10, color: mutedTextColor))]),
        Text(formatMoney(total), style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: primaryColor)),
      ]),
      const SizedBox(height: 14),
      ElevatedButton.icon(onPressed: goToBooking, icon: const Icon(Icons.arrow_forward_rounded), label: const Text('Tiếp tục đặt chuyến')),
      const SizedBox(height: 8),
      const Center(child: Text('🔒 Bảo lưu giá trong 24 giờ • Hủy miễn phí', style: TextStyle(fontSize: 10, color: mutedTextColor))),
    ]));
  }
}

class TripSuggestionCard extends StatelessWidget {
  final Trip trip;
  final int numberOfPeople;
  final bool selected;
  final VoidCallback onTap;
  const TripSuggestionCard({super.key, required this.trip, required this.numberOfPeople, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final total = trip.pricePerPerson * numberOfPeople;
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16), border: Border.all(color: selected ? primaryColor : borderColor, width: selected ? 2 : 1), boxShadow: const [BoxShadow(color: Color(0x0D0F172A), blurRadius: 4, offset: Offset(0, 2))]),
        padding: const EdgeInsets.all(12),
        child: Column(children: [
          Row(children: [
            ClipRRect(borderRadius: BorderRadius.circular(10), child: SizedBox(width: 88, height: 88, child: VietWayNetworkImage(url: trip.image))),
            const SizedBox(width: 12),
            Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(trip.tag.toUpperCase(), style: const TextStyle(fontSize: 9, fontWeight: FontWeight.w800, color: primaryColor)),
              const SizedBox(height: 2),
              Row(children: [Expanded(child: Text(trip.destination, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w800))), RatingBadge(rating: trip.rating)]),
              const SizedBox(height: 9),
              Text(formatMoney(total), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800, color: primaryColor)),
              Text('Cho $numberOfPeople người • ${trip.duration}', style: const TextStyle(fontSize: 11, color: mutedTextColor)),
            ])),
          ]),
          const SizedBox(height: 10),
          Container(width: double.infinity, padding: const EdgeInsets.all(9), decoration: BoxDecoration(color: inputColor, borderRadius: BorderRadius.circular(10)), child: Text('🚌 Xe khách  •  🏡 Homestay  •  🍜 Ăn uống  •  🎡 Vui chơi', style: const TextStyle(fontSize: 10, color: mutedTextColor))),
          const SizedBox(height: 10),
          SizedBox(width: double.infinity, height: 42, child: selected ? ElevatedButton.icon(onPressed: onTap, icon: const Icon(Icons.check_circle_rounded, size: 18), label: const Text('Đang chọn gói này')) : OutlinedButton.icon(onPressed: onTap, icon: const Icon(Icons.arrow_forward_rounded, size: 18), label: const Text('Chọn gói này'))),
        ]),
      ),
    );
  }
}

class BookingConfirmationScreen extends StatefulWidget {
  final Trip trip;
  final String departure;
  final int numberOfPeople;
  final int budget;
  final int totalPrice;
  final CostOption transport;
  final CostOption accommodation;
  final CostOption food;
  final List<Activity> selectedActivities;

  const BookingConfirmationScreen({
    super.key,
    required this.trip,
    required this.departure,
    required this.numberOfPeople,
    required this.budget,
    required this.totalPrice,
    required this.transport,
    required this.accommodation,
    required this.food,
    required this.selectedActivities,
  });

  @override
  State<BookingConfirmationScreen> createState() => _BookingConfirmationScreenState();
}

class _BookingConfirmationScreenState extends State<BookingConfirmationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController(text: 'Nguyễn Văn An');
  final _phoneController = TextEditingController(text: '0912345678');
  final _emailController = TextEditingController(text: 'an.nguyen@email.com');
  bool _isSubmitting = false;

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  Future<void> goToPayment() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSubmitting = true);
    await Future.delayed(const Duration(milliseconds: 500));
    if (!mounted) return;
    final booking = BookingData(
      trip: widget.trip,
      departure: widget.departure,
      numberOfPeople: widget.numberOfPeople,
      budget: widget.budget,
      totalPrice: widget.totalPrice,
      transport: widget.transport,
      accommodation: widget.accommodation,
      food: widget.food,
      selectedActivities: widget.selectedActivities,
      fullName: _nameController.text.trim(),
      phone: _phoneController.text.trim(),
      email: _emailController.text.trim(),
    );
    final paymentData = PaymentData(booking: booking, departureDate: '15/11/2026');
    // Truyền dữ liệu bằng Named Route arguments sang màn Thanh toán.
    Navigator.pushNamed(context, '/payment', arguments: paymentData);
    if (mounted) setState(() => _isSubmitting = false);
  }

  @override
  Widget build(BuildContext context) {
    final trip = widget.trip;
    final remaining = widget.budget - widget.totalPrice;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_rounded)),
        title: const BrandTitle(subtitle: 'Kiểm tra thông tin'),
      ),
      body: SafeArea(
        top: false,
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 520),
            child: ListView(padding: const EdgeInsets.fromLTRB(16, 8, 16, 32), children: [
              Row(children: [const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Xác nhận chuyến đi', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800)), SizedBox(height: 2), Text('Bước 3 / 4 · Kiểm tra thông tin', style: TextStyle(fontSize: 11, color: primaryColor, fontWeight: FontWeight.w600))])), SmallBadge(text: 'Bảo đảm giá tốt', color: const Color(0xFFCCFBF1), textColor: const Color(0xFF115E59))]),
              const SizedBox(height: 14),
              _BookingHero(trip: trip, departure: widget.departure),
              const SizedBox(height: 14),
              _buildContactForm(),
              const SizedBox(height: 14),
              _buildTripInfo(),
              const SizedBox(height: 14),
              _buildServiceInfo(),
              const SizedBox(height: 14),
              AppCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const SectionHeading(icon: Icons.receipt_long_rounded, title: 'Tổng thanh toán'),
                const SizedBox(height: 12),
                PriceRow(label: 'Chi phí dịch vụ dự toán', value: formatMoney(widget.totalPrice)),
                const SizedBox(height: 8),
                Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: inputColor, borderRadius: BorderRadius.circular(10)), child: Row(children: [const Icon(Icons.savings_rounded, color: primaryColor, size: 19), const SizedBox(width: 6), Expanded(child: Text(remaining >= 0 ? 'Tiết kiệm so với ngân sách' : 'Cần điều chỉnh ngân sách', style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600))), Text(remaining >= 0 ? '+${formatMoney(remaining)}' : '-${formatMoney(-remaining)}', style: TextStyle(fontSize: 13, color: remaining >= 0 ? primaryColor : const Color(0xFFB91C1C), fontWeight: FontWeight.w800))])),
                const Divider(height: 24),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Tổng cộng', style: TextStyle(fontWeight: FontWeight.w800)), Text('Đã gồm thuế & phí nền tảng', style: TextStyle(fontSize: 10, color: mutedTextColor))]), Text(formatMoney(widget.totalPrice), style: const TextStyle(fontSize: 22, color: primaryColor, fontWeight: FontWeight.w800))]),
              ])),
              const SizedBox(height: 12),
              const Row(children: [Icon(Icons.verified_user_rounded, color: primaryColor, size: 18), SizedBox(width: 6), Expanded(child: Text('Miễn phí hủy trong vòng 24h trước giờ khởi hành. Hỗ trợ 24/7.', style: TextStyle(fontSize: 11, color: mutedTextColor)))]),
              const SizedBox(height: 16),
              ElevatedButton.icon(onPressed: _isSubmitting ? null : goToPayment, icon: _isSubmitting ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)) : const Icon(Icons.payments_rounded), label: Text(_isSubmitting ? 'Đang tạo đơn...' : 'Xác nhận và thanh toán')),
            ]),
          ),
        ),
      ),
    );
  }

  Widget _buildContactForm() {
    return AppCard(child: Form(key: _formKey, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SectionHeading(icon: Icons.badge_rounded, title: 'Thông tin người liên hệ', subtitle: 'Thông tin vé và mã lưu trú sẽ gửi qua đây'),
      const SizedBox(height: 14),
      const RequiredLabel(text: 'Họ và tên'),
      const SizedBox(height: 5),
      TextFormField(controller: _nameController, decoration: const InputDecoration(prefixIcon: Icon(Icons.person_outline_rounded), hintText: 'Nhập họ và tên của bạn'), validator: (value) => value == null || value.trim().isEmpty ? 'Vui lòng nhập họ và tên' : null),
      const SizedBox(height: 10),
      const RequiredLabel(text: 'Số điện thoại Zalo/SMS'),
      const SizedBox(height: 5),
      TextFormField(controller: _phoneController, keyboardType: TextInputType.phone, decoration: const InputDecoration(prefixIcon: Icon(Icons.phone_iphone_rounded), hintText: '09xx xxx xxx'), validator: (value) { final digits = (value ?? '').replaceAll(RegExp(r'\D'), ''); return RegExp(r'^\d{9,11}$').hasMatch(digits) ? null : 'Số điện thoại cần có 9–11 chữ số'; }),
      const SizedBox(height: 10),
      const RequiredLabel(text: 'Email nhận hóa đơn điện tử'),
      const SizedBox(height: 5),
      TextFormField(controller: _emailController, keyboardType: TextInputType.emailAddress, decoration: const InputDecoration(prefixIcon: Icon(Icons.mail_outline_rounded), hintText: 'tenban@domain.com'), validator: (value) => RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(value ?? '') ? null : 'Email chưa đúng định dạng'),
    ])));
  }

  Widget _buildTripInfo() {
    return AppCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const SectionHeading(icon: Icons.calendar_month_rounded, title: 'Thông tin chuyến đi'),
      const SizedBox(height: 12),
      InfoWideTile(icon: Icons.near_me_rounded, label: 'Hành trình', value: '${widget.departure} → ${widget.trip.destination}', trailing: const SmallBadge(text: 'Khứ hồi', color: Color(0xFFE5EEFF), textColor: secondaryColor)),
      const SizedBox(height: 8),
      Row(children: [Expanded(child: InfoMiniTile(icon: Icons.schedule_rounded, label: 'Thời gian', value: widget.trip.duration)), const SizedBox(width: 8), const Expanded(child: InfoMiniTile(icon: Icons.event_rounded, label: 'Khởi hành', value: '15/11/2026'))]),
      const SizedBox(height: 8),
      InfoWideTile(icon: Icons.group_rounded, label: 'Số lượng thành viên', value: '${widget.numberOfPeople} người lớn', trailing: CircleAvatar(radius: 14, backgroundColor: primaryColor, child: Text('${widget.numberOfPeople}', style: const TextStyle(fontSize: 11, color: Colors.white, fontWeight: FontWeight.w700)))),
    ]));
  }

  Widget _buildServiceInfo() {
    final items = [
      ('🚌', widget.transport.name, '${formatMoney(widget.transport.pricePerPerson)} / người'),
      ('🏡', widget.accommodation.name, '${formatMoney(widget.accommodation.pricePerPerson)} / người'),
      ('🍜', widget.food.name, '${formatMoney(widget.food.pricePerPerson)} / người'),
      ('🎡', widget.selectedActivities.isEmpty ? 'Chưa chọn vui chơi' : '${widget.selectedActivities.length} trải nghiệm đã chọn', widget.selectedActivities.map((item) => item.name).join(' • ')),
    ];
    return AppCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [const Expanded(child: SectionHeading(icon: Icons.checklist_rounded, title: 'Dịch vụ đã chọn')), OutlinedButton.icon(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.edit_rounded, size: 16), label: const Text('Chỉnh sửa'))]),
      const SizedBox(height: 12),
      ...items.map((item) => Padding(padding: const EdgeInsets.only(bottom: 7), child: Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: inputColor, borderRadius: BorderRadius.circular(10)), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(item.$1, style: const TextStyle(fontSize: 17)), const SizedBox(width: 8), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(item.$2, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700)), const SizedBox(height: 2), Text(item.$3, maxLines: 2, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 10, color: mutedTextColor))])), const SmallBadge(text: 'Đã chọn', color: Color(0xFFE5EEFF), textColor: primaryColor)])))),
    ]));
  }
}

class _BookingHero extends StatelessWidget {
  final Trip trip;
  final String departure;
  const _BookingHero({required this.trip, required this.departure});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(borderRadius: BorderRadius.circular(16), child: SizedBox(height: 132, child: Stack(fit: StackFit.expand, children: [
      VietWayNetworkImage(url: trip.image),
      const DecoratedBox(decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.transparent, Color(0xE00F172A)], begin: Alignment.topCenter, end: Alignment.bottomCenter))),
      Positioned(left: 14, right: 14, bottom: 12, child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.end, children: [
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('CHUYẾN ĐI TỰ TÚC TIẾT KIỆM', style: TextStyle(fontSize: 9, letterSpacing: .6, fontWeight: FontWeight.w700, color: const Color(0xFF89F5E7))), const SizedBox(height: 3), Text('$departure → ${trip.destination}', style: const TextStyle(fontSize: 17, color: Colors.white, fontWeight: FontWeight.w800))])),
        SmallBadge(text: trip.duration.replaceAll(' ngày ', 'N').replaceAll(' đêm', 'Đ'), color: Colors.white, textColor: primaryColor),
      ])),
    ])));
  }
}

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String _method = 'MoMo';
  bool _isPaying = false;

  Future<void> _pay(PaymentData data) async {
    setState(() => _isPaying = true);
    await Future.delayed(const Duration(milliseconds: 800));
    if (!mounted) return;
    setState(() => _isPaying = false);
    showSuccessDialog(data);
  }

  void showSuccessDialog(PaymentData data) {
    final code = 'VW-${DateTime.now().millisecondsSinceEpoch.toString().substring(7)}';
    showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        contentPadding: const EdgeInsets.fromLTRB(24, 24, 24, 18),
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          const CircleAvatar(radius: 32, backgroundColor: Color(0xFFCCFBF1), child: Icon(Icons.check_circle_rounded, size: 42, color: Color(0xFF115E59))),
          const SizedBox(height: 12),
          const Text('Đặt chuyến thành công!', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
          const SizedBox(height: 7),
          SmallBadge(text: '#$code', color: const Color(0xFFE5EEFF), textColor: primaryColor),
          const SizedBox(height: 12),
          const Text('Chuyến đi của bạn đã được xác nhận. Chúc bạn có một kỳ nghỉ thật tuyệt vời cùng VietWay!', textAlign: TextAlign.center, style: TextStyle(fontSize: 12, color: mutedTextColor)),
          const SizedBox(height: 14),
          Container(width: double.infinity, padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: inputColor, borderRadius: BorderRadius.circular(12)), child: Column(children: [
            PriceRow(label: 'Lịch trình & khách', value: '${data.booking.trip.destination} · ${data.booking.trip.duration}'),
            const SizedBox(height: 7),
            PriceRow(label: 'Số lượng', value: '${data.booking.numberOfPeople} khách người lớn'),
            const Divider(height: 16),
            PriceRow(label: 'Tổng đã thanh toán', value: formatMoney(data.booking.totalPrice), emphasized: true),
          ])),
          const SizedBox(height: 16),
          SizedBox(width: double.infinity, child: ElevatedButton.icon(
            onPressed: () {
              // Quay về instance trang chủ bằng Navigator.popUntil.
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
            icon: const Icon(Icons.home_rounded),
            label: const Text('Về trang chủ'),
          )),
        ]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Nhận dữ liệu thanh toán từ Named Route arguments.
    final data = ModalRoute.of(context)!.settings.arguments as PaymentData;
    final methods = [
      ('MoMo', 'Ví điện tử MoMo', 'Xác thực tức thì • Giảm 50k qua mã VIETWAY', Icons.account_balance_wallet_rounded, const Color(0xFFA50064)),
      ('VNPay', 'VNPay', 'Thanh toán bảo mật bằng ứng dụng ngân hàng', Icons.qr_code_scanner_rounded, secondaryColor),
      ('ZaloPay', 'ZaloPay', 'Thanh toán nhanh, tích điểm tiện lợi', Icons.wallet_rounded, const Color(0xFF0068FF)),
      ('Thẻ ngân hàng', 'Thẻ ngân hàng', 'Visa, Mastercard, JCB, Napas', Icons.credit_card_rounded, primaryColor),
      ('Chuyển khoản', 'Chuyển khoản ngân hàng', 'VietQR / Tự động xác nhận 24/7', Icons.account_balance_rounded, mutedTextColor),
    ];
    return Scaffold(
      appBar: AppBar(leading: IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.arrow_back_rounded)), title: const BrandTitle(subtitle: 'Xác nhận đơn hàng')),
      body: SafeArea(top: false, child: Center(child: ConstrainedBox(constraints: const BoxConstraints(maxWidth: 520), child: ListView(padding: const EdgeInsets.fromLTRB(16, 8, 16, 32), children: [
        Row(children: [const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Thanh toán', style: TextStyle(fontSize: 21, fontWeight: FontWeight.w800)), SizedBox(height: 2), Text('Bước 4 / 4: Xác nhận đơn hàng', style: TextStyle(fontSize: 11, color: mutedTextColor))])), SmallBadge(text: 'Bảo mật 100%', color: const Color(0xFFDCE9FF), textColor: primaryColor)]),
        const SizedBox(height: 14),
        _PaymentSummary(data: data),
        const SizedBox(height: 18),
        const Row(children: [Icon(Icons.payments_rounded, color: primaryColor, size: 20), SizedBox(width: 7), Expanded(child: Text('Chọn phương thức thanh toán', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800))), Text('Miễn phí giao dịch', style: TextStyle(fontSize: 10, color: mutedTextColor))]),
        const SizedBox(height: 10),
        ...methods.map((method) => Padding(padding: const EdgeInsets.only(bottom: 8), child: PaymentMethodTile(method: method.$1, title: method.$2, subtitle: method.$3, icon: method.$4, color: method.$5, selected: _method == method.$1, onTap: () => setState(() => _method = method.$1)))),
        const SizedBox(height: 8),
        ElevatedButton.icon(onPressed: _isPaying ? null : () => _pay(data), icon: _isPaying ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white)) : const Icon(Icons.verified_user_rounded), label: Text(_isPaying ? 'Đang xử lý thanh toán...' : 'Thanh toán ngay (${formatMoney(data.booking.totalPrice)})')),
        const SizedBox(height: 8),
        const Text('Nhấn xác nhận đồng nghĩa với việc bạn đồng ý với Điều khoản dịch vụ VietWay.', textAlign: TextAlign.center, style: TextStyle(fontSize: 10, color: mutedTextColor)),
      ])))),
    );
  }
}

class _PaymentSummary extends StatelessWidget {
  final PaymentData data;
  const _PaymentSummary({required this.data});

  @override
  Widget build(BuildContext context) {
    final booking = data.booking;
    return AppCard(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Row(children: [Container(width: 40, height: 40, decoration: BoxDecoration(color: const Color(0xFFE5EEFF), borderRadius: BorderRadius.circular(10)), child: const Icon(Icons.beach_access_rounded, color: primaryColor)), const SizedBox(width: 9), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('${booking.trip.destination} – ${booking.trip.duration}', style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800)), const Text('Gói linh hoạt theo ngân sách', style: TextStyle(fontSize: 11, color: mutedTextColor))])), const SmallBadge(text: 'Tour trọn gói', color: Color(0xFFFFDCC3), textColor: Color(0xFF6E3900))]),
      const SizedBox(height: 12),
      Container(padding: const EdgeInsets.all(9), decoration: BoxDecoration(color: inputColor, borderRadius: BorderRadius.circular(10)), child: Row(children: [const Icon(Icons.calendar_month_rounded, size: 16, color: primaryColor), const SizedBox(width: 5), Expanded(child: Text(data.departureDate, style: const TextStyle(fontSize: 11))), const Icon(Icons.group_rounded, size: 16, color: secondaryColor), const SizedBox(width: 5), Text('${booking.numberOfPeople} khách', style: const TextStyle(fontSize: 11))])),
      const SizedBox(height: 10),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Tổng chi phí chuyến đi', style: TextStyle(fontSize: 11, color: mutedTextColor)), Text('Đã gồm thuế & phí dịch vụ', style: TextStyle(fontSize: 10, color: primaryColor))]), Text(formatMoney(booking.totalPrice), style: const TextStyle(fontSize: 22, color: primaryColor, fontWeight: FontWeight.w800))]),
    ]));
  }
}

class PaymentMethodTile extends StatelessWidget {
  final String method;
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final bool selected;
  final VoidCallback onTap;
  const PaymentMethodTile({super.key, required this.method, required this.title, required this.subtitle, required this.icon, required this.color, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onTap, borderRadius: BorderRadius.circular(14), child: Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: selected ? const Color(0xFFF0FDFA) : Colors.white, borderRadius: BorderRadius.circular(14), border: Border.all(color: selected ? primaryColor : borderColor, width: selected ? 1.5 : 1)), child: Row(children: [
      Container(width: 42, height: 42, decoration: BoxDecoration(color: color.withValues(alpha: .11), borderRadius: BorderRadius.circular(10)), child: Icon(icon, color: color)),
      const SizedBox(width: 10),
      Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [Expanded(child: Text(title, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700))), if (method == 'MoMo') const SmallBadge(text: 'Ưu đãi', color: Color(0xFFFFDCC3), textColor: Color(0xFF6E3900))]), const SizedBox(height: 2), Text(subtitle, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 10, color: mutedTextColor))])),
      const SizedBox(width: 6),
      Icon(selected ? Icons.check_circle_rounded : Icons.radio_button_unchecked_rounded, color: selected ? primaryColor : const Color(0xFF94A3B8)),
    ])));
  }
}

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color color;
  const AppCard({super.key, required this.child, this.padding = const EdgeInsets.all(16), this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(16), border: Border.all(color: borderColor), boxShadow: const [BoxShadow(color: Color(0x0D0F172A), blurRadius: 4, offset: Offset(0, 2))]),
      child: child,
    );
  }
}

class VietWayNetworkImage extends StatelessWidget {
  final String url;
  const VietWayNetworkImage({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Image.network(url, fit: BoxFit.cover, errorBuilder: (_, __, ___) => Container(color: const Color(0xFFDCE9FF), alignment: Alignment.center, child: const Icon(Icons.landscape_rounded, color: secondaryColor, size: 34)));
  }
}

class RatingBadge extends StatelessWidget {
  final double rating;
  const RatingBadge({super.key, required this.rating});

  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4), decoration: BoxDecoration(color: Colors.white.withValues(alpha: .92), borderRadius: BorderRadius.circular(20)), child: Row(mainAxisSize: MainAxisSize.min, children: [const Icon(Icons.star_rounded, color: tertiaryColor, size: 14), const SizedBox(width: 2), Text(rating.toString(), style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700))]));
}

class SmallBadge extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  const SmallBadge({super.key, required this.text, required this.color, required this.textColor});

  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4), decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)), child: Text(text, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 9, fontWeight: FontWeight.w700, color: textColor)));
}

class PricePill extends StatelessWidget {
  final String text;
  const PricePill({super.key, required this.text});

  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 4), decoration: BoxDecoration(color: const Color(0xFFCCFBF1), borderRadius: BorderRadius.circular(20)), child: Text(text, style: const TextStyle(fontSize: 9, color: Color(0xFF115E59), fontWeight: FontWeight.w700)));
}

class FieldLabel extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  const FieldLabel({super.key, required this.icon, required this.text, this.color = primaryColor});

  @override
  Widget build(BuildContext context) => Row(children: [Icon(icon, size: 15, color: color), const SizedBox(width: 4), Text(text, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: mutedTextColor))]);
}

class MetricBox extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  final bool tinted;
  const MetricBox({super.key, required this.label, required this.value, this.color = mainTextColor, this.tinted = false});

  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8), decoration: BoxDecoration(color: tinted ? const Color(0xFFCCFBF1).withValues(alpha: .55) : inputColor, borderRadius: BorderRadius.circular(9)), child: Column(children: [Text(label, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 8, color: mutedTextColor)), const SizedBox(height: 3), Text(value, maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.w800))]));
}

class ServiceOptionTile extends StatelessWidget {
  final String title;
  final CostOption option;
  final Color color;
  final VoidCallback onChange;
  const ServiceOptionTile({super.key, required this.title, required this.option, required this.color, required this.onChange});

  @override
  Widget build(BuildContext context) => AppCard(padding: const EdgeInsets.all(12), child: Row(children: [Container(width: 40, height: 40, decoration: BoxDecoration(color: color.withValues(alpha: .12), borderRadius: BorderRadius.circular(10)), child: Icon(option.icon, color: color, size: 21)), const SizedBox(width: 10), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontSize: 10, color: mutedTextColor)), Text(option.name, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w700)), Text('${formatMoney(option.pricePerPerson)} / người', style: const TextStyle(fontSize: 10, color: mutedTextColor))])), TextButton.icon(onPressed: onChange, icon: const Icon(Icons.swap_horiz_rounded, size: 16), label: const Text('Thay đổi', style: TextStyle(fontSize: 11)))]));
}

class BrandTitle extends StatelessWidget {
  final String subtitle;
  const BrandTitle({super.key, required this.subtitle});

  @override
  Widget build(BuildContext context) => Row(children: [Image.asset('assets/images/vietway_logo.png', height: 28, errorBuilder: (_, __, ___) => const Icon(Icons.route, color: primaryColor)), const SizedBox(width: 6), Column(crossAxisAlignment: CrossAxisAlignment.start, children: [const Text('VietWay', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w800, color: primaryColor)), Text(subtitle, style: const TextStyle(fontSize: 9, color: mutedTextColor))])]);
}

class SectionHeading extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;
  const SectionHeading({super.key, required this.icon, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) => Row(children: [Container(width: 28, height: 28, decoration: BoxDecoration(color: const Color(0xFFE5EEFF), borderRadius: BorderRadius.circular(8)), child: Icon(icon, color: primaryColor, size: 17)), const SizedBox(width: 8), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w800)), if (subtitle != null) Text(subtitle!, style: const TextStyle(fontSize: 10, color: mutedTextColor))]))]);
}

class RequiredLabel extends StatelessWidget {
  final String text;
  const RequiredLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) => RichText(text: TextSpan(style: const TextStyle(fontSize: 11, color: mutedTextColor, fontFamily: 'Be Vietnam Pro', fontWeight: FontWeight.w600), children: [TextSpan(text: text), const TextSpan(text: ' *', style: TextStyle(color: Color(0xFFEF4444)))]));
}

class InfoWideTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Widget trailing;
  const InfoWideTile({super.key, required this.icon, required this.label, required this.value, required this.trailing});

  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: inputColor, borderRadius: BorderRadius.circular(10)), child: Row(children: [Icon(icon, color: secondaryColor, size: 20), const SizedBox(width: 8), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(label, style: const TextStyle(fontSize: 10, color: mutedTextColor)), Text(value, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700))])), trailing]));
}

class InfoMiniTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const InfoMiniTile({super.key, required this.icon, required this.label, required this.value});

  @override
  Widget build(BuildContext context) => Container(padding: const EdgeInsets.all(10), decoration: BoxDecoration(color: inputColor, borderRadius: BorderRadius.circular(10)), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Row(children: [Icon(icon, size: 15, color: mutedTextColor), const SizedBox(width: 3), Text(label, style: const TextStyle(fontSize: 9, color: mutedTextColor))]), const SizedBox(height: 4), Text(value, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700))]));
}

class PriceRow extends StatelessWidget {
  final String label;
  final String value;
  final bool emphasized;
  const PriceRow({super.key, required this.label, required this.value, this.emphasized = false});

  @override
  Widget build(BuildContext context) => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Expanded(child: Text(label, style: TextStyle(fontSize: 11, color: emphasized ? mainTextColor : mutedTextColor, fontWeight: emphasized ? FontWeight.w700 : FontWeight.w400))), const SizedBox(width: 8), Text(value, style: TextStyle(fontSize: 11, color: emphasized ? primaryColor : mainTextColor, fontWeight: FontWeight.w700))]);
}

class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) => Scaffold(appBar: AppBar(title: Text(title)), body: Center(child: Text('$title đang được phát triển')));
}

class TripSearchDelegate extends SearchDelegate<Trip?> {
  @override
  List<Widget>? buildActions(BuildContext context) => [IconButton(onPressed: () => query = '', icon: const Icon(Icons.clear_rounded))];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(onPressed: () => close(context, null), icon: const Icon(Icons.arrow_back_rounded));

  @override
  Widget buildResults(BuildContext context) => _results();

  @override
  Widget buildSuggestions(BuildContext context) => _results();

  Widget _results() {
    final results = mockTrips.where((trip) => trip.destination.toLowerCase().contains(query.toLowerCase()) || trip.province.toLowerCase().contains(query.toLowerCase())).toList();
    if (results.isEmpty) return const Center(child: Text('Không tìm thấy điểm đến phù hợp.'));
    return ListView.separated(itemCount: results.length, padding: const EdgeInsets.all(16), separatorBuilder: (_, __) => const SizedBox(height: 8), itemBuilder: (context, index) { final trip = results[index]; return ListTile(tileColor: Colors.white, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), leading: CircleAvatar(backgroundColor: const Color(0xFFE5EEFF), child: Icon(Icons.location_on_rounded, color: primaryColor)), title: Text(trip.destination, style: const TextStyle(fontWeight: FontWeight.w700)), subtitle: Text('${trip.duration} · Từ ${formatMoney(trip.pricePerPerson)}'), onTap: () { close(context, trip); Navigator.pushNamed(context, '/trip-builder'); }); });
  }
}
