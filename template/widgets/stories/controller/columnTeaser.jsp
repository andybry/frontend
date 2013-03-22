<%--
 * $Id:$
 * $URL:$
 *
 * This is the controller of the columnTeaser view of stories widget
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="article" uri="http://www.escenic.com/taglib/escenic-article" %>
<%@ taglib uri="http://www.escenic.com/taglib/escenic-section" prefix="section" %>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core" %>

<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>

<c:set target="${stories}" property="source" value="${fn:trim(widgetContent.fields.sourceColumnTeaser.value)}"/>

<c:set target="${stories}" property="begin" value="${fn:trim(widgetContent.fields.beginColumnTeaser.value) - 1}"/>
<c:set target="${stories}" property="numberOfColumnColumnTeaser"
       value="${fn:trim(widgetContent.fields.numberOfColumnColumnTeaser.value)}"/>
<c:choose>
  <c:when test="${stories.numberOfColumnColumnTeaser eq 'fourColumn'}">
    <c:set target="${stories}" property="numberOfItems" value="4"/>
  </c:when>
  <c:when test="${stories.numberOfColumnColumnTeaser eq 'fiveColumn'}">
    <c:set target="${stories}" property="numberOfItems" value="5"/>
  </c:when>
</c:choose>

<jsp:include page="helpers/getArticles.jsp">
  <jsp:param name="widgetContentId" value="${widgetContent.id}"/>
</jsp:include>

<c:set target="${stories}" property="showWidgetTitle"
       value="${fn:trim(widgetContent.fields.showWidgetTitleColumnTeaser.value)}"/>
<c:set target="${stories}" property="maxCharacters"
       value="${fn:trim(widgetContent.fields.maxCharactersColumnTeaser.value)}"/>

<c:set var="imageRepresentation"
       value="${fn:trim(widgetContent.fields.customImageRepresentationColumnTeaser.value)}"/>

<c:if test="${empty imageRepresentation}">
  <c:set var="imageRepresentation" value="s148"/>
</c:if>


<c:set target="${stories}" property="imageRepresentation" value="${imageRepresentation}"/>

<c:set target="${stories}" property="showPrimaryTagColumnTeaser"
       value="${fn:trim(widgetContent.fields.showPrimaryTagColumnTeaser.value)}"/>
<c:if test="${empty stories.showPrimaryTagColumnTeaser}">
  <c:set target="${stories}" property="showPrimaryTagColumnTeaser" value="true"  />
</c:if>

<jsp:include page="helpers/calculateViewModel.jsp" />
