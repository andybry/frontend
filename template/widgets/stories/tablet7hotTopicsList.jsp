<c:set var="template" scope="page" value="/template/handlebars/widgets/stories/tablet7hotTopicsList.tmpl" />
<c:set var="json" scope="page">
{
  "title": "Hot Topics",
  "topicMaps": [
        {
          "caption": "Kate Middleton Pregnant",
          "url": "index.html"
        },
        {
          "caption": "Rafa Benites",
          "url": "index.html"
        },
        {
          "caption": "X Factor",
          "url": "index.html"
        },
        {
          "caption": "One Direction",
          "url": "index.html"
        },
        {
          "caption": "NANI",
          "url": "index.html"
        },
        {
          "caption": "England Rugby Union Team",
          "url": "index.html"
        },
        {
          "caption": "Harry Redknapp",
          "url": "index.html"
        }
      ]
}
</c:set>
<shared:handlebars template="${template}" json="${json}" />