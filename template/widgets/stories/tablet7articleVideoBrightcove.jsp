<c:set var="template" scope="page" value="/template/handlebars/widgets/stories/tablet7articleVideo.tmpl" />
<c:set var="json" scope="page">
{
  "subType": "dummy_sub_type",
  "videoClass": "am",
  "videoLogo": "justsayin-logo.png",
  "article":
    {
      "fields": {
        "dateMonthYear": "January 2013",
        "dateDayWeek": "Tues 04",
        "isYoutube": false,
        "code": "XmTV62mE1PA",
        "isBrightcove": true,
        "playerid": "1617943261001",
        "publisherid": "4221396001",
        "videoid": "2219503961001",
        "title": "Helen Flanagan show off the best bottom in the land.  Harry Styles doesn't like getting naked (on camera), the lates luaghs from CBB and more!",
        "body": "Helen Flanagan show off the best bottom in the land.  Harry Styles doesn't like getting naked (on camera), the lates luaghs from CBB and more!"
      }
    }
}
</c:set>
<!-- videoClass options am, spy and standard.-->
<!-- videoLogo options justsayin-logo.png, spy-logo.png-->
<shared:handlebars template="${template}" json="${json}" />