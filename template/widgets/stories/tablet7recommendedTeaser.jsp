<c:set var="template" scope="page" value="/template/handlebars/widgets/stories/tablet7recommendedTeaser.tmpl" />
<c:set var="json" scope="page">
{
  "title": "Recommended for you",
  "articleMaps": [
                { 
                  "articleLeft": {
                      "url": "http://www.mirror.co.uk/news/world-news/reeva-steenkamp-mum-model-shot-1715532",
                      "title": "\"Why would he kill my angel?\" Distraught mum of Oscar Pistorius' girlfriend is baffled by killing.",
                      "intro": "Distraught June Steenkamp, 66, spoke out as it was revealed her daughter Reeva's skull had been crushed.",
                      "showImage": true,
                      "dateTimeInMs": 1363973484000,
                      "dateStringFortimeElement": "2013-03-22T17:31+0000",
                      "timeAgoString": "49 mintues",
                      "imageMap": {
                          "id": 1715733,
                          "showPictureCaption": false,
                          "inpageStyleClass": "",
                          "alttext": "Lovers: Oscar and Reeva",
                          "title": "Lovers: Oscar and Reeva",
                          "imageUrl": "http://i3.mirror.co.uk/incoming/article1715733.ece/ALTERNATES/s615/Reeva%20Steenkamp%20and%20Oscar%20Pistorius-1715733.jpg"
                      },
                      "topicMap": {
                          "name": "Reeva Steenkamp",
                          "url": "http://www.mirror.co.uk/all-about/reeva%20steenkamp"
                      }
                  }
                  "articleRight": {
                      "url": "http://www.mirror.co.uk/news/world-news/reeva-steenkamp-mum-model-shot-1715532",
                      "title": "\"Why would he kill my angel?\" Distraught mum of Oscar Pistorius' girlfriend is baffled by killing.",
                      "intro": "Distraught June Steenkamp, 66, spoke out as it was revealed her daughter Reeva's skull had been crushed.",
                      "showImage": true,
                      "dateTimeInMs": 1363973484000,
                      "dateStringFortimeElement": "2013-03-22T17:31+0000",
                      "timeAgoString": "49 mintues",
                      "imageMap": {
                          "id": 1715733,
                          "showPictureCaption": false,
                          "inpageStyleClass": "",
                          "alttext": "Lovers: Oscar and Reeva",
                          "title": "Lovers: Oscar and Reeva",
                          "imageUrl": "http://i3.mirror.co.uk/incoming/article1715733.ece/ALTERNATES/s615/Reeva%20Steenkamp%20and%20Oscar%20Pistorius-1715733.jpg"
                      },
                      "topicMap": {
                          "name": "Reeva Steenkamp",
                          "url": "http://www.mirror.co.uk/all-about/reeva%20steenkamp"
                      }
                    }  
                },
                {
                  "isButtonPanel": "true"
                }
                
      ]
}
</c:set>
<shared:handlebars template="${template}" json="${json}" />