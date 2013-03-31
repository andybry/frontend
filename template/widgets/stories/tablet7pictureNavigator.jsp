<c:set var="template" scope="page" value="/template/handlebars/widgets/stories/tablet7pictureNavigator.tmpl" />
<c:set var="json" scope="page">
{
  "title": "Features",
  "swipeJsUrl": "/frontend/resources/js/lib/swipejs.js",
  "widgetId": 1234,
  "articleMaps": [
    {
      "url": "http://www.mirror.co.uk/tv/tv-reviews/doctor-who-review-jenna-louise-coleman-1792420",
      "title": "Doctor Who review: Jenna-Louise Coleman is great",
      "imageMap": {
        "url": "http://i1.mirror.co.uk/incoming/article1789811.ece/ALTERNATES/s482b/Slider-Dr-Who.jpg",
        "alttext": ""
      }
    },
    {
      "url": "http://www.mirror.co.uk/3am/celebrity-news/voice-2013-live-join-watch-1791989",
      "title": "The Voice 2013 live: Join us as we watch the auditions",
      "imageMap": {
        "url": "http://i2.mirror.co.uk/incoming/article1792152.ece/ALTERNATES/s482b/the-voice-Main-1792152.jpg",
        "alttext": ""
      }
    },
    {
      "url": "http://www.mirror.co.uk/news/world-news/kim-jong-un-looking-things---1793115",
      "title": "Kim Jong-un looking at things - just like his dad",
      "imageMap": {
        "url": "http://i1.mirror.co.uk/incoming/article1792948.ece/ALTERNATES/s482b/CS37805152-EDITORS-NOTE--1792948.jpg",
        "alttext": ""
      }
    }
  ]
}
</c:set>
<!-- start of widget id: 1234, name: stories, view: tablet7pictureNavigator -->
<shared:handlebars template="${template}" json="${json}" />
<!-- end of widget id: 1234, name: stories, view: tablet7pictureNavigator -->
