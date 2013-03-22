<%--
 * $Id:$
 * $URL:$
 *
 * This is the controller for the doubleHorizontalTeaser view of stories widget
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="article" uri="http://www.escenic.com/taglib/escenic-article" %>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core" %>

<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>

<c:set target="${stories}" property="source"
       value="${fn:trim(widgetContent.fields.sourceDoubleHorizontalTeaser.value)}"/>

<c:set target="${stories}" property="begin"
       value="${fn:trim(widgetContent.fields.beginDoubleHorizontalTeaser.value) - 1}"/>
<c:set target="${stories}" property="numberOfItems"
       value="${fn:trim(widgetContent.fields.numberOfItemsDoubleHorizontalTeaser.value)}"/>
  
<jsp:include page="helpers/getArticles.jsp">
  <jsp:param name="widgetContentId" value="${widgetContent.id}"/>
</jsp:include>

<c:set target="${stories}" property="maxCharacters"
       value="${fn:trim(widgetContent.fields.maxCharactersDoubleHorizontalTeaser.value)}"/>
<c:set target="${stories}" property="showComments"
       value="${fn:trim(widgetContent.fields.showCommentsDoubleHorizontal.value)}"/>
<c:set target="${stories}" property="showIcons"
       value="${fn:trim(widgetContent.fields.showIconsDoubleHorizontal.value)}"/>
<c:set target="${stories}" property="headingSize"
       value="${fn:trim(widgetContent.fields.headingSizeDoubleHorizontal.value)}"/>
<c:set target="${stories}" property="relatedItem"
       value="${fn:trim(widgetContent.fields.showRelatedDoubleHorizontal.value)}"/>
<c:set target="${stories}" property="numberOfRelatedItems"
       value="${fn:trim(widgetContent.fields.noOfRelatedItemsDoubleHorizontal.value) - 1}"/>
<c:set target="${stories}" property="headlinePosition"
       value="${fn:trim(widgetContent.fields.headlinePositionDoubleHorizontal.value)}"/>
<c:set var="imageRepresentation"
       value="${fn:trim(widgetContent.fields.imageRepresentationDoubleHorizontalTeaser.value)}"/>
<c:if test="${imageRepresentation eq 'custom'}">
  <c:set var="imageRepresentation" value="${fn:trim(widgetContent.fields.imageVersion.value)}"/>
  <c:if test="${empty imageRepresentation}">
    <c:set var="imageRepresentation" value="s508"/>
  </c:if>
</c:if>
<c:set target="${stories}" property="imageVersion" value="${imageRepresentation}"/>
<c:choose>
  <c:when test="${stories.headlinePosition eq 'top'}">
    <c:set target="${stories}" property="customStyleClass" value="${stories.customStyleClass} dh-teaser-hdln clearfix"/>
  </c:when>
  <c:when test="${stories.headlinePosition eq 'left'}">
    <c:set target="${stories}" property="customStyleClass" value="${stories.customStyleClass} dh-teaser clearfix"/>
  </c:when>
</c:choose>

<jsp:include page="helpers/calculateViewModel.jsp" />
