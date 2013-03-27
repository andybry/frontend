<c:set var="template" scope="page" value="/template/handlebars/widgets/stories/tablet7secondScreenPromo.tmpl" />
<c:set var="json" scope="page">
{
  "promo": {
  	"promoClass": "am-sml",
  	"logoImageName": "3amliveblog.png",
  	"caption": "Celebrity Big Brother 2013 eviction live blog",
  	"url": "#",
  	"hasImage": false,
  	"imageUrl": "",
  	"imageAltText": "",
  	"imageTitle": "",
  	"imageCaption": "",
  	"isPromoSmall": false
  }
}
</c:set>
<shared:handlebars template="${template}" json="${json}" />