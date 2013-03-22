<%--
  *  $Id: rankedList.jsp 9018 2013-02-28 14:26:11Z andrew.bryant $
  *  $URL: https://trinitymirror.jira.com/svn/SWL/trunk/src/main/webapp/template/widgets/stories/view/rankedList.jsp $
  *
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>
<%@ page language="java" pageEncoding="UTF-8" contentType="${stories.contentType}" %>

<c:if test="${stories.hasArticles}">
  <div class="recommended-teaser clearfix" id="recommended-wrapper-${stories.widgetId}">
    <h2 class="section-title">Recommended for you</h2>
    <c:forEach var="articleMap" items="${stories.articleMaps}" varStatus="status">
      <c:choose>
        <c:when test="${status.count % 2 == 1 }">
      <div class="item-container-left">  
        </c:when>
        <c:otherwise>
      <div class="item-container-right">
        </c:otherwise>
      </c:choose>
      
        <figure class="inline-image">
           <a href="${articleMap.url}"><img src="${articleMap.imageMap.url}" 
                                        alt="<c:out value='${articleMap.imageMap.alttext}' escapeXml='true'/>" 
                                        class="" 
                                        title="<c:out value='${articleMap.imageMap.caption}' escapeXml='true'/>"></a>
        </figure>
        <div class="teaser-content">
          <jsp:include page="helpers/tools.jsp">
            <jsp:param name="showComments" value="${articleMap.showComments}"/>
            <jsp:param name="pluckArticleId" value="${articleMap.pluckArticleId}"/>
            <jsp:param name="dateTime" value="${articleMap.dateTime}"/>
            <jsp:param name="dateStringForTimeElement" value="${articleMap.dateStringForTimeElement}"/>
            <jsp:param name="dateTimeInMs" value="${articleMap.dateTimeInMs}"/>
            <jsp:param name="imageHeavy" value="${articleMap.imageHeavy}"/>
            <jsp:param name="video" value="${articleMap.video}"/>
            <jsp:param name="topicName" value="${articleMap.topicMap.name}"/>
            <jsp:param name="topicUrl" value="${articleMap.topicMap.url}"/>
            <jsp:param name="articleUrl" value="${articleMap.url}"/>
          </jsp:include>          
          <h3 class="teaser-title"><a href="${articleMap.url}">${stories.useShortHeadline ? articleMap.shortHeadline : articleMap.title}</a></h3>
        </div>
      </div>
      <c:if test="${status.count == 4 }">
        <div class="buttons-panel clearfix">
          <a href="index.html" data-role="button">Improve these suggestions</a>
        </div>        
      </c:if>
      <c:if test="${status.count % 2 == 0 }">
        <div class="row-clear"></div>
      </c:if>
    </c:forEach>
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

<c:remove var="stories" />