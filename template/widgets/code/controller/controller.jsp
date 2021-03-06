<%--
 * File           : $Header: //depot/escenic/widget-framework/branches/1.10/widget-core-code/src/main/webapp/template/widgets/code/controller/controller.jsp#1 $
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

<%-- create the map that will contain relevant field values--%>
<jsp:useBean id="code" class="java.util.HashMap" scope="request"/>

<%--read fields that affects all views --%>
<c:set target="${code}" property="view" value="${fn:trim(widgetContent.fields.view.value)}"/>
<c:set target="${code}" property="styleId" value="${fn:trim(widgetContent.fields.styleId.value)}"/>
<c:set target="${code}" property="customStyleClass" value="${fn:trim(widgetContent.fields.customStyleClass)}"/>
<c:set target="${code}" property="showDiv" value="${fn:trim(widgetContent.fields.showDiv.value)}"/>
<c:set var="noPrint" value="${fn:trim(widgetContent.fields.noPrint.value)}"/>
<c:set target="${code}" property="wrapperStyleClass">widget code ${code.view} widget-editable viziwyg-section-${widgetContent.homeSection.id} inpage-widget-${widgetContent.id}<c:if test="${noPrint=='true'}"> noPrint</c:if><c:if test="${not empty code.customStyleClass}"> ${code.customStyleClass}</c:if></c:set>