import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LostNetworkScreen extends StatefulWidget {
  const LostNetworkScreen({super.key});

  @override
  State<LostNetworkScreen> createState() => _LostNetworkScreenState();
}

class _LostNetworkScreenState extends State<LostNetworkScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(color: Colors.blue));
  }
}
