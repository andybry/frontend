 <%--
 * File           : $Header: //depot/escenic/widget-framework/branches/1.10/widget-core-stories/src/main/webapp/template/widgets/stories/view/default.jsp#2 $
 * Last edited by : $Author: andrew.bryant $ $Date: 2013-02-23 18:51:53 +0000 (Sat, 23 Feb 2013) $
 * Version        : $Revision: 8931 $
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

<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>

<c:forEach var="map" items="${stories.resultList}" varStatus="status">
  <div class="article sm-horoscopes-teaser clearfix">
    <div class="smht-pic">
      <a class="ir teaser-${fn:toLowerCase(map.title)}" href="${stories.url}/${fn:toLowerCase(map.title)}/">${map.title}</a>
    </div>
    <div class="smht-text">
      <h2>
        <a href="${stories.url}/${fn:toLowerCase(map.title)}/">${map.title}</a>
      </h2>
      <p>${map.dateRange}</p>
      <p>${map.body}...</p>
      <p>
        <a href="tel:${map.ukNumber}">UK ${map.ukNumber}</a> <span class="small">${stories.ukPhoneRates}</span><br />
        <a href="tel:${map.roiNumber}">ROI ${map.roiNumber}</a> <span class="small">${stories.roiPhoneRates}</span>
      </p>
    </div>
  </div>
</c:forEach>

<jsp:include page="helpers/renderViewMoreLink.jsp" />

<c:remove var="stories" />
