<c:set var="widgetBase" scope="page" value="/template/widgets" />
<jsp:include page="head.jsp" />

<body id="mirror"> 
<div id="mirror-page" data-role="page">

  <div data-role="header" id="header"> 

  </div><!-- /header -->

  <!-- content -->
  <div data-role="content" class="content no-border">  

  <%-- search results - MOB-97 --%>
  <jsp:include page="${widgetBase}/stories/tablet7searchResultsList.jsp" />
  

  </div><!-- /content -->
  
  <div data-role="footer">   
  </div><!-- /footer -->
  
</div><!-- /page -->
<jsp:include page="footer.jsp" />
</body>


