import 'package:flutter/material.dart';

void main() {
  runApp(const SpiderManTicketApp());
}

class SpiderManTicketApp extends StatelessWidget {
  const SpiderManTicketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Spider-Man Ticket',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        scaffoldBackgroundColor: const Color(0xFF1A1A2E), // Dark background
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const TicketScreen(),
      },
    );
  }
}

class TicketScreen extends StatelessWidget {
  const TicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Ticket', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: const Color(0xFFE23636), // Spider-Man Red
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                constraints: const BoxConstraints(maxWidth: 400),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 15,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Movie Header Image/Color Area
                    Container(
                      height: 120,
                      decoration: const BoxDecoration(
                        color: Color(0xFF0F3460), // Spider-Man Blue
                        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        'SPIDER-MAN',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Ticket Details
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'PVR: Director\\'s Cut, Vasant Kunj',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'New Delhi, Delhi',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _TicketInfo(title: 'DATE', value: '15 AUG'),
                              _TicketInfo(title: 'TIME', value: '07:30 PM'),
                            ],
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _TicketInfo(title: 'SCREEN', value: 'AUDI 3'),
                              _TicketInfo(title: 'SEATS', value: 'G14, G15'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Dashed Line Divider
                    Row(
                      children: List.generate(
                        30,
                        (index) => Expanded(
                          child: Container(
                            height: 2,
                            color: index % 2 == 0 ? Colors.transparent : Colors.grey.shade400,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Barcode placeholder
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              40,
                              (index) => Container(
                                width: (index % 3 == 0) ? 4 : ((index % 5 == 0) ? 1 : 2),
                                height: 50,
                                margin: const EdgeInsets.symmetric(horizontal: 1),
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'TICKET ID: SPDR-DEL-98234',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TicketInfo extends StatelessWidget {
  final String title;
  final String value;

  const _TicketInfo({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
