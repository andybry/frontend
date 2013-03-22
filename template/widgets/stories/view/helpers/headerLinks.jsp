<%--
 * $Id:$
 * $URL:$
 *
 * This page shows various links related with the stories widget as related heeader links
 * just below the header or widget title of the widget
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- The requires the following attributes in the requestScope --%>
<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>

<c:if test="${not empty stories.headerLinksList}">
  <ul class="tools clearfix">
    <c:forEach var="link" items="${stories.headerLinksList}" varStatus="loopCount">
      <c:if test="${loopCount.index == fn:length(stories.headerLinksList)}">
        <c:set var="styleClass" value="last"/>
      </c:if>
      <li class="${styleClass}">
        <a class="more" href="${link.linkUrl}">${link.linkTitle}</a>
      </li>
    </c:forEach>
  </ul>
</c:if>
