<c:set var="template" scope="page" value="/template/handlebars/widgets/menu/tablet7Menu.tmpl" />
<c:set var="json" scope="page">
{
  "formAction": "http://www.mirror.co.uk/search/simple.do",
  "formMethod": "GET",
  "formHiddenParameters": [
    {
      "key": "destinationSectionId",
      "value": 12341
    },
    {
      "key": "publicationName",
      "value": "mirror"
    },
    {
      "key": "sortString",
      "value": "publishdate"
    },
    {
      "key": "sortOrder",
      "value": "desc"
    },
    {
      "key": "sectionId",
      "value": "14321"
    },
    {
      "key": "articleTypes",
      "value": "news opinion advice"
    },
    {
      "key": "pageNumber",
      "value": 1
    },
    {
      "key": "pageLength",
      "value": 10
    },
    {
      "key": "multiSiteSections",
      "value": ""
    },
    {
      "key": "service",
      "value": "mobile"
    },
  ],
  "items": [
    {
      "url": "http://www.mirror.co.uk/",
      "class": "nav-top",
      "text": "Front page"
    },
    {
      "url": "http://www.mirror.co.uk/recommended/",
      "class": "nav-second",
      "text": "Recommended for you"
    },
    {
      "url": "http://www.mirror.co.uk/most-read/",
      "class": "nav-second",
      "text": "Most read"
    },
    {
      "url": "http://www.mirror.co.uk/in-pictures/",
      "class": "nav-second",
      "text": "In pictures"
    },
    {
      "url": "http://www.mirror.co.uk/news/",
      "class": "",
      "text": "News"
    },
    {
      "url": "http://www.mirror.co.uk/sport/football/",
      "class": "",
      "text": "Football"
    },
    {
      "url": "http://www.mirror.co.uk/3am/",
      "class": "",
      "text": "3AM"
    },
    {
      "url": "http://www.mirror.co.uk/sport/",
      "class": "",
      "text": "Sport"
    },
    {
      "url": "http://www.mirror.co.uk/tv/",
      "class": "",
      "text": "TV"
    },
    {
      "url": "http://www.mirror.co.uk/lifestyle/",
      "class": "",
      "text": "Lifestyle"
    },
    {
      "url": "http://www.mirror.co.uk/money/",
      "class": "",
      "text": "Money"
    }
  ]  
}
</c:set>
<!-- start of widget id: 142, name: menu, view: tablet7Menu -->
<shared:handlebars template="${template}" json="${json}" />
<!-- end of widget id: 142, name: menu, view: tablet7Menu -->
