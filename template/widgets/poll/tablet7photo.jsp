<c:set var="template" scope="page" value="/template/handlebars/widgets/poll/tablet7photo.tmpl" />
<c:set var="json" scope="page">
{
  "pollId": "1234567890",
  "pollQuestion": "Which one looks better?",
  "optionMaps": [
     {          
       "topScore": false,
       "caption": "Amelia Lily",
       "votedPercentValue": "15",
       "imageMap": {
         "id": 1715733,
         "alttext": "Amelia Lily",
         "title": "Amelia Lily",
         "url": "http://i2.mirror.co.uk/incoming/article1132506.ece/ALTERNATES/s158/sexiest+amelia+lily.jpg"
       } 
     },
     {          
       "topScore": true,
       "caption": "Mark &amp; Spencer",
       "votedPercentValue": "65",
       "imageMap": {
         "id": 1715733,
         "alttext": "Mark &amp; Spencer",
         "title": "Mark &amp; Spencer",
         "url": "http://i1.mirror.co.uk/incoming/article1773267.ece/ALTERNATES/s158/rosie huntington whiteley for autograph marks and spencers-1773267.jpg"
       } 
     },
     {          
       "topScore": false,
       "caption": "Josephine",
       "votedPercentValue": "10",
       "imageMap": {
         "id": 1715733,
         "alttext": "Josephine",
         "title": "Josephine",
         "url": "http://i1.mirror.co.uk/incoming/article1134840.ece/ALTERNATES/s158/sexiest+Josephine+De+La+Baume.jpg"
       } 
     },
     {          
       "topScore": false,
       "caption": "George Osborne",
       "votedPercentValue": "10",
       "imageMap": {
         "id": 1715733,
         "alttext": "George Osborne",
         "title": "George Osborne",
         "url": "http://i1.mirror.co.uk/incoming/article1774529.ece/ALTERNATES/s158/Osborne witch-1774529.jpg"
       } 
     }
  ]
}
</c:set>
<shared:handlebars template="${template}" json="${json}" />
