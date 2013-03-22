<%--
 * File           : $Header: //depot/escenic/widget-framework/branches/1.10/widget-framework-core/src/main/webapp/template/framework/element/ats.jsp#1 $
 * Last edited by : $Author: michael.smith $ $Date: 2011-08-16 16:42:45 +0100 (Tue, 16 Aug 2011) $
 * Version        : $Revision: 41 $
 *
 * Copyright (C) 2009 Escenic AS.
 * All Rights Reserved.  No use, copying or distribution of this
 * work may be made except in accordance with a valid license
 * agreement from Escenic AS.  This notice must be included on
 * all copies, modifications and derivatives of this work.
--%>

<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core" %>

<c:set var="contentType" value="${element.content.articleTypeName}"/>

<c:choose>
  <c:when test="${fn:startsWith(contentType,'widget_')}">
    <c:set var="widgetName" value="${fn:substringAfter(contentType, 'widget_')}" scope="request"/>
    <c:choose>
      <c:when test="${requestScope.isConfigSection}">
        <h1>Config Section</h1>
      </c:when>
      <c:otherwise>
        <wf-core:include widgetName="${widgetName}" />
      </c:otherwise>
    </c:choose>
  </c:when>
  <c:otherwise>
    <c:if test="${not empty contentType}">
      <h2 class="error">
        <fmt:message key="widget.invalid.error.message">
          <fmt:param value="${contentType}"/>
        </fmt:message>
      </h2>
    </c:if>
  </c:otherwise>
</c:choose>
