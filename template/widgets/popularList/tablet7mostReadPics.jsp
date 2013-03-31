<c:set var="template" scope="page" value="/template/handlebars/widgets/popularList/tablet7mostReadPics.tmpl" />
<c:set var="json" scope="page">
{
  "styleId": "All",
  "articleMaps": [
    {
      "rank": 1,
      "intro": "Lead Text",
      "url": "http://www.mirror.co.uk/news/uk-news/clive-mantle-ear-bitten-off-1784616",
      "title": "Title",
      "imageMap": {
        "alttext": "dummy alt",
        "title": "dummy title",
        "url": "http://i2.mirror.co.uk/incoming/article1784601.ece/ALTERNATES/s228/Clive Mantle-1784601.jpg"
      },
      "topicMap": {
        "name": "Clive Mantle"
      }
    },
    {
      "rank": 2,
      "intro": "Lead Text",
      "url": "http://www.mirror.co.uk/news/uk-news/clive-mantle-ear-bitten-off-1784616",
      "title": "Title",
      "imageMap": {
        "alttext": "dummy alt",
        "title": "dummy title",
        "url": "http://i2.mirror.co.uk/incoming/article1784601.ece/ALTERNATES/s228/Clive Mantle-1784601.jpg"
      },
      "topicMap": {
        "name": "Clive Mantle"
      }
    },
    {
      "rank": 3,
      "intro": "Lead Text",
      "url": "http://www.mirror.co.uk/news/uk-news/clive-mantle-ear-bitten-off-1784616",
      "title": "Title",
      "imageMap": {
        "alttext": "dummy alt",
        "title": "dummy title",
        "url": "http://i2.mirror.co.uk/incoming/article1784601.ece/ALTERNATES/s228/Clive Mantle-1784601.jpg"
      },
      "topicMap": {
        "name": "Clive Mantle"
      }
    }
  ]
}
</c:set>
<shared:handlebars template="${template}" json="${json}" />
