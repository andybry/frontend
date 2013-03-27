<c:set var="template" scope="page" value="/template/handlebars/widgets/stories/tablet7secondScreenPromo.tmpl" />
<c:set var="json" scope="page">
{
  "promo": {
  	"promoClass": "amlive",
  	"logoImageName": "3amlive.png",
  	"caption": "Celebrity Big Brother 2013 eviction live blog",
  	"url": "#",
  	"hasImage": false,
  	"imageUrl": "",
  	"imageAltText": "",
  	"imageTitle": "",
  	"imageCaption": "",
  	"isPromoSmall": true
  }
}
</c:set>
<shared:handlebars template="${template}" json="${json}" />