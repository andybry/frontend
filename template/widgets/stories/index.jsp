<%--
 * File           : $Header: //depot/escenic/widget-framework/branches/1.10/widget-core-stories/src/main/webapp/template/widgets/stories/index.jsp#1 $
 * Last edited by : $Author: sajida.mustafa $ $Date: 2013-02-08 13:05:41 +0000 (Fri, 08 Feb 2013) $
 * Version        : $Revision: 8426 $
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
<%@ taglib prefix="util" uri="http://www.escenic.com/taglib/escenic-util" %>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core" %>
<%@ taglib prefix="article" uri="http://www.escenic.com/taglib/escenic-article" %>


<c:choose>
  <c:when test="${requestScope.widgetContent.fields.view.value == 'archive'}">

    <c:set var="utilCacheEnabled" value="${requestScope.widgetContent.fields.utilCacheEnabled.value}"/>
    <c:set var="cacheDuration" value="${fn:trim(requestScope.widgetContent.fields.cacheDuration.value)}"/>

    <c:if test="${empty cacheDuration}">
      <c:set var="cacheDuration" value="168"/>
    </c:if>

    <c:choose>
      <c:when test="${utilCacheEnabled}">
        <util:cache id="stories-${requestScope.widgetContent.fields.view.value}-${requestScope.widgetContent.id}"
                    expireTime="${cacheDuration}h">
          <article:expiresCache articleId="${requestScope.widgetContent.id}"/>
          <%-- call tm:view tag to render the appropraite view of the widget --%>
          <tm:view widgetName="stories"/>
        </util:cache>
      </c:when>

      <c:otherwise>
        <tm:view widgetName="stories"/>
      </c:otherwise>
    </c:choose>

  </c:when>
  <c:otherwise>
    <tm:view widgetName="stories"/>
  </c:otherwise>
</c:choose>
