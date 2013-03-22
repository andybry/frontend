<%--
 * $Id:$
 * $URL:$
 *
 * The purpose of this page is to show widget title as a headline at the top of the widget
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.escenic.com/taglib/escenic-section" prefix="section" %>
<%@ taglib prefix="article" uri="http://www.escenic.com/taglib/escenic-article" %>
<%@ taglib prefix="collection" uri="http://www.escenic.com/taglib/escenic-collection" %>

<%-- The requires the following attributes in the requestScope --%>
<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>

<c:if test="${stories.showWidgetTitle == 'true'}">
  <h${stories.widgetTitleSize} class="${stories.widgetTitleStyleClass}">
    <c:choose>
      <c:when test="${stories.widgetTitleBehaviour == 'nolink'}">
        <c:out value="${stories.title}"/>
      </c:when>
      <c:otherwise>
        <a href="${stories.widgetTitleUrl}">
          <c:out value="${stories.title}"/>
        </a>
      </c:otherwise>
    </c:choose>
  </h${stories.widgetTitleSize}>
</c:if>

<c:if test="${not empty stories.widgetRelatedImageMap}">
  <c:choose>
    <c:when test="${stories.widgetTitleBehaviour == 'nolink'}">
      <img src="${stories.widgetRelatedImageMap.url}"
           alt="<c:out value='${stories.widgetRelatedImageMap.alttext}' escapeXml='true'/>"
           class="${stories.widgetRelatedImageMap.inpageStyleClass}"
           title="<c:out value='${stories.widgetRelatedImageMap.caption}' escapeXml='true'/>"
           width="${stories.widgetRelatedImageMap.width}"
           height="${stories.widgetRelatedImageMap.height}"/>
    </c:when>
    <c:otherwise>
      <a href="${stories.widgetTitleUrl}">
        <img src="${stories.widgetRelatedImageMap.url}"
             alt="<c:out value='${stories.widgetRelatedImageMap.alttext}' escapeXml='true'/>"
             class="${stories.widgetRelatedImageMap.inpageStyleClass}"
             title="<c:out value='${stories.widgetRelatedImageMap.caption}' escapeXml='true'/>"
             width="${stories.widgetRelatedImageMap.width}"
             height="${stories.widgetRelatedImageMap.height}"/>
      </a>
    </c:otherwise>
  </c:choose>
</c:if>
