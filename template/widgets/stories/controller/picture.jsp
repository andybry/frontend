<%--
 * $Id:$
 * $URL:$
 *
 * This is the controller for the picture view of stories widget
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>

<c:set target="${stories}" property="source" value="${fn:trim(widgetContent.fields.sourcePicture.value)}"/>

<c:set target="${stories}" property="begin" value="${fn:trim(widgetContent.fields.beginPicture.value) - 1}"/>
<c:set target="${stories}" property="numberOfItems"
       value="${fn:trim(widgetContent.fields.numberOfItemsPicture.value)}"/>


<c:choose>
  <c:when test="${empty fn:trim(stories.weights)}">
    <c:set target="${stories}" property="weights" value="image_heavy_b:true"/>
  </c:when>
  <c:otherwise>
    <c:set target="${stories}" property="weights" value="${stories.weights} image_heavy_b:true"/>
  </c:otherwise>
</c:choose>

<jsp:include page="helpers/getArticles.jsp">
  <jsp:param name="widgetContentId" value="${widgetContent.id}"/>
</jsp:include>


<c:set var="imageRepresentation"
       value="${fn:trim(widgetContent.fields.imageRepresentationPicture.value)}"/>

<c:if test="${imageRepresentation eq 'custom'}">
  <c:set var="imageRepresentation" value="${fn:trim(widgetContent.fields.imageVersion.value)}"/>
  <c:if test="${empty imageRepresentation}">
    <c:set var="imageRepresentation" value="s228"/>
  </c:if>
</c:if>

<c:set target="${stories}" property="imageVersion" value="${imageRepresentation}"/>

<jsp:include page="helpers/calculateViewModel.jsp" />
