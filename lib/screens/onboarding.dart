import 'package:education/screens/login.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final _pagecontroller = PageController(initialPage: 0);
  @override
  void dispose() {
    _pagecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constrains) => Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: PageView(
            controller: _pagecontroller,
            onPageChanged: (index) {},
            children: const [Manage(), Share(), Keep()],
          )),
    );
  }
}

class Share extends StatelessWidget {
  const Share({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 70,
        ),
        Image.asset(
          'assets/images/share.png',
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 100,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: const Text(
            "SHARE",
            style:
                TextStyle(color: Color.fromARGB(255, 20, 3, 79), fontSize: 30),
          ),
        ),
        Text(
          "Easily Manage Your resources",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 15, color: Theme.of(context).colorScheme.onSurface),
        ),
        Text(
          "pdfs, study material, etc",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 15, color: Theme.of(context).colorScheme.onSurface),
        )
      ],
    );
  }
}

class Manage extends StatelessWidget {
  const Manage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 70,
        ),
        Image.asset(
          'assets/images/181.png',
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 100,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: const Text(
            "Manage",
            style:
                TextStyle(color: Color.fromARGB(255, 20, 3, 79), fontSize: 30),
          ),
        ),
        Text(
          "Easily Manage Your resources",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 15, color: Theme.of(context).colorScheme.onSurface),
        ),
        Text(
          "pdfs, study material, etc",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 15, color: Theme.of(context).colorScheme.onSurface),
        )
      ],
    );
  }
}

class Keep extends StatelessWidget {
  const Keep({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 70,
        ),
        Image.asset(
          'assets/images/179.png',
          fit: BoxFit.cover,
        ),
        const SizedBox(
          height: 100,
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: const Text(
            "KEEP",
            style:
                TextStyle(color: Color.fromARGB(255, 20, 3, 79), fontSize: 30),
          ),
        ),
        Text(
          "Keep track of your attendance",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 15, color: Theme.of(context).colorScheme.onSurface),
        ),
        Text(
          "Datewise and subjectwise",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 15, color: Theme.of(context).colorScheme.onSurface),
        ),
        const SizedBox(
          height: 45,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ));
            },
            style: ElevatedButton.styleFrom(
                shape: const StadiumBorder(),
                backgroundColor: const Color.fromARGB(255, 57, 87, 112)),
            child: const Text(
              'Let\'s start',
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
