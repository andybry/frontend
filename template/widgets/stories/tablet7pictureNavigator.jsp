<c:set var="template" scope="page" value="/template/handlebars/widgets/stories/tablet7pictureNavigator.tmpl" />
<c:set var="json" scope="page">
{
  "title": "Features",
  "pictureMaps": [
        {
          "caption": "Hurricane Sandy: The big Clean Up Begins",
          "url": "#",
          "imageUrl": "http://i4.mirror.co.uk/incoming/article1733639.ece/ALTERNATES/s482b/Michelle+Williams.jpg",
          "alttext": "dummy alt text",
          "title": "dummy title text"
        },
        {
          "caption": "Another caption",
          "url": "#",
          "imageUrl": "http://i2.mirror.co.uk/incoming/article1715056.ece/ALTERNATES/s482b/Pippa Middleton-1715056.jpg",
          "alttext": "dummy alt text",
          "title": "dummy title text"
        },
        {
          "caption": "Third caption",
          "url": "#",
          "imageUrl": "http://i3.mirror.co.uk/incoming/article1715733.ece/ALTERNATES/s615/Reeva Steenkamp and Oscar Pistorius-1715733.jpg",
          "alttext": "dummy alt text",
          "title": "dummy title text"
        }
      ]
}
</c:set>
<shared:handlebars template="${template}" json="${json}" />
