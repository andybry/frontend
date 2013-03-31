<c:set var="template" scope="page" value="/template/handlebars/widgets/search/tablet7searchResult.tmpl" />
<c:set var="json" scope="page">
{
  "searchCriteria": "Bon Jovi",
  "sortCriteria": [
    {
      "name": "NEWEST",
      "url": "#newest",
      "isSelected": true
    },
    {
      "name": "MOST RELEVANT",
      "url": "#mostRelevant",
      "isSelected": false
    },
    {
      "name": "OLDEST",
      "url": "#oldest",
      "isSelected": false
    }
  ],
  "newestUrl": "#newest",
  "mostRelevantUrl": "#mostRelevant",
  "oldestUrl": "#oldest",
  "articleMaps": [
    {          
      "url": "http://www.mirror.co.uk/lifestyle/going-out/music/free-bon-jovi-track-what-1704523",
      "title": "Join Bon Jovi: Rocker wants Tory PM and Labour's Ed Miliband at UK gigs",
      "intro": "The singer is keen to talk to the duo about raising awareness of his homelessness charity the Jon Bon Jovi Soul Foundation.",
      "dateTimeInMs": 1363973484000,
      "dateStringForTimeElement": "2013-03-22T17:31+0000",
      "dateString": "9 January 2013",
      "topicMap": {
        "name": "Bon Jovi",
        "url": "http://www.mirror.co.uk/all-about/bon%20jovi"
      }
    },
    {          
      "url": "http://www.mirror.co.uk/lifestyle/going-out/music/free-bon-jovi-track-what-1704523",
      "title": "Join Bon Jovi: Rocker wants Tory PM and Labour's Ed Miliband at UK gigs",
      "intro": "The singer is keen to talk to the duo about raising awareness of his homelessness charity the Jon Bon Jovi Soul Foundation.",
      "dateTimeInMs": 1363973484000,
      "dateStringForTimeElement": "2013-03-22T17:31+0000",
      "dateString": "9 January 2013",
      "topicMap": {
        "name": "Bon Jovi",
        "url": "http://www.mirror.co.uk/all-about/bon%20jovi"
      }
    },
    {          
      "url": "http://www.mirror.co.uk/lifestyle/going-out/music/free-bon-jovi-track-what-1704523",
      "title": "Join Bon Jovi: Rocker wants Tory PM and Labour's Ed Miliband at UK gigs",
      "intro": "The singer is keen to talk to the duo about raising awareness of his homelessness charity the Jon Bon Jovi Soul Foundation.",
      "dateTimeInMs": 1363973484000,
      "dateStringForTimeElement": "2013-03-22T17:31+0000",
      "dateString": "9 January 2013",
      "topicMap": {
        "name": "Bon Jovi",
        "url": "http://www.mirror.co.uk/all-about/bon%20jovi"
      }
    }
  ]
}
</c:set>
<shared:handlebars template="${template}" json="${json}" />

<%-- 
  TODO: paginate using limitless scrolling (do first page for now allow pagination data to be generated via JSON API (for back end)) 
--%>
