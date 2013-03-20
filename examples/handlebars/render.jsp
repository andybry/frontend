<%--
  shows an example of how to render a Handlebars template on the server side
--%>

<%-- set the template to render (typically should be done in a widget controller) --%>
<c:set var="template" value="/examples/handlebars/render.tmpl"/>

<%-- set up the json data for the template (typically should be done in a widget controller) --%>
<c:set var="json" scope="page">
{
  "url": "http://www.mirror.co.uk/news/uk-news/budget-2013-glance-10-things-1774833",
  "title": "Budget at a glance: 10 things we learned from George Osborne's speech",
  "imageUrl": "http://i3.mirror.co.uk/incoming/article1774734.ece/ALTERNATES/s318/George%20Osborne%20delivers%20his%20budget%20in%20the%20House%20of%20Commons-1774734.jpg",
  "imageAltText": "And the plan is... George Osborne delivers his Budget",
  "topicUrl": "http://www.mirror.co.uk/all-about/the%20budget",
  "topicName": "The Budget",
  "intro": "Amongst the political jargon and the boos and cheers inside the House of Commons, what does any of it really mean to us?",
   "hasRelatedStories": true,
   "relatedStories": [
     {
       "url": "http://www.mirror.co.uk/news/uk-news/budget-day-2013-happened-george-1774237",
       "title": "Budget day 2013 as it happened: George Osborne's March statement",
       "isLast": false
     }, 
     {
       "url": "http://www.mirror.co.uk/news/uk-news/budget-2013-ed-miliband-tells-1774859",
       "title": "Budget 2013: Ed Miliband tells George Osborne he is \"a downgraded Chancellor\"",
       "isLast": true
     }
   ]
}
</c:set>

<shared:handlebars template="${template}" json="${json}" />
