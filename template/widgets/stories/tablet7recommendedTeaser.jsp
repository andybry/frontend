<c:set var="template" scope="page" value="/template/handlebars/widgets/stories/tablet7recommendedTeaser.tmpl" />
<c:set var="json" scope="page">
{
  "title": "Recommended for you",
  "articleMaps": [
          {
              "typeTeaser": "true",
              "articleLeft":  {
                      "url": "#",
                      "title": "Michelle Williams is back in work and smiling after 'split from Jason Segal'",
                      "showImage": true,
                      "dateTimeInMs": 1363973484000,
                      "dateStringForTimeElement": "2013-03-22T17:31+0000",
                      "timeAgoString": "49 mintues",
                      "imageMap": {
                          "id": 1715733,
                          "showPictureCaption": false,
                          "inpageStyleClass": "",
                          "alttext": "Lovers: Oscar and Reeva",
                          "title": "Michelle Williams is back in work and smiling after 'split from Jason Segal'",
                          "imageUrl": "http://i4.mirror.co.uk/incoming/article1733639.ece/ALTERNATES/s482b/Michelle+Williams.jpg"
                      },
                      "topicMap": {
                          "name": "Michelle Williams",
                          "url": "http://www.mirror.co.uk/all-about/michelle%20williams"
                      }
              },
              "articleRight":  {
                        "url": "#",
                        "title": "\"She is absolutely charming\": Mum of Pippa Middleton's new boyfriend is thrilled at romance",
                        "showImage": true,
                        "dateTimeInMs": 1363973484000,
                        "dateStringForTimeElement": "2013-03-22T17:31+0000",
                        "timeAgoString": "49 mintues",
                        "imageMap": {
                            "id": 1715733,
                            "showPictureCaption": false,
                            "inpageStyleClass": "",
                            "alttext": "Pippa Middleton",
                            "title": "Pippa Middleton",
                            "imageUrl": "http://i2.mirror.co.uk/incoming/article1715056.ece/ALTERNATES/s482b/Pippa Middleton-1715056.jpg"
                        },
                        "topicMap": {
                            "name": "Pippa Middleton",
                            "url": "http://www.mirror.co.uk/all-about/pippa%20middleton"
                        }
             }
           },       
           {
              "typePanel": "true"
           }
      
     ]
}
</c:set>
<shared:handlebars template="${template}" json="${json}" />