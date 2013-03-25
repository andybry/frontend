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

  <%-- small teaser --%>
  <jsp:include page="${widgetBase}/stories/tablet7smallTeaser.jsp" />
  
    <%-- picture navigator --%>
  <jsp:include page="${widgetBase}/stories/tablet7pictureNavigator.jsp" />

  </div><!-- /content -->
  
  <div data-role="footer">   
  </div><!-- /footer -->
  
</div><!-- /page -->

</body>

<jsp:include page="footer.jsp" />
