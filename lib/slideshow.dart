import 'dart:html';

import 'package:slide_app/lifecyclemixin.dart';

class Slide extends Object with LifecycleTracker {
  String titleText = "";
  List<String> bulletPoints;
  String imgUrl = "";

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
}
