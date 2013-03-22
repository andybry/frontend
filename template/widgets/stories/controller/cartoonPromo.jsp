<%--
 * File           : $Header: //depot/escenic/widget-framework/branches/1.10/widget-core-stories/src/main/webapp/template/widgets/stories/controller/default.jsp#1 $
 * Last edited by : $Author: andrew.bryant $ $Date: 2013-02-23 17:02:17 +0000 (Sat, 23 Feb 2013) $
 * Version        : $Revision: 8929 $
 *
 * Copyright (C) 2009 Escenic AS.
 * All Rights Reserved.  No use, copying or distribution of this
 * work may be made except in accordance with a valid license
 * agreement from Escenic AS.  This notice must be included on
 * all copies, modifications and derivatives of this work.
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="article" uri="http://www.escenic.com/taglib/escenic-article" %>
<%@ taglib uri="http://www.escenic.com/taglib/escenic-section" prefix="section" %>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core" %>

<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>

<c:set target="${stories}" property="source" value="${fn:trim(widgetContent.fields.sourceCartoonPromo.value)}"/>
<c:set target="${stories}" property="showSectionTitle" value="${fn:trim(widgetContent.fields.showSectionTitleCartoonPromo.value)}"/>
<c:set target="${stories}" property="subSectionName" value="${fn:trim(widgetContent.fields.subSectionName.value)}"/>

<c:set target="${stories}" property="selectSectionName"
       value="${fn:trim(widgetContent.fields.selectSectionNameCartoonPromo.value)}"/>

<c:set target="${stories}" property="begin" value="${fn:trim(widgetContent.fields.beginCartoonPromo.value) - 1}"/>
<c:set target="${stories}" property="numberOfItems" value="${fn:trim(widgetContent.fields.numberOfItemsCartoonPromo.value)}"/>

<jsp:include page="helpers/getArticles.jsp"/>

<c:set target="${stories}" property="headingSize" value="${fn:trim(widgetContent.fields.headingSizeCartoonPromo.value)}" />
<c:set target="${stories}" property="imagePosition" value="${fn:trim(widgetContent.fields.imagePositionCartoonPromo.value)}" />

<c:if test="${stories.imagePosition == 'top'}">
  <wf-core:getImageRepresentation var="correctImageVersion" prefferedWidth="${requestScope.elementwidth}"/>
  <c:set target="${stories}" property="imageVersion" value="${correctImageVersion}"/>
  <c:remove var="correctImageVersion" scope="request"/>
</c:if>

<jsp:include page="helpers/calculateViewModel.jsp" />
