<c:set var="widgetBase" scope="page" value="/template/widgets" />
<jsp:include page="head.jsp" />

<body id="mirror"> 
<div id="mirror-page" data-role="page">

  <div data-role="header" id="header"> 

  </div><!-- /header -->

  <!-- content -->
  <div data-role="content" class="content">  

  <%-- large teaser --%>
  <jsp:include page="${widgetBase}/stories/tablet7largeTeaser.jsp" />

  <%-- medium teaser --%>
  <jsp:include page="${widgetBase}/stories/tablet7mediumTeaser.jsp" />

  <%-- Hot Topics - MOB-20 --%>
  <jsp:include page="${widgetBase}/stories/tablet7hotTopicsList.jsp" />

  <%-- small teaser MOB-22 --%>
  <jsp:include page="${widgetBase}/stories/tablet7smallTeaser.jsp" />
  
  <%-- picture navigator - MOB-50 --%>
  <jsp:include page="${widgetBase}/stories/tablet7pictureNavigator.jsp" />

  <%-- opinion teaser - MOB-69 --%>
  <jsp:include page="${widgetBase}/stories/tablet7opinionTeaser.jsp" />
  
  <%-- recommended teaser - MOB-73 --%>
  <jsp:include page="${widgetBase}/stories/tablet7recommendedTeaser.jsp" />
  
  <%-- Most Read List --%>
  <jsp:include page="${widgetBase}/stories/tablet7mostReadList.jsp" />

  </div><!-- /content -->
  
  <div data-role="footer">   
  </div><!-- /footer -->
  
</div><!-- /page -->

</body>

<jsp:include page="footer.jsp" />
