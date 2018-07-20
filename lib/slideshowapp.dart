import 'dart:html';
import 'package:slide_app/slideshow.dart';

class SlideShowApp {
  // contains a list of slides
  int currentSlideIndex;
  SlideShow currentSlideShow;
  DivElement slideScreen;
  var rangeSlidePos;

  showSlide(int slideNumber) {
    if (currentSlideShow.slides.length == 0) return;

    slideScreen.style.visibility = 'hidden';

    slideScreen
      ..nodes.clear()
      ..nodes.add(currentSlideShow.slides[slideNumber].getSlideContents());

    rangeSlidePos.value = slideNumber.toString();
    slideScreen.style.visibility = 'visible';
  }
}
