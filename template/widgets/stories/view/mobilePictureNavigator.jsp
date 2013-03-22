<%--
 * File           : $Header: //depot/escenic/widget-framework/branches/1.10/widget-core-stories/src/main/webapp/template/widgets/stories/view/mediumTeaser.jsp#1 $
 * Last edited by : $Author: asm $ $Date: 2011/09/08 $
 * Version        : $Revision: #2 $
 *
 * Copyright (C) 2009 Escenic AS.
 * All Rights Reserved.  No use, copying or distribution of this
 * work may be made except in accordance with a valid license
 * agreement from Escenic AS.  This notice must be included on
 * all copies, modifications and derivatives of this work.
--%>
<%@ page language="java" pageEncoding="UTF-8" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="article" uri="http://www.escenic.com/taglib/escenic-article" %>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core" %>
<%@ taglib prefix="tm" tagdir="/WEB-INF/tags" %>

<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>

<c:if test="${stories.hasArticles}">
  <div id="top-stories" class="flick-gallery-container">
  
    <%-- flick gallery images --%>
    <div id="image-flick-gallery" class="flick-gallery">
      <c:forEach var="articleMap" items="${stories.articleMaps}" varStatus="status" end="2">
        <a class="flick-gallery-image-x-link" href="${articleMap.url}">
          <img alt="${articleMap.title}" class="flick-gallery-image" 
            style="position: absolute; left: -490px;" src="${articleMap.imageMap.url}"/>
        </a>
      </c:forEach>
    </div>
  
    <%-- flick gallery messages --%>
    <div id="image-flick-gallery-message">
      <c:forEach var="articleMap" items="${stories.articleMaps}" varStatus="status" end="2">
        <a href="${articleMap.url}">
          ${articleMap.title}
        </a>
      </c:forEach>
    </div>
  
    <%-- navigation (we need to put the images in our CSS) --%>
    <div class="flick-gallery-table-holder">
      <table class="miq-flick-gallery-navigation">
        <tbody>
          <tr>
            <td>
              <img id="image-flick-gallery-previous" src="http://tmg.cdn.mobileiq.mobi/ms/i/tmg/4003033/fix" alt="Image">
            </td>
            <td>
              <div class="flick-gallery-indicators"></div>
            </td>
            <td class="miq-align-middle-right">
              <img id="image-flick-gallery-next" src="http://tmg.cdn.mobileiq.mobi/ms/i/tmg/4003034/fix" alt="Image">
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <div class="separator"></div>
  
  </div>

  <noscript>
    <div id="top-stories-no-script" class="flick-gallery-container">
      <div id="image-flick-gallery-message">
        <c:forEach var="articleMap" items="${stories.articleMaps}" varStatus="status" end="2">
          <a class="flick-gallery-image-no-script-x-link" href="${articleMap.url}">
            <img alt="${articleMap.title}" class="flick-gallery-image-no-script" src="${articleMap.imageMap.url}"/>
          </a>
        </c:forEach>
      </div>
    </div>

    <div>
      <div class="noscript-flick-gallery-indicators">
        <table class="gallery-nav-table">
          <tr>
            <td class="gallery-nav-table-prev-td"><a class="noscript-gallery-nav" href="?image3=1">prev</a></td>
            <td align="center">1/3</td>
            <td align="right" class="gallery-nav-table-next-td"><a class="noscript-gallery-nav?image2=1">next</a></td>
          </tr>
        </table>
      </div>
    </div>
  </noscript>
  
</c:if>

<jsp:include page="helpers/renderViewMoreLink.jsp" />

<c:remove var="stories" scope="request"/>
