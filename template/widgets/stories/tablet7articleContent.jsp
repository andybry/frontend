<c:set var="template" scope="page" value="/template/handlebars/widgets/stories/tablet7articleContent.tmpl" />
<c:set var="json" scope="page">
{
  "article":
    {
      "publishedDateStr": "Mar 26, 2013 3:03 PM",
      "authorMaps": [
        {
        	"name": "Joe Bloggs"
        }
      ],
      "fields": {
        "dateMonthYear": "January 2013",
        "dateDayWeek": "Tues 04",
        "title": "Helen Flanagan show off the best bottom in the land.  Harry Styles doesn't like getting naked (on camera), the lates luaghs from CBB and more!",
        "leadtext": "'Why would he kill my angel?' Distraught mum of Oscar Pistorius' girlfriend is baffled by killing.",
        "body": "<p>Daniel Sturridge is demanding a staggering &pound;80,000 a week to move to <a href='#'>Liverpool</a> in January.</p><p>The Reds have already asked <a href='#'>Chelsea</a> about their reserve striker's availability, and look set to follow up their interest, which dates back to the summer, in the winter transfer window.</p><p>There is a feeling at Anfield, however, that Sturridge has done little in the last 12 months to justify such big wages since his fine start to last season.</p><p>Back then, he scored 10 goals playing wide in an attacking three under Andre Villas-Boas.</p><p>But since last December, he has scored just five times for the European Champions.</p><p>The 23-year-old's camp also insist he MUST play through the middle if he were to move to Liverpool next month.</p><p>Liverpool are keen not to repeat the financial mistakes of past windows after big signings Andy Carroll, Jordan Henderson and Stewart Downing struggled to make any sort of impact.</p>"
      },
      "relatedElements": {
      	"picturerel": [
      	  {
      	  	"summaryFields": {
      	  		"caption": {
      	  			"mValue": "We think Justin had raided Stooshe's wardrobe"
      	  		}
      	  	},
      	  	"article": {
      	  		"fields": {
      	  			"alternates": {
      	  				"s615": {
      	  					"mRelativeURI": "http://i3.mirror.co.uk/incoming/article1715733.ece/ALTERNATES/s615/Reeva Steenkamp and Oscar Pistorius-1715733.jpg"
      	  				}
      	  			}
      	  		}
      	  	}
      	  }
      	]
      }      
    }
}
</c:set>
<shared:handlebars template="${template}" json="${json}" />