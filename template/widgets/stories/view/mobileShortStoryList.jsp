<%--
 * File           : $Header: //depot/escenic/widget-framework/branches/1.10/widget-core-stories/src/main/webapp/template/widgets/stories/view/topstory.jsp#2 $
 * Last edited by : $Author: fmshaon $ $Date: 2011-12-07 05:48:44 +0200 (Wed, 07 Dec 2011) $
 * Version        : $Revision: 1939 $
 *
 * Copyright (C) 2009 Escenic AS.
 * All Rights Reserved.  No use, copying or distribution of this
 * work may be made except in accordance with a valid license
 * agreement from Escenic AS.  This notice must be included on
 * all copies, modifications and derivatives of this work.
--%>
<%@ page language="java" pageEncoding="UTF-8"
  contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="article" uri="http://www.escenic.com/taglib/escenic-article"%>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core"%>
<%@ taglib prefix="section" uri="http://www.escenic.com/taglib/escenic-section" %>
<%@ taglib prefix="tm" tagdir="/WEB-INF/tags" %>

<jsp:useBean id="stories" type="java.util.HashMap" scope="request" />

<c:if test="${stories.hasArticles}">

  <div
    class="${stories.wrapperStyleClass} ${stories.inpageDnDAreaClass}"
    <c:if test="${not empty stories.styleId}">id="${stories.styleId}"</c:if>>

    <%-- header if present (probably not used) --%>
    <c:if test="${stories.showFirstHeader}">
      <div class="header">
        <h5>
          <c:out value="${stories.firstHeaderText}" escapeXml="true" />
        </h5>
      </div>
    </c:if>

    <%-- second header if present --%>
    <c:if test="${stories.showSecondHeader}">
      <div class="hdr-div">
        <a class="hdr-link" href="${stories.secondHeaderUrl}">${stories.secondHeaderText}</a>
      </div>
    </c:if>

    <%-- articles --%>
    <ul class="list">
      <c:forEach var="articleMap" items="${stories.articleMaps}" varStatus="status">
        <li class="${status.first ? 'top-item' : 'item'}">
          <c:if test="${status.first and articleMap.showImage}">
            <a href="${articleMap.url}" class="thumb-transcode-x-link"><img src="${articleMap.imageMap.url}"
                  alt="${articleMap.imageMap.alttext}"
                  title="${articleMap.imageMap.caption}"
                  class="thumb-transcode stories-mobileShortStoryList-topPicture"
              /></a>
          </c:if>
          <a href="${articleMap.url}" class="link">
            ${articleMap.title}
          </a>
        </li>
      </c:forEach>
    </ul>

  </div>
</c:if>

<c:remove var="stories" scope="request" />
