<c:set var="template" scope="page" value="/template/handlebars/widgets/stories/tablet7smallTeaser.tmpl" />
<c:set var="json" scope="page">
{
  "articleMaps": [  
        {
          "url": "http://www.mirror.co.uk/news/uk-news/reading-crocodile-cyclist-claims-saw-1720391",
          "title": "Is there a crocodile in the River Thames? Cyclist claims he saw 4ft long predator swimming in water",
          "intro": "The 64-year-old says he got the shock of his life when he saw the large reptile swimming along the waterway at Reading",
          "showImage": true,
          "dateTimeInMs": 1363973484000,
          "dateStringFortimeElement": "2013-03-22T17:31+0000",
          "timeAgoString": "49 mintues",
          "imageMap": {
            "id": 1715733,
            "showPictureCaption": false,
            "inpageStyleClass": "",
            "imageUrl": "http://i3.mirror.co.uk/incoming/article1715733.ece/ALTERNATES/s615/Reeva%20Steenkamp%20and%20Oscar%20Pistorius-1715733.jpg",
            "alttext": "Scary: It's claimed the 4ft long crocodile was spotted in the River Thames in Reading",
            "title": "Lovers: Oscar and Reeva"
          },
          "topicMap": {
            "name": "Crocodiles",
            "url": "http://www.mirror.co.uk/all-about/crocodiles"
          },
          "relatedItemMaps": [
            {
              "title": "Model may have had skull crushed on night she was shot dead by Oscar Pistorius",
              "url": "http://www.mirror.co.uk/news/world-news/reeva-steenkamp-model-skull-crushed-1715537"
            },
            {
              "title": "\"It was a mistake anybody can make\": Sprint star's gran says shooting was an accident",
              "url": "http://www.mirror.co.uk/news/world-news/oscar-pistorius-sprint-stars-gran-1715080"
            }
          ]
        }
  ]
}
</c:set>
<shared:handlebars template="${template}" json="${json}" />
