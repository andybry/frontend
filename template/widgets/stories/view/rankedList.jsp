<%--
  *  $Id: rankedList.jsp 9268 2013-03-08 13:00:32Z andrew.bryant $
  *  $URL: https://trinitymirror.jira.com/svn/SWL/trunk/src/main/webapp/template/widgets/stories/view/rankedList.jsp $
  *
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>
<%@ page language="java" pageEncoding="UTF-8" contentType="${stories.contentType}" %>

<c:if test="${stories.hasArticles}">
  <div id="recommended-wrapper-${stories.widgetId}" class="recommended-wrapper">
    <%-- love box: describes recommendations and how to turn them on/off --%>
    <jsp:include page="helpers/lovebox.jsp"/>
    
    <div class="most-read top-stories recommended-stories">
      <%-- heading --%>
      <h3 class="box-heading">${stories.title} <a class="info" href="${stories.helpSectionLink}">Why?</a></h3>
  
      <%-- stories --%>
      <div class="box-bottom">
        <ul>
          <c:forEach var="articleMap" items="${stories.articleMaps}" varStatus="status">
             
            <%-- image --%>
            <li class="clearfix ${status.last ? 'last' : ''}">
              <a href="${articleMap.url}">
               <img 
                src="${articleMap.imageMap.url}"
                class="${stories.imagePosition} ${articleMap.inpageTitleClass}"
                alt="<c:out value='${articleMap.imageMap.alttext}' escapeXml='true'/>"
                title="<c:out value='${articleMap.imageMap.caption}' escapeXml='true'/>"
                width="${articleMap.imageMap.width}"
                height="${articleMap.imageMap.height}"
               />
              </a>

              <%-- topic --%>
              <c:if test="${not empty articleMap.topicMap}">
                <h5><a href="${articleMap.topicMap.url}">${articleMap.topicMap.name}</a></h5>
              </c:if>

              <%-- article text --%>
              <p>
                <a href="${articleMap.url}">${stories.useShortHeadline ? articleMap.shortHeadline : articleMap.title}</a>
              </p>

            </li>
            
          </c:forEach>
        </ul>
      </div>
    
    </div>

  </div>

</c:if>

<c:if test="${not empty stories.ajaxUrl and (not empty stories.enableRummbleLabs and stories.enableRummbleLabs)}">
  <script type="text/javascript">//<![CDATA[
      $LAB.script("${stories.personalisationJsUrl}")
          .script("${stories.uuidJsUrl}")
          .script("${stories.cookieJsUrl}")
          .wait(function(){
            if ($().personalisation("wantsPersonalisation")) {
              $("#recommended-wrapper-${stories.widgetId}").personalisation(
                "getRankedArticles",
                { "ajaxSrc" : "${stories.ajaxUrl}"}
              );
            } else {
              // no personalisation
            }
      });
    //]]>
  </script>
</c:if>

<jsp:include page="helpers/renderViewMoreLink.jsp" />

<c:remove var="stories" />
