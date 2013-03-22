<%--
 * $Id:$
 * $URL:$
 *
 * This is the controller for the largeTeaser view of stories widget
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="article" uri="http://www.escenic.com/taglib/escenic-article" %>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core" %>

<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>

<c:set target="${stories}" property="source" value="${fn:trim(widgetContent.fields.sourceLargeTeaser.value)}"/>

<c:set target="${stories}" property="begin" value="${fn:trim(widgetContent.fields.beginLargeTeaser.value) - 1}"/>
<c:set target="${stories}" property="numberOfItems"
       value="${fn:trim(widgetContent.fields.numberOfItemsLargeTeaser.value)}"/>
<jsp:include page="helpers/getArticles.jsp">
  <jsp:param name="widgetContentId" value="${widgetContent.id}"/>
</jsp:include>

<c:set target="${stories}" property="maxCharacters"
       value="${fn:trim(widgetContent.fields.maxCharactersLargeTeaser.value)}"/>
<c:set target="${stories}" property="showComments"
       value="${fn:trim(widgetContent.fields.showCommentsLargeTeaser.value)}"/>
<c:set target="${stories}" property="showIcons" value="${fn:trim(widgetContent.fields.showIconsLargeTeaser.value)}"/>
<c:set target="${stories}" property="headingSize"
       value="${fn:trim(widgetContent.fields.headingSizeLargeTeaser.value)}"/>
<c:set target="${stories}" property="relatedItem"
       value="${fn:trim(widgetContent.fields.showRelatedLargeTeaser.value)}"/>

<c:set target="${stories}" property="numberOfRelatedItems"
       value="${fn:trim(widgetContent.fields.noOfRelatedItemsLargeTeaser.value) - 1}"/>
<c:set target="${stories}" property="imagePosition"
       value="${fn:trim(widgetContent.fields.imagePositionLargeTeaser.value)}"/>

<c:set var="imageRepresentation"
       value="${fn:trim(widgetContent.fields.imageRepresentationLargeTeaser.value)}"/>

<c:if test="${imageRepresentation eq 'custom'}">
  <c:set var="imageRepresentation" value="${fn:trim(widgetContent.fields.imageVersion.value)}"/>
  <c:if test="${empty imageRepresentation}">
    <c:set var="imageRepresentation" value="s318"/>
  </c:if>
</c:if>

<c:set target="${stories}" property="imageVersion" value="${imageRepresentation}"/>

<c:set var="largeTeaserStyle" value="${fn:trim(widgetContent.fields.styleLargeTeaser.value)}"/>

<c:set target="${stories}" property="customStyleClass" value="${largeTeaserStyle} ${stories.customStyleClass}"/>
<c:set target="${stories}" property="hidePrimaryTagOrChannel" value="${fn:trim(widgetContent.fields.hidePrimaryTagOrChannelLargeTeaser.value)}"/>

<jsp:include page="helpers/calculateViewModel.jsp" />
