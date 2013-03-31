<c:set var="widgetBase" scope="page" value="/template/widgets" />
<jsp:include page="head.jsp" />

<body id="mirror"> 
<div id="mirror-page" data-role="page">

  <div data-role="header" id="header"> 

  </div><!-- /header -->

  <!-- content -->
  <div data-role="content" class="content">  
  
    <jsp:include page="${widgetBase}/stories/tablet7largeTeaser.jsp" />
  
    <jsp:include page="${widgetBase}/stories/tablet7mediumTeaser.jsp" />
  
    <jsp:include page="${widgetBase}/topic/tablet7.jsp" />
  
    <jsp:include page="${widgetBase}/stories/tablet7smallTeaser.jsp" />
    
    <jsp:include page="${widgetBase}/stories/tablet7pictureNavigator.jsp" />
  
    <jsp:include page="${widgetBase}/opinionCarousel/tablet7.jsp" />
    
    <jsp:include page="${widgetBase}/stories/tablet7rankedList.jsp" />
    
    <jsp:include page="${widgetBase}/popularList/tablet7mostRead.jsp" />

    <jsp:include page="${widgetBase}/stories/tablet7videoNavigator.jsp" />
  
  </div><!-- /content -->
  
  <div data-role="footer">   
  </div><!-- /footer -->
  
</div><!-- /page -->

</body>

<jsp:include page="footer.jsp" />
