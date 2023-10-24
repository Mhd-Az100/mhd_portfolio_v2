import 'package:flutter/material.dart';
import 'package:mhd_portfolio_v2/sections/my_projects/model/my_projects_model.dart';

class MyProjectsList {
  static List<MyProjectsModel> myProjects = [
    MyProjectsModel(
      workingPlace: "Syria",
      title: "Number One",
      workingType: "Build the project with the team",
      imagePath: "assets/projects/numberone.png",
      technology: [
        "Flutter",
        "GetX",
        "MVC",
        "Maps Api",
        "Firebase Messaging",
        "Firebase Auth",
        "Real Time Socket (Pusher)",
      ],
      googlplayLink:
          "https://play.google.com/store/apps/details?id=com.warshatec.numberone_customer",
      appStoreLink:
          "https://apps.apple.com/us/app/number-one-delivery/id1672037348?platform=iphone",
      desciption: Discreptions.numberone,
      features: Features.numberone,
    ),
    MyProjectsModel(
      title: "Tasliha",
      workingPlace: "The United Arab Emirates",
      workingType: "Building the project from scratch to finish",
      desciption: Discreptions.tasliha,
      imagePath: "assets/projects/tasliha.png",
      technology: [
        "Flutter",
        "BloC",
        "Clean Architecture",
        "Maps Api",
        "Firebase Messaging",
        "Firebase Auth",
        "WebView",
      ],
      driveLink:
          "https://drive.google.com/drive/folders/1AP8LDOk-1fEis3MU4feiqIpqJTDi3llI?usp=drive_link",
    ),
    MyProjectsModel(
      workingPlace: "Armenia",
      title: "HCFB",
      workingType: "Build the project with the team",
      desciption: Discreptions.hcfp,
      imagePath: "assets/projects/hcfp.png",
      technology: [
        "Flutter",
        "GetX",
        "MVC",
        "Firebase Messaging",
        "Firebase Auth",
      ],
      googlplayLink:
          "https://play.google.com/store/apps/details?id=com.warchatec.hcfp",
    ),
    MyProjectsModel(
      title: "Hamoushi",
      workingPlace: "Iraq",
      workingType: "Building the project from scratch to finish",
      desciption: Discreptions.hamushi,
      imagePath: "assets/projects/hamushi.png",
      technology: [
        "Flutter",
        "BloC",
        "Clean Architecture",
        "Maps Api",
        "Firebase Messaging",
        "Firebase Auth",
        "Real Time Socket (Pusher)",
      ],
      driveLink:
          "https://drive.google.com/file/d/1FAoU2ikLLz3hkNgwQ-Gu9GKOpn0YxBTG/view?usp=drive_link",
    ),
    MyProjectsModel(
      workingPlace: "Syria",
      title: "Old City",
      workingType: "Build the project with the team",
      desciption: Discreptions.aleppo,
      imagePath: "assets/projects/aleppo.png",
      technology: [
        "Flutter",
        "GetX",
        "MVC",
        "Firebase Messaging",
      ],
      googlplayLink:
          "https://play.google.com/store/apps/details?id=com.warshatec.alkhan",
      appStoreLink: "https://testflight.apple.com/join/JOx1Kk50",
    ),
    MyProjectsModel(
      workingPlace: "Syria",
      title: "Cancer",
      workingType: "Building the project from scratch to finish",
      private: true,
      desciption: Discreptions.cancer,
      imagePath: "assets/projects/cancer.png",
      technology: [
        "Flutter",
        "GetX",
        "MVC",
        "SqfLite",
      ],
    ),
    MyProjectsModel(
        workingPlace: "Syria",
        title: "B-Way",
        workingType: "Build the project with the team",
        desciption: Discreptions.bway,
        imagePath: "assets/projects/bway.png",
        technology: [
          "Flutter",
          "BloC",
          "Clean Architecture",
          "Firebase Messaging",
        ],
        driveLink:
            "https://drive.google.com/file/d/1KQHOvVvyp35YjBiwqWZvUnfqeP-J7-_d/view?usp=drive_link"),
    MyProjectsModel(
      workingPlace: "Syria",
      title: "Alsamah",
      workingType: "Build the project with the team",
      desciption: Discreptions.alsamah,
      imagePath: "assets/projects/alsamah.png",
      technology: [
        "Flutter",
        "GetX",
        "MVC",
        "Maps Api",
        "Firebase Messaging",
      ],
      googlplayLink:
          "https://play.google.com/store/apps/details?id=com.ertiqasoft.alsamah",
    ),
//

//     MyProjectsModel(
//       title: "For Sale",
//       desciption:
//           """ForSale is an electronic marketplace application that facilitates the purchase of a variety of products through categorization. It offers a seamless buying experience with features that include:

// Product Categories:

// Users can explore a wide range of products categorized for easy navigation.
// Messaging:

// The app allows communication between customers and product sellers, enabling inquiries, negotiations, and clarifications.
// Search and Filters:

// Users can search for specific products and apply filters to refine their search results, making it easier to find what they need.
// Favorites:

// Products can be saved to a favorites list for quick access and future reference.
// ForSale offers a user-friendly platform for buying and selling products, connecting buyers with sellers efficiently while providing communication tools and organization options for a better shopping experience.""",
//       image: "",
//       technology: [
//         "Flutter",
//         "GetX",
//         "MVVM",
//         "Firebase Messaging",
//       ],
//
//
//     ),
  ];
}

class Features {
  static Widget numberone = const Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [],
  );
}

class Discreptions {
  static const String numberone =
      """NumberOne is a comprehensive food delivery application that comprises three separate apps for customers, drivers, and restaurants.

For Customers:

Customers can browse through a list of available restaurants and their respective menus.
They can search for specific dishes, add items to their favorites, and compile multiple items from various restaurants into a single order basket for delivery to their desired location.
Real-time tracking of order status is available, including access to order history for easy reordering.
Special offers and promotions are showcased for added value.

For Restaurants:

Restaurants can monitor incoming orders, accept or decline them, and update the order status.
They have the flexibility to manage the availability of their menu items.
Detailed financial data is accessible, providing insights into their earnings.

For Drivers:

Drivers can track and manage orders assigned to them.
They can accept or reject orders and update the order status for customer visibility.
Access to previous delivery records is provided for review.""";

//

  static const String tasliha = """This system consists of two applications:
The customer can add their vehicles and book services for their vehicles. The services can either be vehicle insurance, vehicle inspection with a detailed report, scheduled maintenance, or emergency maintenance. Customers can also browse their vehicles, transfer ownership to another customer, and view their reservations along with their statuses and details.

Additionally, the technician has a tablet application that allows them to add customers, vehicles, reservations, manage them, and search for them. They can also receive and view notifications from the company""";

//

  static const String hcfp =
      """The HCFP (Healthcare Facility Standards) app serves as a valuable resource for understanding and adhering to established medical facility standards globally. Its primary objective is to ensure the safety of individuals by preventing the spread of diseases and epidemics within healthcare facilities.

Key Features:

Medical Posts: The app provides access to a collection of medical publications and articles. Users can save posts to their favorites for future reference.

Messaging with Administration: Users have the ability to engage in direct conversations with the administration of healthcare facilities. This feature allows for communication and feedback, enhancing the quality of care.

HCFP is a crucial tool for maintaining and improving healthcare standards, fostering communication between facility management and users, and ultimately contributing to the safety and well-being of patients and healthcare workers worldwide.""";

//

  static const String hamushi =
      """is an application designed to serve truck drivers and transportation vehicles, catering to customers who need to transport their goods via these vehicles. It allows customers to book transportation services, select the type of vehicle, and specify its features.

Here's a breakdown of its features:

Booking and Vehicle Selection: Customers can reserve a transportation request, choosing the type of vehicle and its specifications. This request becomes visible to available drivers.
Tracking: Both customers and drivers can track the status of the transportation request in real-time.

Driver Search: Customers can search for available bus drivers within specific areas by subscribing to a driver search plan. They can also add preferred drivers for future service requests.

Delivery Service: Customers can request delivery services by reaching an agreement with a driver.

Order History: Both customers and drivers can access their previous transportation requests.

Financial Tracking: Drivers can monitor their financial transactions.

Multilingual Support: The application is available in three languages: Arabic, English, and Urdu.

"Hamoushi" streamlines the process of goods transportation, providing convenience for both customers and drivers while ensuring a seamless experience.""";

//

  static const String aleppo =
      """المدينة القديمة is an application that offers a captivating historical perspective on the city of Aleppo. Beyond its rich historical content, the app provides a range of valuable services to its citizens, including governmental, real estate, commercial, and volunteer-related transactions. Additionally, users can register for various events and occasions held within the city.

Key Features:

Historical Insights: The app presents the history of Aleppo in a beautifully narrated and visually engaging manner. Users can explore the city's past through historical stories, images, and interactive content.

Governmental Services: Citizens can access and complete governmental transactions conveniently through the app. This includes services such as applying for permits, licenses, or official documents.

Real Estate Services: Users can inquire about real estate-related matters, including property registration, land surveys, and property tax information.

Commercial Services: The app supports commercial activities by providing information about local businesses, permits for commercial operations, and access to market data.

Volunteer Opportunities: Users can find and engage in various volunteer initiatives and activities taking place within the city, fostering community involvement and social impact.

Event Registration: The app enables citizens to register for upcoming events, festivals, and gatherings happening within Aleppo.

المدينة القديمة acts as a bridge between Aleppo's rich historical heritage and its modern-day needs, offering a comprehensive platform that caters to the diverse requirements of its residents.""";

//

  static const String cancer =
      """This is a specialized tablet application designed for volunteers working with the National Campaign for Early Cancer Detection. It allows volunteers to add patients along with their complete information and medical histories, storing them locally within a local database. When an internet connection becomes available, all data can be uploaded to the organization's server for centralized management.
This application aids in patient management, scheduling free medical checkup appointments for them through the organization's employee dashboard.""";

//
  static const String bway =
      """B Way is a software application that facilitates the registration and connection of specialists and seekers of specific services within the app. Here's how it functions:

For Specialists (Service Providers):

Specialists can register their expertise, skills, and services such as coaching, tutoring, or consulting.
They can display their profiles, highlighting their qualifications and experience.
Specialists can interact with individuals interested in their services and collect personal information and payment details securely through the app.
For Users (Service Seekers):

Users can discover specialists in various fields.
They can view the profiles of service providers, including their qualifications and expertise.
Users can search for specific specialists and services using filters.
The app offers notifications and account settings, including profile information and a portfolio of services.
Users can activate a business mode for specialized tasks.
B Way fosters connections between service providers and seekers, making it easy for users to find the right professionals for their needs while ensuring privacy and security.""";

//
  static const String alsamah =
      """Al-Samah is a specialized app designed for the delivery of cotton clothing and intimate apparel. Here's how it operates:

Product Categories:

Users can browse through a variety of product categories, including cotton clothing and lingerie.
Upon selecting a specific category, they can view the products available within that category, along with any special offers or promotions.
Product Selection and Wholesale Orders:

Users have the flexibility to choose the products they desire and add them to their cart for delivery to their preferred location.
They can also place wholesale orders for larger quantities of products.
Favorites and Notifications:

Users can save their favorite products for quick access in the future.
Stay updated with notifications about new product offers and promotions.
Al-Samah streamlines the process of ordering and delivering cotton clothing and intimate apparel, ensuring convenience and satisfaction for customers.""";

//
}
