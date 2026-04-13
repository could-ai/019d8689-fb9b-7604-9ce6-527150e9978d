import 'package:flutter/material.dart';

class PresentationScreen extends StatefulWidget {
  const PresentationScreen({super.key});

  @override
  State<PresentationScreen> createState() => _PresentationScreenState();
}

class _PresentationScreenState extends State<PresentationScreen> {
  int _currentSlide = 0;

  final List<Slide> _slides = [
    Slide(
      title: 'Unconscious Bias & Stereotypes',
      content: 'Understanding how our brains take shortcuts and the impact it has on the workplace.',
      isTitleSlide: true,
    ),
    Slide(
      title: 'What is Unconscious Bias?',
      content: '• Social stereotypes about certain groups of people that individuals form outside their own conscious awareness.\n• Everyone holds unconscious beliefs about various social and identity groups.\n• These biases stem from one\\'s tendency to organize social worlds by categorizing.',
    ),
    Slide(
      title: 'How Does It Work?',
      content: '• The brain receives millions of pieces of information every second.\n• To process this, it creates shortcuts based on patterns, experiences, and cultural conditioning.\n• These shortcuts can lead to snap judgments that are often inaccurate and biased.',
    ),
    Slide(
      title: 'Common Types of Bias',
      content: '• Affinity Bias: Preferring people who are similar to us.\n• Confirmation Bias: Seeking information that confirms pre-existing beliefs.\n• Halo/Horns Effect: Letting one positive or negative trait overshadow all others.\n• Gender Bias: Preferring one gender over another or assuming roles based on gender.',
    ),
    Slide(
      title: 'What are Stereotypes?',
      content: '• A widely held but fixed and oversimplified image or idea of a particular type of person or thing.\n• Stereotypes can be positive or negative, but both are harmful because they ignore individual differences.\n• They often form the basis of unconscious bias.',
    ),
    Slide(
      title: 'Impact in the Workplace',
      content: '• Recruitment and Hiring: Overlooking qualified candidates.\n• Performance Reviews: Evaluating people differently based on bias rather than merit.\n• Team Dynamics: Excluding certain voices or ideas.\n• Employee Retention: Creating an environment where people feel undervalued or misunderstood.',
    ),
    Slide(
      title: 'Overcoming Unconscious Bias',
      content: '1. Awareness: Acknowledge that everyone has biases.\n2. Education: Learn about different types of biases and how they manifest.\n3. Slow Down: Avoid making snap decisions; take time to evaluate objectively.\n4. Expand Your Network: Interact with people from diverse backgrounds.\n5. Speak Up: Gently point out biases when you observe them in decision-making.',
    ),
    Slide(
      title: 'Conclusion',
      content: '• Unconscious bias is natural, but acting on it is preventable.\n• By recognizing our biases and actively working to counter them, we can create a more inclusive and equitable workplace for everyone.',
    ),
  ];

  void _nextSlide() {
    if (_currentSlide < _slides.length - 1) {
      setState(() {
        _currentSlide++;
      });
    }
  }

  void _previousSlide() {
    if (_currentSlide > 0) {
      setState(() {
        _currentSlide--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final slide = _slides[_currentSlide];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Presentation'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Slide ${_currentSlide + 1} of ${_slides.length}',
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: _nextSlide,
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(32.0),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 800),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: slide.isTitleSlide
                    ? CrossAxisAlignment.center
                    : CrossAxisAlignment.start,
                children: [
                  Text(
                    slide.title,
                    textAlign: slide.isTitleSlide ? TextAlign.center : TextAlign.left,
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  const SizedBox(height: 48),
                  Text(
                    slide.content,
                    textAlign: slide.isTitleSlide ? TextAlign.center : TextAlign.left,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          height: 1.5,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
              onPressed: _currentSlide > 0 ? _previousSlide : null,
              icon: const Icon(Icons.arrow_back),
              label: const Text('Previous'),
            ),
            TextButton.icon(
              onPressed: _currentSlide < _slides.length - 1 ? _nextSlide : null,
              icon: const Icon(Icons.arrow_forward),
              label: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}

class Slide {
  final String title;
  final String content;
  final bool isTitleSlide;

  Slide({
    required this.title,
    required this.content,
    this.isTitleSlide = false,
  });
}
