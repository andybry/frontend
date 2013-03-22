<%--
 * $Header: https://trinitymirror.jira.com/svn/SWL/trunk/src/main/webapp/template/widgets/stories/controller/inPictures.jsp 9190 2013-03-07 13:35:55Z robyn.backhouse $
 * $Author: robyn.backhouse $
 * $Revision: 9190 $
 * This is the controller for the In Pictures view of stories widget
--%>

<%@ page contentType="text/html; charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="article" uri="http://www.escenic.com/taglib/escenic-article" %>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core" %>

<%--create a map that will contain relevant field values --%>
<jsp:useBean id="stories" class="java.util.HashMap" scope="request"/>

<%-- itemsPerPage - due to the repeating pattern of the galleries, a full set is currently set to 11. --%>
<%-- Grid layout is one large image, followed by 3 small, 2 medium, 3 small, 2 medium. This pattern is repeated. --%>
<c:set var="itemsPerPage" value="11"/>

<c:set target="${stories}" property="source" value="${requestScope.widgetContent.fields.sourceInPictures.value}"/>
<c:set target="${stories}" property="numberOfItems" value="${requestScope.widgetContent.fields.numberOfGalleriesInPictures.value * itemsPerPage}"/>

<%-- show only those items explicitly marked for inclusion --%>
<c:set target="${stories}" property="filterQuery" value="(includeininpictures_b:true)"/>

<jsp:include page="helpers/getArticles.jsp">
  <jsp:param name="widgetContentId" value="${requestScope.widgetContent.id}"/>
</jsp:include>

<c:if test="${not empty stories.articles and fn:length(stories.articles) > 0}">
  <%-- Create a list of galleries with all the data we need. --%>
  <collection:createList id="galleriesList" type="java.util.ArrayList" toScope="page"/>

  <%-- Ignore extra galleries which do not make a complete set, when there is more than one whole set. --%>
  <c:set target="${stories}" property="indexOfLastGallery" value="${fn:length(stories.articles) - 1}" />
  <c:if test="${fn:length(stories.articles) > itemsPerPage}">
    <c:set target="${stories}" property="indexOfLastGallery" value="${fn:length(stories.articles) - (fn:length(stories.articles) % itemsPerPage) - 1}" />
  </c:if>

  <c:set var="counter" value="0"/>
  <%-- display search result items for this page --%>
  <c:forEach var="gallery" items="${stories.articles}" varStatus="status" begin="0" end="${stories.indexOfLastGallery}">
    <collection:createMap id="temp" type="java.util.HashMap" toScope="page"/>

    <%-- Galleries are in sets of itemsPerPage --%>
    <c:set var="counter" value="${(status.count % itemsPerPage)}"/>
    <%-- specific values for different thumb sizes --%>
    <c:choose>
      <c:when test="${counter == 1}">
        <%-- Large sized image --%>
        <collection:add collection="${temp}" key="imageVersion" value="s700"/>
        <collection:add collection="${temp}" key="spanClass" value="span-17-5 last"/>
        <collection:add collection="${temp}" key="firstImageSpanClass" value="top-teaser clearfix"/>
        <collection:add collection="${temp}" key="imageHeight" value="467"/>
        <collection:add collection="${temp}" key="imageWidth" value="700"/>
      </c:when>
      <c:when test="${counter == 2 || counter == 3 || counter == 4 || counter == 7 || counter == 8 || counter == 9}">
        <%-- Small sized image --%>
        <collection:add collection="${temp}" key="imageVersion" value="s226"/>
        <collection:add collection="${temp}" key="spanClass" value="span-5-6"/>
        <c:if test="${counter == 4 || counter == 9}">
          <%-- If last on row, add 'last' --%>
          <c:set target="${temp}" property="spanClass" value="${temp.spanClass} last"/>
        </c:if>
        <collection:add collection="${temp}" key="firstImageSpanClass" value=""/>
        <collection:add collection="${temp}" key="imageHeight" value="151"/>
        <collection:add collection="${temp}" key="imageWidth" value="226"/>
      </c:when>
      <c:when test="${counter == 5 || counter == 6 || counter == 10 || counter == 0}"><%-- The final image is on counter == 0 due to modulo arithmetic --%>
        <%-- Medium sized image --%>
        <collection:add collection="${temp}" key="imageVersion" value="s345"/>
        <collection:add collection="${temp}" key="spanClass" value="span-8-5"/>
        <c:if test="${counter == 6 || counter == 0}">
          <%-- If last on row, add 'last' --%>
          <c:set target="${temp}" property="spanClass" value="${temp.spanClass} last"/>
        </c:if>
        <collection:add collection="${temp}" key="firstImageSpanClass" value=""/>
        <collection:add collection="${temp}" key="imageHeight" value="230"/>
        <collection:add collection="${temp}" key="imageWidth" value="345"/>
      </c:when>
    </c:choose>

    <%-- values common to all thumb sizes --%>
    <tm:getArticleIntro id="leadtext" articleObject="${gallery}"/>
    <c:set target="${temp}" property="leadtext" value="${leadtext}"/>
    <tm:getTeaserImageMap var="teaserImageMap" articleId="${gallery.id}" imageVersion="${temp.imageVersion}"/>
    <c:set target="${temp}" property="teaserImageMap" value="${teaserImageMap}"/>
    <tm:getContentUrl var="articleUrl" articleObject="${gallery}"/>
    <c:set target="${temp}" property="articleUrl" value="${articleUrl}"/>
    <c:set target="${temp}" property="articleStyleClass" value="article ma-teaser sa-teaser clearfix"/>
    <c:set target="${temp}" property="listItemId" value="${gallery.id}"/>
    <tm:getArticleTopicMap article="${gallery}" id="articleTopic"/>
    <c:set target="${temp}" property="primaryTag" value="${articleTopic.title}" />

    <collection:add collection="${galleriesList}" value="${temp}" key="key${gallery.id}"/>
    <c:remove var="temp" scope="page"/>
  </c:forEach>
  
  <c:set target="${stories}" property="galleriesList" value="${galleriesList}" />
</c:if>


