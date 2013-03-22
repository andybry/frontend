<%--
 * File           : $Header: //depot/escenic/widget-framework/branches/1.10/widget-core-stories/src/main/webapp/template/widgets/stories/view/headline.jsp#2 $
 * Last edited by : $Author$ $Date$
 * Version        : $Revision$
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
<%@ taglib prefix="article" uri="http://www.escenic.com/taglib/escenic-article" %>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core" %>
<%@ taglib prefix="tm" tagdir="/WEB-INF/tags" %>

<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>

<div class="${stories.wrapperStyleClass} ${stories.inpageDnDAreaClass}"
     <c:if test="${not empty stories.styleId}">id="${stories.styleId}"</c:if>>
 
  <%-- header --%>
  <c:if test="${stories.showWidgetTitle}">
    <jsp:include page="helpers/widgetTitle.jsp"/>
  </c:if>

  <%-- stories --%>
  <ul class="headline-teaser">
    <c:forEach var="articleMap" items="${stories.articleMaps}" varStatus="status">
      <li class="${articleMap.imageHeavy ? 'gallery' : ''} ${articleMap.video ? 'video' : ''} ${status.last ? stories.lastItemStyleClass : ''}">

        <%-- topic (if present) --%>
        <c:if test="${not empty articleMap.topicMap}">
          <c:if test="${not empty articleMap.topicMap.url}">
            <a href="${articleMap.topicMap.url}">
          </c:if>
          <em>${articleMap.topicMap.title}</em>
          <c:if test="${not empty articleMap.topicMap.url}">
            </a>
          </c:if>
        </c:if>

        <%-- the link to the article --%>
        <a href="${articleMap.url}">${articleMap.title}</a>
      </li>
    </c:forEach>
  </ul>

</div>

<jsp:include page="helpers/renderViewMoreLink.jsp" />

<c:remove var="stories" scope="request"/>
