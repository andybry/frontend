<%-- 
  This template shows 3 variations of the same widget view.
  They correspond to small, medium and large

  In the templating application (frontend), which one to output is selected
  using a url parameter to the jsp:include. This use of the parameter should
  be transfered to widget configuration in the shared web layer.

  The widget also varies by type: match centre or 3am. We use a param for that 
  too. 

--%>
<c:set var="template" scope="page" value="/template/handlebars/widgets/promo/tablet7secondScreenPromo.tmpl" />

<%-- choose size --%>
<c:choose>
  <c:when test="${param.size == 'small'}">
    <c:set var="showImage" scope="page" value="false"/>
    <c:set var="needsVerticalAlign" scope="page" value="true"/>
    <%-- choose type --%>
    <c:choose>
      <c:when test="${param.type == '3am'}">
        <c:set var="class" scope="page" value="amlive"/>
        <c:set var="logoFile" scope="page" value="3amlive.png"/>
      </c:when>
      <c:otherwise>
        <c:set var="class" scope="page" value="matchlive"/>
        <c:set var="logoFile" scope="page" value="matchlive.png"/>
      </c:otherwise>
    </c:choose>
  </c:when>
  <c:when test="${param.size == 'medium'}">
    <c:set var="showImage" scope="page" value="false"/>
    <c:set var="needsVerticalAlign" scope="page" value="false"/>
    <%-- choose type --%>
    <c:choose>
      <c:when test="${param.type == '3am'}">
        <c:set var="class" scope="page" value="am-sml"/>
        <c:set var="logoFile" scope="page" value="3amliveblog.png"/>
      </c:when>
      <c:otherwise>
        <c:set var="class" scope="page" value="match-sml"/>
        <c:set var="logoFile" scope="page" value="matchcentre.png"/>
      </c:otherwise>
    </c:choose>
  </c:when>
  <c:otherwise>
    <c:set var="showImage" scope="page" value="true"/>
    <c:set var="needsVerticalAlign" scope="page" value="false"/>
    <%-- choose type --%>
    <c:choose>
      <c:when test="${param.type == '3am'}">
        <c:set var="class" scope="page" value="am"/>
        <c:set var="logoFile" scope="page" value="3amliveblog.png"/>
      </c:when>
      <c:otherwise>
        <c:set var="class" scope="page" value="match"/>
        <c:set var="logoFile" scope="page" value="matchcentre.png"/>
      </c:otherwise>
    </c:choose>
  </c:otherwise>
</c:choose>

<c:set var="json" scope="page">
{
  "class": "${class}",
  "logoFile": "/frontend/skins/css/images/${logoFile}",
  "verticalAlignJs": "/frontend/resources/js/lib/tm.verticalCenter.js",
  "articleMap": {
    "url": "http://www.mirror.co.uk/news/world-news/reeva-steenkamp-mum-model-shot-1715532",
    "title": "Celebrity Big Brother 2013 eviction live blog",
    "showImage": ${showImage},
    "imageMap": {
      "url": "http://i3.mirror.co.uk/incoming/article1715733.ece/ALTERNATES/s615/Reeva Steenkamp and Oscar Pistorius-1715733.jpg",
      "alttext": "alt dummy",
      "title": "dummy title",
    },
    "needsVerticalAlign": ${needsVerticalAlign}
  }
}
</c:set>

<shared:handlebars template="${template}" json="${json}" />

