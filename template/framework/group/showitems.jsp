<%--
 * File           : $Header: //depot/escenic/widget-framework/branches/1.10/widget-framework-core/src/main/webapp/template/framework/group/showitems.jsp#1 $
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

<%-- the page expects the following attributes in the requestScope --%>
<jsp:useBean id="level" type="java.lang.String" scope="request" />

<c:choose>
  <c:when test="${not empty section.parameters['nesting.limit']}">
    <c:set var="nestingLimit" value="${section.parameters['nesting.limit']}"/>
  </c:when>
  <c:otherwise>
    <c:set var="nestingLimit" value="10"/>
  </c:otherwise>
</c:choose>

<c:choose>
  <c:when test="${(level+0) <= (nestingLimit+0)}">   <%-- making sure that EL conputes this as an Integer operation --%>
    <c:set var="level" value="${level+1}"/>
    <c:forEach var="item" items="${items}">
      <c:choose>

        <%-- if the item is a group delegate to the corresponding group template --%>
        <c:when test="${not empty item.areas}">
          <c:set var="areas" value="${requestScope.areas}" scope="page"/>
          <c:set var="areas" value="${item.areas}" scope="request"/>
          <jsp:include page="${item.type}.jsp"/>
          <c:set var="areas" value="${pageScope.areas}" scope="request"/>
        </c:when>

        <%-- if the item is an summary and a widget output it (go to the widgets index page) --%>
        <c:when test="${fn:startsWith(item.type,'widget_')}">
          <c:set var="element" value="${item}" scope="request"/>
          <jsp:include page="../element/ats.jsp"/>
        </c:when>

        <c:otherwise>
          <h2 class="error">
            <fmt:message key="page.options.error.message" />
          </h2>
        </c:otherwise>

      </c:choose>
    </c:forEach>
    <c:remove var="items" scope="request" />
  </c:when>
  <c:otherwise>
    <p>
      <fmt:message key="nesting.limit.error.message">
        <fmt:param value="${nestingLimit}" />
        <fmt:param value="${level}" />
      </fmt:message>
    </p>
  </c:otherwise>
</c:choose>
