<%--
 * $Id:$
 * $URL:$
 *
 * This is the controller for the tablet7smallTeaser view of stories widget
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="article" uri="http://www.escenic.com/taglib/escenic-article" %>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core" %>

<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>

<c:set target="${stories}" property="source" value="${fn:trim(widgetContent.fields.sourceSmallTeaser.value)}"/>

<c:set target="${stories}" property="begin" value="${fn:trim(widgetContent.fields.beginSmallTeaser.value) - 1}"/>
<c:set target="${stories}" property="numberOfItems"
       value="${fn:trim(widgetContent.fields.numberOfItemsSmallTeaser.value)}"/>

<jsp:include page="helpers/getArticles.jsp">
  <jsp:param name="widgetContentId" value="${widgetContent.id}"/>
</jsp:include>

<c:set target="${stories}" property="maxCharacters"
       value="${fn:trim(widgetContent.fields.maxCharactersSmallTeaser.value)}"/>
<c:set target="${stories}" property="showComments"
       value="${fn:trim(widgetContent.fields.showCommentsSmallTeaser.value)}"/>
<c:set target="${stories}" property="showIcons" value="${fn:trim(widgetContent.fields.showIconsSmallTeaser.value)}"/>
<c:set target="${stories}" property="hidePrimaryTagOrChannel" value="${fn:trim(widgetContent.fields.hidePrimaryTagOrChannel.value)}"/>

<c:set var="imageRepresentation"
       value="${fn:trim(widgetContent.fields.imageRepresentationSmallTeaser.value)}"/>

<c:if test="${imageRepresentation eq 'custom'}">
  <c:set var="imageRepresentation" value="${fn:trim(widgetContent.fields.imageVersion.value)}"/>
  <c:if test="${empty imageRepresentation}">
    <c:set var="imageRepresentation" value="s88"/>
  </c:if>
</c:if>

<c:set target="${stories}" property="imageVersion" value="${imageRepresentation}"/>

<jsp:include page="helpers/calculateViewModel.jsp" />



<%-- ****************** --%>
<%--  HANDLEBARS JSON   --%>

<c:set var="template" value="/template/handlebars/widgets/stories/tablet7smallTeaser.tmpl"/>

<c:set var="json" scope="page">
{
  "url": "http://www.mirror.co.uk/news/uk-news/reading-crocodile-cyclist-claims-saw-1720391",
  "title": "Is there a crocodile in the River Thames? Cyclist claims he saw 4ft long predator swimming in water",
  "pubDate": "20 Feb 2013 15:59",
  "imageUrl": "http://i3.mirror.co.uk/incoming/article1553410.ece/ALTERNATES/s338b/A+large+saltwater+crocodile+shows+aggression+as+a+boat+passes+by+on+the+Adelaide+river",
  "imageAltText": "Scary: It's claimed the 4ft long crocodile was spotted in the River Thames in Reading",
  "topicUrl": "http://www.mirror.co.uk/all-about/crocodiles",
  "topicName": "Crocodiles",
  "intro": "The 64-year-old says he got the shock of his life when he saw the large reptile swimming along the waterway at Reading",
   "hasRelatedStories": false
}
</c:set>

<shared:handlebars template="${template}" json="${json}" />

