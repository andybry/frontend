<c:set var="template" scope="page" value="/template/handlebars/widgets/stories/tablet7previousNextArticle.tmpl" />
<c:set var="json" scope="page">
{
  "article":
    {
      "relatedElements": {
      	"storyrel": [
      	  {
      	  	"summaryFields": {
      	  		"title": {
      	  			"mValue": "Justin Bieber's been getting naked again, this time he's walking through a Polish airport topless"
      	  		},
      	  		"topicName": "topic name",
      	  		"url": "http://www.mirror.co.uk/3am/celebrity-news/justin-bieber-walks-through-polish-1786439",
      	  		"imageAltText": "dummy alt",
  	  	        "imageTitle": "dummy title",
      	  		"imageUrl": "http://i3.mirror.co.uk/incoming/article1715733.ece/ALTERNATES/s615/Reeva Steenkamp and Oscar Pistorius-1715733.jpg"
      	  	},
      	  },
      	  {
      	  	"summaryFields": {
      	  		"title": {
      	  			"mValue": "Justin Bieber's been getting naked again, this time he's walking through a Polish airport topless"
      	  		},
      	  		"topicName": "topic name",
      	  		"url": "http://www.mirror.co.uk/3am/celebrity-news/justin-bieber-walks-through-polish-1786439",
      	  		"imageAltText": "dummy alt",
  	  	        "imageTitle": "dummy title",
      	  		"imageUrl": "http://i3.mirror.co.uk/incoming/article1715733.ece/ALTERNATES/s615/Reeva Steenkamp and Oscar Pistorius-1715733.jpg"
      	  	},
      	  }
      	]
      }      
    }
}
</c:set>
<shared:handlebars template="${template}" json="${json}" />