<%--
 * $Id:$
 * $URL:$
 *
 * This is the controller for the splash view of stories widget
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="article" uri="http://www.escenic.com/taglib/escenic-article" %>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core" %>

<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>

<c:set target="${stories}" property="source" value="${fn:trim(widgetContent.fields.sourceSplash.value)}"/>

<c:set target="${stories}" property="begin" value="${fn:trim(widgetContent.fields.beginSplash.value) - 1}"/>
<c:set target="${stories}" property="numberOfItems" value="${fn:trim(widgetContent.fields.numberOfItemsSplash.value)}"/>

<jsp:include page="helpers/getArticles.jsp">
  <jsp:param name="widgetContentId" value="${widgetContent.id}"/>
</jsp:include>

<c:set target="${stories}" property="maxCharacters" value="${fn:trim(widgetContent.fields.maxCharactersSplash.value)}"/>
<c:set target="${stories}" property="showComments" value="${fn:trim(widgetContent.fields.showCommentsSplash.value)}"/>
<c:set target="${stories}" property="showIcons" value="${fn:trim(widgetContent.fields.showIconsSplash.value)}"/>
<c:set var="imageRepresentation" value="${fn:trim(widgetContent.fields.imageRepresentationSplash.value)}"/>
<c:set target="${stories}" property="imagePosition" value="${fn:trim(widgetContent.fields.imagePositionSplash.value)}"/>
<c:set target="${stories}" property="titlePosition" value="${fn:trim(widgetContent.fields.titlePositionSplash.value)}"/>
<c:set target="${stories}" property="titleSize" value="${fn:trim(widgetContent.fields.titleSizeSplash.value)}"/>

<c:choose>
  <c:when test="${stories.imageRepresentation eq 'custom'}">
    <c:set var="imageRepresentation" value="${fn:trim(widgetContent.fields.imageVersion.value)}"/>
    <c:if test="${empty stories.imageRepresentation}">
      <c:choose>
       <c:when test="${stories.imagePosition == 'left' || stories.imagePosition == 'right'}">
        <c:set var="imageRepresentation" value="s578"/>
      </c:when>
      <c:otherwise>
        <c:set var="imageRepresentation" value="s948"/>
      </c:otherwise>
      </c:choose>
    </c:if>
  </c:when>
  <c:otherwise>
    <c:choose>
      <c:when test="${stories.imagePosition == 'left' || stories.imagePosition == 'right'}">
        <c:set var="imageRepresentation" value="s578"/>
      </c:when>
      <c:otherwise>
        <c:set var="imageRepresentation" value="s948"/>
      </c:otherwise>
    </c:choose>
  </c:otherwise>
</c:choose>

<c:set target="${stories}" property="imageVersion" value="${imageRepresentation}"/>

<c:choose>
  <c:when test="${stories.imagePosition == 'left'}">
    <c:set var="wrapperStyleClass" value="article splash-right clearfix ${stories.customStyleClass}"/>
    <c:set var="titleStyleClass" value="${stories.titleSize=='small'?'small-text':''}" />
  </c:when>
  <c:when test="${stories.imagePosition == 'right'}">
    <c:set var="wrapperStyleClass" value="article splash clearfix ${stories.customStyleClass}"/>
    <c:set var="titleStyleClass" value="${stories.titleSize=='small'?'small-text':''}" />
  </c:when>
  <c:when test="${stories.imagePosition == 'top'}">
    <c:set var="wrapperStyleClass" value="article splash-image-led clearfix ${stories.customStyleClass}"/>
    <c:set var="titleStyleClass" value="${stories.titleSize=='small'?'small-text ':''}${stories.titlePosition}" />
  </c:when>
</c:choose>

<c:set target="${stories}" property="wrapperStyleClass" value="${wrapperStyleClass}"/>

<c:set target="${stories}" property="titleStyleClass" value="${titleStyleClass}" />

<jsp:include page="helpers/calculateViewModel.jsp" />
