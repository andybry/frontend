<%--
  This example shows how to turn JSON data into a Java equivalent.
  This is very handy for mocking data.
--%>

<c:set var="jsonString" scope="page">
{
  showComments: "true",
  resultCount: 6,
  contentType: "news,opinion,advice,promo,externalContent",
  showIcons: "true",
  enableRummbleLabs: "false",
  articleMaps: [
    {
      publishingDate: "Mar 20, 2013 4:11:56 PM",
      showComments: false,
      curtailedTitle: "Budget 2013 live: Commentary and analysis of George Osborne&#039;s March statement",
      showImage: true,
      useRelatedItems: true,
      url: "http://www.mirror.co.uk/news/uk-news/live-budget-2013-commentary-analysis-1771851",
      intro: "Watch the Chancellor make his Spring budget statement - and find out how it will affect you",
      id: 1771851,
      title: "Budget 2013 live: Commentary and analysis of George Osborne&#039;s March statement",
      imageMap: {
        id: 1775012,
        inpageStyleClass: "",
        height: 211,
        captionDivId: "widget80859-story-picture1775012-info",
        width: 318,
        showPictureCaption: true,
        alttext: "George Osborne seen on TV screens during the Budget announcement",
        url: "http://i4.mirror.co.uk/incoming/article1775012.ece/ALTERNATES/s318/George+Osborne+seen+on+TV+screens+during+the+Budget+announcement.jpg"
      },
      flag: "live",
      imageHeavy: false,
      articleTypeName: "news",
      homeSectionName: "UK News",
      dateTimeInMs: 1363795916000,
      pluckArticleId: "mirror-1771851",
      homeSectionUrl: "http://www.mirror.co.uk/news/uk-news/",
      video: false
    }
  ],
  styleId: "",
  widgetId: 80859
}
</c:set>

${elfn:fromJson(jsonString)}
