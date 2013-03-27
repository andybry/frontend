<c:set var="template" scope="page" value="/template/handlebars/widgets/stories/tablet7secondScreenPromo.tmpl" />
<c:set var="json" scope="page">
{
  "promo": {
  	"promoClass": "am",
  	"logoImageName": "3amliveblog.png",
  	"caption": "Celebrity Big Brother 2013 eviction live blog",
  	"url": "#",
  	"hasImage": true,
  	"imageUrl": "http://i3.mirror.co.uk/incoming/article1715733.ece/ALTERNATES/s615/Reeva Steenkamp and Oscar Pistorius-1715733.jpg",
  	"imageAltText": "alt dummy",
  	"imageTitle": "dummy title",
  	"imageCaption": "#3amLIVE",
  	"isPromoSmall": false
  }
}
</c:set>
<shared:handlebars template="${template}" json="${json}" />