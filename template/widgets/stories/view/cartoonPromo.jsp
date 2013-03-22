<%--
 * File           : $Header: //depot/escenic/widget-framework/branches/1.10/widget-core-stories/src/main/webapp/template/widgets/stories/view/default.jsp#2 $
 * Last edited by : $Author: andrew.bryant $ $Date: 2013-03-11 14:43:10 +0000 (Mon, 11 Mar 2013) $
 * Version        : $Revision: 9316 $
 *
 * Copyright (C) 2009 Escenic AS.
 * All Rights Reserved.  No use, copying or distribution of this
 * work may be made except in accordance with a valid license
 * agreement from Escenic AS.  This notice must be included on
 * all copies, modifications and derivatives of this work.
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="article" uri="http://www.escenic.com/taglib/escenic-article" %>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core" %>
<%@ taglib prefix="tm" tagdir="/WEB-INF/tags" %>

<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>

<div class="${stories.wrapperStyleClass} ${stories.inpageDnDAreaClass}"
  <c:if test="${not empty stories.styleId}">id="${stories.styleId}"</c:if>>

  <%-- articles --%>
  <c:forEach var="articleMap" items="${stories.articleMaps}" varStatus="status">

    <div class="sm-promo-list">

      <%-- header (inside the article? - [sic], same query for the sm-promo-list class) --%>
      <c:if test="${stories.showSectionTitle and stories.selectSectionName == 'current'}">
        <div class="header">
          <h${stories.headingSize}><a href="${stories.sectionUrl}"><c:out value="${stories.sectionName}" escapeXml="true"/></a>
		  <span class="heading-end"><a href="${articleMap.url}"><c:out value="${stories.subSectionName}" escapeXml="true"/></a></span></h${stories.headingSize}>
        </div>
      </c:if>

      <%-- top picture (if image present and position is set to top) --%>
      <c:if test="${articleMap.showImage and stories.imagePosition == 'top'}">
        <a href="${articleMap.url}">
          <img src="${articleMap.imageMap.url}"
           class="${stories.imagePosition} ${articleMap.imageMap.inpageStyleClass}"
           alt="${articleMap.imageMap.alttext}"
           title="${articleMap.imageMap.caption}"
           width="${articleMap.imageMap.width}"
           height="${articleMap.imageMap.height}"
           <c:if test="${articleMap.imageMap.showPictureCaption}">
           rel="${articleMap.imageMap.captionDivId}"
           </c:if>
          />
        </a>

        <c:if test="${articleMap.imageMap.showPictureCaption}">

          <div id="${articleMap.imageMap.captionDivId}" style="display:none;">
            <p><c:out value="${articleMap.imageMap.caption}" escapeXml="true"/></p>
          </div>
 
        </c:if>

      </c:if>
      
      <%-- normal picture (if image present and position is not set to top) --%>
      <c:if test="${articleMap.showImage and stories.imagePosition != 'top'}">
        <a href="${articleMap.url}">
          <img src="${articleMap.imageMap.url}"
            width="${articleMap.imageMap.width}"
            height="${articleMap.imageMap.height}"
            alt="<c:out value='${articleMap.imageMap.alttext}' escapeXml='true'/>"
            />
        </a>

      </c:if>

    </div>
 
  </c:forEach>

</div>

<jsp:include page="helpers/renderViewMoreLink.jsp" />

<c:remove var="stories" scope="request"/>
