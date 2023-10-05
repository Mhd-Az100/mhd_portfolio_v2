import 'package:mhd_portfolio_v2/sections/my_services/model/services_mode.dart';

class MyServicesList {
  static List<ServiceModel> myServicesList = [
    ServiceModel(
      title: "UI Design Excellence",
      body:
          "Craft responsive applications with stunning user interfaces, enriched with captivating animations and meticulous attention to detail.",
      imgPath: "assets/imgs/ui.png",
    ),
    ServiceModel(
      title: "High-Performance Engineering",
      body:
          "I focus on building high-performance applications with a strong emphasis on clean architecture, code maintainability, and quality assurance to ensure long-lasting, efficient software solutions.",
      imgPath: "assets/imgs/code.png",
    ),
    ServiceModel(
      title: "Real-Time Solutions",
      body:
          "Deliver dynamic, real-time applications by harnessing the power of cutting-edge technologies such as Pusher, Firebase, and WebSockets.",
      imgPath: "assets/imgs/time.png",
    ),
    ServiceModel(
      title: "Business Strategy (Trainee)",
      body:
          "I'm currently in training to provide valuable insights in project analysis, feasibility studies, business model canvases, and SWOT analyses. My commitment to learning and growth in this area ensures I can contribute effectively to strategic decision-making.",
      imgPath: "assets/imgs/business.png",
    ),
  ];
}
