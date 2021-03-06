<%--
 * File           : $Header: //depot/escenic/widget-framework/branches/1.10/widget-framework-core/src/main/webapp/template/common.jsp#1 $
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
<%@ taglib prefix="section" uri="http://www.escenic.com/taglib/escenic-section" %>
<%@ taglib prefix="article" uri="http://www.escenic.com/taglib/escenic-article" %>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core" %>

<c:set var="defaultWireFrame" value="${section.parameters['template.wireframe.markup.file']}"/>
<c:set var="isConfigSection"
       value="${fn:startsWith(section.uniqueName,'config') and (requestScope['com.escenic.context']=='sec')}"
       scope="request"/>
<c:set var="contentAreaName" value="contentArea" scope="request"/>

<c:choose>
  <c:when test="${not empty param['service']}">
    <c:set var="wireframe" value="${param['service']}"/>
  </c:when>
  <c:when test="${not empty param['widgetName']}">
    <c:set var="wireframe" value="widget"/>
  </c:when>
  <c:when test="${not empty defaultWireFrame}">
    <c:set var="wireframe" value="${defaultWireFrame}"/>
  </c:when>
  <c:otherwise>
    <c:set var="wireframe" value="default"/>
  </c:otherwise>
</c:choose>

<c:set var="skinName" value="${section.parameters['skin']}"/>
<c:if test="${empty skinName}">
  <c:set var="skinName" value="escenic-times"/>
</c:if>

<c:set var="templateUrl" value="${publication.url}template/framework/" scope="request"/>
<c:set var="resourceUrl" value="${publication.url}resources/" scope="request"/>
<c:set var="widgetUrl" value="${publication.url}template/widgets/" scope="request"/>
<c:set var="skinUrl" value="${publication.url}skins/${skinName}/" scope="request"/>
<c:set var="skinName" value="${skinName}" scope="request"/>

<wf-core:getDateString var="articleListDateString" hourDiff="${publication.features['article.list.age.max']}"/>

<%-- definitions of the config sections --%>
<section:use uniqueName="config">
  <c:set var="globalConfigSection" value="${section}" scope="request"/>
</section:use>
<c:choose>
  <c:when test="${isConfigSection}">
    <c:set var="sectionConfigSection" value="${section}" scope="request"/>
  </c:when>
  <c:otherwise>
    <wf-core:getConfigSection var="sectionConfigSection"/>
  </c:otherwise>
</c:choose>
<section:use uniqueName="config.section">
  <c:set var="globalSectionConfigSection" value="${section}" scope="request"/>
</section:use>
<section:use uniqueName="config.article.${section.uniqueName}">
  <c:set var="articleConfigSection" value="${section}" scope="request"/>
</section:use>
<section:use uniqueName="config.article">
  <c:set var="globalArticleConfigSection" value="${section}" scope="request"/>
</section:use>

<c:if test="${section.parent.uniqueName=='profile'}">
  <section:use uniqueName="config.section.profile">'
    <c:set var="profileConfigSection" value="${section}" scope="request"/>
  </section:use>
</c:if>

<c:if test="${requestScope['com.escenic.context']=='art'}">
  <section:use uniqueName="config.article.type.${article.articleTypeName}">
    <c:set var="articleConfigArticleType" value="${section}" scope="request"/>
  </section:use>

  <section:use uniqueName="config.article.${section.uniqueName}.type.${article.articleTypeName}">
    <c:set var="articleConfigArticleTypeSection" value="${section}" scope="request"/>
  </section:use>

  <c:if test="${not empty article.fields.specialArticleConfig.value and article.fields.specialArticleConfig.value != 'none'}">
    <section:use uniqueName="config.article.${section.uniqueName}.type.${article.articleTypeName}.${article.fields.specialArticleConfig.value}">
    	<c:set var="customArticleConfigSection" value="${section}" scope="request"/>
    </section:use>
  </c:if>

  <c:if test="${not empty article.fields.customConfigSection.value}">
    <section:use uniqueName="${article.fields.customConfigSection.value}">
      <c:set var="customArticleConfigSection" value="${section}" scope="request"/>
    </section:use>
  </c:if>
</c:if>

<jsp:forward page="framework/wireframe/${wireframe}.jsp"/>
