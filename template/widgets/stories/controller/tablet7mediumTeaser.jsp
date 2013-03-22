<%--
 * $Id:$
 * $URL:$
 *
 * This is the controller for the tablet7mediumTeaser view of stories widget
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="article" uri="http://www.escenic.com/taglib/escenic-article" %>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core" %>

<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>

<c:set target="${stories}" property="source" value="${fn:trim(widgetContent.fields.sourceMediumTeaser.value)}"/>

<c:set target="${stories}" property="begin" value="${fn:trim(widgetContent.fields.beginMediumTeaser.value) - 1}"/>
<c:set target="${stories}" property="numberOfItems"
       value="${fn:trim(widgetContent.fields.numberOfItemsMediumTeaser.value)}"/>

<jsp:include page="helpers/getArticles.jsp">
  <jsp:param name="widgetContentId" value="${widgetContent.id}"/>
</jsp:include> 

<c:set target="${stories}" property="maxCharacters"
       value="${fn:trim(widgetContent.fields.maxCharactersMediumTeaser.value)}"/>
<c:set target="${stories}" property="showComments"
       value="${fn:trim(widgetContent.fields.showCommentsMediumTeaser.value)}"/>
<c:set target="${stories}" property="showIcons" value="${fn:trim(widgetContent.fields.showIconsMediumTeaser.value)}"/>
<c:set target="${stories}" property="hidePrimaryTagOrChannel"
       value="${fn:trim(widgetContent.fields.hidePrimaryTagOrChannel.value)}"/>

<c:set var="imageRepresentation"
       value="${fn:trim(widgetContent.fields.imageRepresentationMediumTeaser.value)}"/>

<c:if test="${imageRepresentation eq 'custom'}">
  <c:set var="imageRepresentation" value="${fn:trim(widgetContent.fields.imageVersion.value)}"/>
  <c:if test="${empty imageRepresentation}">
    <c:set var="imageRepresentation" value="s148"/>
  </c:if>
</c:if>

<c:set target="${stories}" property="imageVersion" value="${imageRepresentation}"/>

<jsp:include page="helpers/calculateViewModel.jsp" />
