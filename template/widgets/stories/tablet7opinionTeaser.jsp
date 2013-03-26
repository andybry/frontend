<c:set var="template" scope="page" value="/template/handlebars/widgets/stories/tablet7opinionTeaser.tmpl" />
<c:set var="json" scope="page">
{
  "title": "Opinion",
  "entryMaps": [
        {
          "authorMaps": {
          "name" : "David McDonnell",
          "avatarUrl" : "http://i3.mirror.co.uk/incoming/article101199.ece/ALTERNATES/s98/DAVID-MCDONNELL.png"
          },
          "postMaps": {
            "title": "BRIT Awards 2013",
            "text": "One more fact for you before we go. It's a good fact, which means we can probably expect some brilliant drunk pics tomorrow morning. Obviously we'll be bringing you all of those...",
            "dateTimeInMs": 1363973484000,
            "dateStringFortimeElement": "2013-03-22T17:31+0000",
            "timeAgoString": "49 mintues"
          }
        },
        {
          "authorMaps": {
            "name" : "David McDonnell",
            "avatarUrl" : "http://i3.mirror.co.uk/incoming/article101199.ece/ALTERNATES/s98/DAVID-MCDONNELL.png"
          },
          "postMaps": {
            "title": "BRIT Awards 2013",
            "text": "One more fact for you before we go. It's a good fact, which means we can probably expect some brilliant drunk pics tomorrow morning. Obviously we'll be bringing you all of those...",
            "dateTimeInMs": 1363973484000,
            "dateStringFortimeElement": "2013-03-22T17:31+0000",
            "timeAgoString": "49 mintues"
          }
        }
      ]
}
</c:set>
<shared:handlebars template="${template}" json="${json}" />