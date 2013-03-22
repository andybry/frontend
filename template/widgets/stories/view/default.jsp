<%--
 * File           : $Header: //depot/escenic/widget-framework/branches/1.10/widget-core-stories/src/main/webapp/template/widgets/stories/view/default.jsp#2 $
 * Last edited by : $Author: andrew.bryant $ $Date: 2013-03-07 23:01:58 +0000 (Thu, 07 Mar 2013) $
 * Version        : $Revision: 9217 $
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

  <%-- header --%>
  <c:if test="${stories.showWidgetTitle}">
    <jsp:include page="helpers/widgetTitle.jsp"/>
  </c:if>



  <%-- articles --%>
  <c:forEach var="articleMap" items="${stories.articleMaps}" varStatus="status">

    <div class="article ${articleMap.articleTypeName} ${status.first ? 'first' : ''} ${articleMap.teaserOption} ${articleMap.inpageDnDSummaryClass}">
      
      <div class="media ${articleMap.articleTypeName}">

        <%-- show the top picture helper here if the image position is set to top --%>
 
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

        <h${stories.headingSize}>
          <a href="${articleMap.url}" class="${articleMap.inpageTitleClass}">
            ${articleMap.title}
          </a>
        </h${stories.headingSize}>

      </div>

      <div class="text">
        
        <p class="summary">

          <c:if test="${articleMap.showImage and stories.imagePosition != 'top'}">
            <a href="${articleMap.url}">
              <img src="${articleMap.imageMap.url}"
               class="${stories.imagePosition} ${articleMap.imageMap.inpageStyleClass}"
               alt="${articleMap.imageMap.alttext}"
               title="${articleMap.imageMap.caption}"
               width="${articleMap.imageMap.width}"
               height="${articleMap.imageMap.height}"
              />
            </a>

          </c:if>


          <span class="${articleMap.inpageLeadtextClass}"><c:out value="${articleMap.intro}" escapeXml="true"/></span>
        </p>

      </div>
    </div>
  </c:forEach>
</div>
<%-- new output code end --%>

<c:remove var="stories" scope="request"/>
