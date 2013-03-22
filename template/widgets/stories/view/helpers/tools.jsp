<%--
 * $Id:$
 * $URL:$
 *
 * The purpose of this page is to show list of style icons (gallery / video), primary topic / label, ratings
 * and comments count links for a teaser
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.escenic.com/taglib/escenic-collection" prefix="collection" %>

<%-- The requires the following attributes in the requestScope --%>
<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>

<c:set var="needToInjectRelativeTime" value="false"/>

<%-- We create a List tools from stories.toolOrder by excluding the unused tools from toolOrder.
This is so that we can add the class "last" to the last li entry.
It would be good to be able to push this logic back to the controller. --%>
<collection:createList id="tools"/>
<c:forEach var="tool" items="${stories.toolOrder}">
  <c:if test="${tool == 'comments' && param.showComments}">
    <collection:add collection="${tools}" value="${tool}"/>
  </c:if>
  <c:if test="${(tool == 'gallery' && stories.showIcons && param.imageHeavy) or (tool == 'gallery' && stories.showIcons && param.imageGallery)}">
    <collection:add collection="${tools}" value="${tool}"/>
  </c:if>
  <c:if test="${tool == 'video' && stories.showIcons && param.video}">
    <collection:add collection="${tools}" value="${tool}"/>
  </c:if>
  <c:if test="${tool == 'topic' && (empty stories.hidePrimaryTagOrChannel or stories.hidePrimaryTagOrChannel != 'true')}">
    <collection:add collection="${tools}" value="${tool}"/>
  </c:if>
  <c:if test="${tool == 'dateTime' && not empty param.dateTime && not empty param.dateStringForTimeElement &&
                (not stories.showTimeStamp || (stories.showTimeStamp && not empty param.dateTimeInMs))}">
    <collection:add collection="${tools}" value="${tool}"/>
    <c:if test="${stories.showTimeStamp}">
      <c:set var="needToInjectRelativeTime" value="true"/>
    </c:if>
  </c:if>
  <c:if test="${tool == 'rating' && not empty param.rating}">
    <collection:add collection="${tools}" value="${tool}"/>
  </c:if>

</c:forEach>

<ul class="tools<c:if test="${param.toolsClass eq 'clearfix'}"> clearfix</c:if>" >
  <c:forEach var="tool" items="${tools}" varStatus="status">
    <c:choose>
      <c:when test="${status.last}">
        <c:set var="singleLastClass" value=' class="last"'/>
        <c:set var="addedLastClass" value="last "/>
      </c:when>
      <c:otherwise>
        <c:set var="singleLastClass" value=""/>
        <c:set var="addedLastClass" value=""/>
      </c:otherwise>
    </c:choose>
    <c:choose>
      <c:when test="${tool == 'comments'}">
        <li class="${addedLastClass}hide"><a href="${param.articleUrl}#comments" class="comment" data-pluckArticleId="${param.pluckArticleId}"></a></li>
      </c:when>
      <c:when test="${tool == 'gallery'}">
        <li${singleLastClass}><a href="${param.articleUrl}" class="ir gallery">Gallery</a></li>
      </c:when>
      <c:when test="${tool == 'video'}">
        <li${singleLastClass}><a href="${param.articleUrl}" class="ir vid">Video</a></li>
      </c:when>
      <c:when test="${tool == 'topic'}">
        <li${singleLastClass}>
          <c:choose>
            <c:when test="${not empty param.topicUrl}">
              <a href="${param.topicUrl}" class="more">${param.topicName}</a>
            </c:when>
            <c:otherwise>
              ${param.topicName}
            </c:otherwise>
          </c:choose>
        </li>
      </c:when>
      <c:when test="${tool == 'dateTime' && stories.showTimeStamp}">
        <li${singleLastClass}>
          <time datetime="${param.dateStringForTimeElement}" pubdate="" data-storiesTime="${param.dateTimeInMs}">
            <noscript>${param.dateTime}</noscript>
          </time>
        </li>
      </c:when>
      <c:when test="${tool == 'dateTime' && not stories.showTimeStamp and (stories.view eq 'paginatedList' or stories.view eq 'archive')}">
        <li class="${addedLastClass}time">
          <time datetime="${param.dateStringForTimeElement}" pubdate="">
            ${param.dateTime}
          </time>
        </li>
      </c:when>
      <%-- rating --%>
      <c:when test="${tool == 'rating'}">
        <li class="${addedLastClass}rating${param.rating} ir">
          <c:forEach begin="1" end="${param.rating}">
          *
          </c:forEach>
        </li>
      </c:when>
    </c:choose>
  </c:forEach>
</ul>

<c:if test="${needToInjectRelativeTime}">
  <%-- Now inject in the relative time into the time element. --%>
  <script type="text/javascript">
  //<![CDATA[
    $LAB
    .script("${requestScope.resourceUrl}js/tm.relTime.js")
    .wait(function() {
      $.setRelTime();
    });
  //]]>
  </script>
</c:if>
