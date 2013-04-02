<c:set var="widgetBase" scope="page" value="/template/widgets" />
<jsp:include page="head.jsp" />

<body id="mirror"> 
<div id="mirror-page" data-role="page">

  <%-- navigation --%>
  <jsp:include page="${widgetBase}/menu/tablet7Menu.jsp" />

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

    <%-- 
      tabs come from a layout group and are configured in Content Studio
      each widget inside forms one of the tabs
    --%>
    <div class="nav-tabs">
      <ul class="tabs clearfix set-4 most-read">
        <%-- the data here comes from options on the group in Content Studio --%>
        <li class="active" data-Id="All"><a href="#">All</a></li>
        <li data-Id="News"><a href="#">News</a></li>
        <li data-Id="Sport"><a href="#">Sport</a></li>
        <li class="last" data-Id="Celebs"><a href="#" >Celebs</a></li>
      </ul>     
      <div class="tab-container">
        <div class="tab-content" id="styleIdtab0">
          <jsp:include page="${widgetBase}/popularList/tablet7mostReadPics.jsp" />
        </div>
        <div class="tab-content" id="styleIdtab0">
          <jsp:include page="${widgetBase}/popularList/tablet7mostReadPics.jsp" />
        </div>
        <div class="tab-content" id="styleIdtab0">
          <jsp:include page="${widgetBase}/popularList/tablet7mostReadPics.jsp" />
        </div>
        <div class="tab-content" id="styleIdtab0">
          <jsp:include page="${widgetBase}/popularList/tablet7mostReadPics.jsp" />
        </div>
      </div>
    </div>
   
    <script type="text/javascript">
      $LAB.script("../resources/js/lib/tm.multiTabs.js").wait(function() {
        $(".nav-tabs").tab();
      });
    </script> 

  </div><!-- /content -->
  
  <div data-role="footer">   
  </div><!-- /footer -->
  
</div><!-- /page -->

</body>

<jsp:include page="footer.jsp" />
