<c:set var="widgetBase" scope="page" value="/template/widgets" />
<jsp:include page="head.jsp" />

<body id="mirror"> 
<div id="mirror-page" data-role="page">

  <div data-role="header" id="header"> 

  </div><!-- /header -->

  <!-- content -->
  <div data-role="content" class="content">  

    <jsp:include page="${widgetBase}/storyContent/tablet7.jsp" />

    <%-- 
      this div either needs to go in the template or the configuration in 
      Content Studio
    --%>
    <div class="article">
      <%-- 
        Comes from outputting a body field using the story content widget.
        The individual widgets are all embedded widgets (configured using
        the embedded config sections (under config.article.type.embed)
      --%>
      <div class="article-body">
        <jsp:include page="${widgetBase}/poll/tablet7photo.jsp" />
        <jsp:include page="${widgetBase}/video/tablet7brightcovePlayer.jsp" />
        <jsp:include page="${widgetBase}/video/tablet7youtube.jsp" />
      </div>
    </div>

  </div><!-- /content -->
  
  <div data-role="footer">   
  </div><!-- /footer -->
  
</div><!-- /page -->

</body>

<jsp:include page="footer.jsp" />
