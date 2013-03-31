<c:set var="widgetBase" scope="page" value="/template/widgets" />
<jsp:include page="head.jsp" />

<body id="mirror"> 
<div id="mirror-page" data-role="page">

  <div data-role="header" id="header"> 

  </div><!-- /header -->

  <!-- content -->
  <div data-role="content" class="content">  
    <%-- TODO: storyContent, tablet7profileContent needs a back end --%>
    <jsp:include page="${widgetBase}/storyContent/tablet7profileContent.jsp" />

    <jsp:include page="${widgetBase}/stories/tablet7paginatedList.jsp" />

  </div><!-- /content -->
  
  <div data-role="footer">   
  </div><!-- /footer -->
  
</div><!-- /page -->
<jsp:include page="footer.jsp" />
</body>


