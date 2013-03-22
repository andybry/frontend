<%--
 * $Header: https://trinitymirror.jira.com/svn/SWL/trunk/src/main/webapp/template/widgets/stories/view/inPictures.jsp 9361 2013-03-12 16:04:46Z robyn.backhouse $
 * $Author: robyn.backhouse $
 * $Revision: 9361 $
 * This is the view for the In Pictures view of stories widget
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:useBean id="stories" class="java.util.HashMap" scope="request"/>
<script type="text/javascript">
  // this defines the object that will hold all of the URLs to preload the galleries
  var preloadUrls = new Object();
</script>
<c:if test="${stories.showWidgetTitle}">
  <jsp:include page="helpers/widgetTitle.jsp"/>
</c:if>

<c:if test="${not empty stories.articles and fn:length(stories.articles) > 0}">
  <c:set var="resultCount" value="${stories.resultCount + 0 }"/>
  <div class="article">

  <%-- display search result items for this page --%>
  <c:forEach var="gallery" items="${stories.galleriesList}" varStatus="status">
    <article:use articleId="${gallery.listItemId}">
      <c:if test="${not empty gallery.imageVersion and not empty gallery.teaserImageMap and not empty gallery.teaserImageMap.imageArticleId}">
        <c:if test="${(status.count % 11) == 1}" >
          <div class="gallery-set"><%-- wrap each set in a div for "More" button --%>
        </c:if>
        <div class="${gallery.spanClass}">
        <c:if test="${not empty gallery.firstImageSpanClass}">
          <div class="${gallery.firstImageSpanClass}">
        </c:if>
          <figure class="clearfix lightboxClickArea" id="gallery-${gallery.listItemId}" data-lightboxId="lightbox-${gallery.listItemId}">
            <img src="${gallery.teaserImageMap.url}"
                 width="${gallery.imageWidth}"
                 height="${gallery.imageHeight}"
                 alt="<c:out value='${gallery.teaserImageMap.alttext}' escapeXml='true'/>"
                 title="<c:out value='${gallery.leadtext}' escapeXml='true'/>"/>
            <figcaption>${gallery.leadtext}</figcaption>
            <div class="primary-tag">
              <div class="arrow_box">${gallery.primaryTag}</div>
            </div>
          </figure>
          <c:if test="${not empty gallery.firstImageSpanClass}"></div></c:if>
          </div>
          <script type="text/javascript">
            // store the ajax URL so I can refer back to it at the end
          preloadUrls['gallery-${gallery.listItemId}'] = '${gallery.articleUrl}?service=ajax';
          </script>
        <c:if test="${(status.count % 11) == 0}" >
          </div><%-- End of set --%>
        </c:if>
      </c:if>
      <c:remove var="teaserImageMap" scope="request"/>
    </article:use>
  </c:forEach>
  </div>
  <div class="load-more">
    <span class="load-more-bg"></span>
    <a href="#" class="ir load-more-btn">Load more</a>
  </div>
<script type="text/javascript">//<![CDATA[
$LAB.wait(function(){
    $("head").append('<link rel="stylesheet" type="text/css" href="${skinUrl}css/gallery.css?v=1" media="all" />');
    if(Modernizr.touch) {
      $LAB.script("${requestScope.resourceUrl}js/libs/custom_jquery.hammer.min.js");
    }
  }).script("${requestScope.resourceUrl}js/lib/tm.gallery.js?v=1").wait(function() {
    $('.lightboxClickArea').each(function(){
      var currentId = $(this).attr("id");
      // pre-load image gallery
      $("#"+ currentId ).gallery("bootstrap", { "ajaxSrc" : preloadUrls[currentId]});
    });
  });

  // Handler for Load More Button
  var gallery_set = $('.gallery-set');
  gallery_set.first().css('display', 'block');
   $('.load-more').click(function (){
     for (var i= 0; i < gallery_set.length ; i++){
      var currentSet = gallery_set.get(i);
        if ($(currentSet).css('display') == 'none') { 
          $(currentSet).css('display', 'block');
          if (i == gallery_set.length - 1){
            $(this).hide();
          }
          return false;
        }
     }
    });
   // Handler for Primary Tag Hover Event
   $('.primary-tag').bind({
     mouseenter: function() {
       $(this).prev().css("display", "block")
     },
     mouseleave: function() {
       $(this).prev().css("display", "none")
     }
   });
 </script>
</c:if>

<jsp:include page="helpers/renderViewMoreLink.jsp" />

<c:remove var="stories" scope="request"/>
