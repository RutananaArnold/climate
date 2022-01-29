class Facts {
  final int? id;
  final String sender;
  final String time;
  final String subject;
  final String message;
  final String avatar;

  Facts({
    this.id,
    required this.sender,
    required this.time,
    required this.subject,
    required this.message,
    required this.avatar,
  });
}

List<Facts> ourFaqs = [
  Facts(
    id: 1,
    sender: 'Google Express',
    time: '15 minutes ago',
    subject: 'Package shipped!',
    message: 'Cucumber Mask Facial has shipped.\n\n'
        'Keep an eye out for a package to arrive between this Thursday and next Tuesday. If for any reason you don\'t receive your package before the end of next week, please reach out to us for details on your shipment.\n\n'
        'As always, thank you for shopping with us and we hope you love our specially formulated Cucumber Mask!',
    avatar: 'assets/images/Agriculture-Logo.jpg',
  ),
  Facts(
    id: 2,
    sender: 'Ali Connors',
    time: '4 hrs ago',
    subject: 'Brunch this weekend?',
    message:
        'I\'ll be in your neighborhood doing errands and was hoping to catch you for a coffee this Saturday. If you don\'t have anything scheduled, it would be great to see you! It feels like its been forever.\n\n'
        'If we do get a chance to get together, remind me to tell you about Kim. She stopped over at the house to say hey to the kids and told me all about her trip to Mexico.\n\n'
        'Talk to you soon,\n\n'
        'Ali',
    avatar: 'assets/images/c.png',
  ),
  Facts(
    id: 3,
    sender: 'Allison Trabucco',
    time: '5 hrs ago',
    subject: 'Bonjour from Paris',
    message: 'Here are some great shots from my trip...',
    avatar: 'assets/images/wt.png',
  ),
  Facts(
    id: 4,
    sender: 'Trevor Hansen',
    time: '9 hrs ago',
    subject: 'Brazil trip',
    message:
        'Thought we might be able to go over some details about our upcoming vacation.\n\n'
        'I\'ve been doing a bit of research and have come across a few paces in Northern Brazil that I think we should check out. '
        'One, the north has some of the most predictable wind on the planet. '
        'I\'d love to get out on the ocean and kitesurf for a couple of days if we\'re going to be anywhere near or around Taiba. '
        'I hear it\'s beautiful there and if you\'re up for it, I\'d love to go. Other than that, I haven\'t spent too much time looking into places along our road trip route. '
        'I\'m assuming we can find places to stay and things to do as we drive and find places we think look interesting. But... I know you\'re more of a planner, so if you have ideas or places in mind, lets jot some ideas down!\n\n'
        'Maybe we can jump on the phone later today if you have a second.',
    avatar: 'assets/images/c.png',
  ),
  Facts(
    id: 5,
    sender: 'Frank Hawkins',
    time: '10 hrs ago',
    subject: 'Update to Your Itinerary',
    message: '',
    avatar: 'assets/images/4.png',
  ),
  Facts(
    id: 6,
    sender: 'Google Express',
    time: '12 hrs ago',
    subject: 'Delivered',
    message: 'Your shoes should be waiting for you at home!',
    avatar: 'assets/images/c.png',
  ),
  Facts(
    id: 7,
    sender: 'Frank Hawkins',
    time: '4 hrs ago',
    subject: 'Your update on the Google Play Store is live!',
    message:
        'Your update is now live on the Play Store and available for your alpha users to start testing.\n\n'
        'Your alpha testers will be automatically notified. If you\'d rather send them a link directly, go to your Google Play Console and follow the instructions for obtaining an open alpha testing link.',
    avatar: 'assets/images/wt.png',
  ),
];
