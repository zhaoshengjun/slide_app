import 'dart:html';

import 'package:slide_app/lifecyclemixin.dart';

class Slide extends Object with LifecycleTracker {
  String titleText = "";
  List<String> bulletPoints;
  String imgUrl = "";

  Slide(String src);

  DivElement getSlideContents() {
    DivElement slide = new DivElement();
    DivElement title = new DivElement();
    DivElement bullets =  new DivElement();

    title.appendHtml("<h1>$titleText</h1>");
    slide.append(title);

    if(imgUrl.length > 0) {
      slide.appendHtml('<img src="$imgUrl" /><br/>');
    }

    bulletPoints.forEach((p)  {
      if (p.trim().length > 0) {
        bullets.appendHtml('<li>$p</li>')
      }
    });
    slide.append(bullets);
    return slide;
  }

}

class SlideShow extends Object with LifecycleTracker {
  List<Slide> _slides;
  List<Slide> get slides => _slides;

  
  build(String src) {
    updateEditTimestamp();
    _slides = new List<Slide>();
    Slide nextSlide;

    src.split("\n").forEach((String line) {
      if (line.trim().length > 0){
        if (line.startsWith('#')) {
          nextSlide = new Slide(line.substring(1));
          _slides.add(nextSlide);
        }

        if (nextSlide != null) {
          if (line.startsWith('+')) {
            nextSlide.bulletPoints.add(line.substring(1));
          } else if (line.startsWith('!')) {
            nextSlide.imgUrl = line.substring(1);
          }
        }
      }
    });

  }


}
