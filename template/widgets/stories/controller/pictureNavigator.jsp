<%--
 * File           : $Header: //depot/escenic/widget-framework/branches/1.10/widget-core-stories/src/main/webapp/template/widgets/stories/controller/mediumTeaser.jsp#1 $
 * Last edited by : $Author: asm $ $Date: 2011/09/08 $
 * Version        : $Revision: 41 $
 *
 * Copyright (C) 2009 Escenic AS.
 * All Rights Reserved.  No use, copying or distribution of this
 * work may be made except in accordance with a valid license
 * agreement from Escenic AS.  This notice must be included on
 * all copies, modifications and derivatives of this work.
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="collection" uri="http://www.escenic.com/taglib/escenic-collection" %>
<%@ taglib prefix="tm" tagdir="/WEB-INF/tags" %>

<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>

<c:set target="${stories}" property="widgetId" value="${widgetContent.id}"/>
<c:set target="${stories}" property="source" value="${fn:trim(widgetContent.fields.sourcePictureNavigator.value)}"/>
<c:set target="${stories}" property="begin" value="${fn:trim(widgetContent.fields.beginPictureNavigator.value) - 1}"/>
<c:set target="${stories}" property="imageVersion" value="${fn:trim(widgetContent.fields.imageVersionPictureNavigator.value)}"/>

<%--Example of the ajax url for topic pages, should be copied to all widgets with ajax equivalents --%>
<c:choose>
  <c:when test="${not empty requestScope['com.escenic.framework.ece.tag']}">
    <c:set var="ajaxUrl" value="${publication.url}${requestScope['com.escenic.framework.topic.pattern.uri']}/${requestScope['com.escenic.framework.topic.term']}"></c:set>
  </c:when>
  <c:otherwise>
    <c:set var="ajaxUrl" value="${section.url}"/>
  </c:otherwise>
</c:choose>
<c:set target="${stories}" property="ajaxUrl" value="${ajaxUrl}?service=ajax&item=${fn:trim(widgetContent.fields.ajaxUrlParamPictureNavigator.value)}"/>

<%--
  Important here are the views, the number of items per panel and the total amount of items fetched from solr.
  The first (non-ajax) request as part of the full page loads the amount of items that fit in one panel.
  The second and last request loads all the items to be displayed and cuts them in panels. Hence, the total amount
  of request for the picture navigator is 2.
--%>
<c:choose>
  <c:when test="${not empty param['service'] and param['service'] eq 'ajax'}">
    <%-- Total number of items to be displayed in the picture navigator, called this way for backwards competability, the ajax parts needs all the items, so the total amount --%>
    <c:set target="${stories}" property="numberOfItems" value="${fn:trim(widgetContent.fields.numberOfItemsPictureNavigatorAjax.value)}"/>
    <%-- The amount of items in a panel is the same as the total amount of items needed for the non-ajax (first) panel/scroll --%>
    <c:set target="${stories}" property="panelItemCount" value="${fn:trim(widgetContent.fields.numberOfItemsPictureNavigator.value)}"/>
    <c:set target="${stories}" property="isAjax" value="${true}"/>
  </c:when>
  <c:otherwise>
    <c:set target="${stories}" property="numberOfItems" value="${fn:trim(widgetContent.fields.numberOfItemsPictureNavigator.value)}"/>
    <%-- the property "panelItemCount" is not needed here, it is for maintenance reasons here, so it is easy to see the switch of properties with the normal and ajax view --%>
    <c:set target="${stories}" property="panelItemCount" value="${fn:trim(widgetContent.fields.numberOfItemsPictureNavigator.value)}"/>
    <c:set target="${stories}" property="isAjax" value="${false}"/>
  </c:otherwise>
</c:choose>

<jsp:include page="helpers/getArticles.jsp">
  <jsp:param name="widgetContentId" value="${widgetContent.id}"/>
</jsp:include>

<jsp:include page="helpers/calculateViewModel.jsp" />

<%-- filter for articles that have images and add the smallImageMap field --%>
<jsp:useBean id="filteredArticlesMaps" class="java.util.ArrayList" scope="page" />
<c:forEach var="articleMap" items="${stories.articleMaps}" varStatus="status">
  <%-- construct the (sub) fields relating to the small image --%>
  <c:if test="${articleMap.showImage}">
    <jsp:useBean id="smallImageMap" class="java.util.HashMap" scope="page" />
    <c:set target="${smallImageMap}" property="id" value="${articleMap.id}" />
    <c:set target="${smallImageMap}" property="inpageStyleClass" value="${articleMap.imageMap.inpageStyleClass}" />
    <c:set target="${smallImageMap}" property="url" value="${elfn:replaceFirst(articleMap.imageMap.url, stories.imageVersion, 's118')}" />
    <c:set target="${smallImageMap}" property="alttext" value="${articleMap.imageMap.alttext}" />
    <c:set target="${smallImageMap}" property="width" value="118" />
    <c:set target="${smallImageMap}" property="height" value="52" />
    <c:set target="${smallImageMap}" property="showPictureCaption" value="${stories.showCaption!='hide' and not empty teaserImageMap.caption}"/>
    <c:set target="${smallImageMap}" property="captionDivId" value="widget${widgetContent.id}-story${storyArticle.id}-picture${teaserImageMap.imageArticleId}-info"/>
    <c:set target="${articleMap}" property="smallImageMap" value="${smallImageMap}" />
    <c:remove var="smallImageMap" scope="page"/>
    <c:remove var="teaserImageMap"/>
    <collection:add collection="${filteredArticlesMaps}" value="${articleMap}" />
  </c:if>
</c:forEach>
<%-- reset the value of hasArticles and articlesMaps to reflect the filtering --%>
<c:set target="${stories}" property="articleMaps" value="${filteredArticlesMaps}" />
<c:set target="${stories}" property="hasArticles" value="${not empty stories.articleMaps}" />
<c:set target="${stories}" property="articleMapCount" value="${fn:length(stories.articleMaps)}" />
<c:set target="${stories}" property="articleMapEndIndex" value="${stories.articleMapCount - 1}" />

<%--
  make sure that the Akamai and Varnish cache for the ajax request expires at the same time as the
  the cache for the page it's displayed on by adding a url variable corresponding to the page
 --%>
<c:if test="${stories.hasArticles}">
  <jsp:useBean id="currentDate" class="java.util.Date" scope="page" />
  <c:set target="${stories}" property="ajaxUrl" value="${stories.ajaxUrl}&salt=${currentDate.time}"/>
</c:if>

