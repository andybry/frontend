<%--
 * File           : $Header: //depot/escenic/widget-framework/branches/1.10/widget-core-stories/src/main/webapp/template/widgets/stories/controller/default.jsp#1 $
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
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="article" uri="http://www.escenic.com/taglib/escenic-article" %>
<%@ taglib uri="http://www.escenic.com/taglib/escenic-section" prefix="section" %>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core" %>
<%@ taglib prefix="collection" uri="http://www.escenic.com/taglib/escenic-collection" %>
<%@ taglib prefix="elfn" uri="ELFunctionTagLibrary" %>

<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>

<c:set target="${stories}" property="source" value="${fn:trim(widgetContent.fields.sourceHoroscope.value)}"/>
<c:set target="${stories}" property="showSectionTitle" value="${fn:trim(widgetContent.fields.showSectionTitleHoroscope.value)}"/>
<c:set target="${stories}" property="selectSectionNameHoroscope"
       value="${fn:trim(widgetContent.fields.selectSectionNameHoroscope.value)}"/>
<c:set target="${stories}" property="contentType" value="${fn:trim(widgetContent.fields.contentType.value)}"/>

<c:set target="${stories}" property="begin" value="${fn:trim(widgetContent.fields.beginHoroscope.value) - 1}"/>
<c:set target="${stories}" property="numberOfItems" value="${fn:trim(widgetContent.fields.numberOfItemsHoroscope.value)}"/>

<c:set target="${stories}" property="maxCharacters" value="${fn:trim(widgetContent.fields.maxCharactersHoroscope.value)}" />
<c:set target="${stories}" property="headingSize" value="${fn:trim(widgetContent.fields.headingSizeHoroscope.value)}" />
<c:set target="${stories}" property="showComments" value="${fn:trim(widgetContent.fields.showCommentsDefault.value)}" />

<c:set target="${stories}" property="url" value="${stories.sectionUrl}${fn:substringBefore(widgetContent.fields.groupName.value,'_')}" />

<jsp:include page="helpers/getArticles.jsp"/>
<%--Static arraylist for all the signs --%>
<collection:createList id="signs" type="java.util.ArrayList"/>
  <collection:add collection="${signs}" value="aries"/>
  <collection:add collection="${signs}" value="taurus"/>
  <collection:add collection="${signs}" value="gemini"/>
  <collection:add collection="${signs}" value="cancer"/>
  <collection:add collection="${signs}" value="leo"/>
  <collection:add collection="${signs}" value="virgo"/>
  <collection:add collection="${signs}" value="libra"/>
  <collection:add collection="${signs}" value="scorpio"/>
  <collection:add collection="${signs}" value="sagittarius"/>
  <collection:add collection="${signs}" value="capricorn"/>
  <collection:add collection="${signs}" value="aquarius"/>
  <collection:add collection="${signs}" value="pisces"/>

<%-- Create collection(Arraylist) of object(HashMap) which stores data for each horoscope sign --%>
<collection:createList id="resultList" type="java.util.ArrayList"/>

<c:forEach var="item" items="${stories.articles}" varStatus="status">
  <c:set target="${stories}" property="ukPhoneRates" value="${item.content.fields.ukPhoneRates}" />
  <c:set target="${stories}" property="roiPhoneRates" value="${item.content.fields.roiPhoneRates}" />
  <c:forEach var="sign" items="${signs}" varStatus="status">
    <collection:createMap id="map" type="java.util.HashMap"/>
    <c:set var="signTitle" value="title_${sign}"/>
    <c:set var="signBody" value="body_${sign}"/>
    <c:set var="signDateRange" value="dateRange_${sign}"/>
    <c:set var="signUKNumber" value="ukNumber_${sign}"/>
    <c:set var="signROINumber" value="roiNumber_${sign}"/>
    
    <c:set target="${map}" property="title"> 
      <c:out value="${item.content.fields[signTitle]}" />
    </c:set> 
    <c:set target="${map}" property="body"> 
      <c:out value="${elfn:truncateToWords(item.content.fields[signBody],0,stories.maxCharacters)}" />
    </c:set> 
    <c:set target="${map}" property="dateRange"> 
      <c:out value="${item.content.fields[signDateRange]}" />
    </c:set>
    <c:set target="${map}" property="ukNumber"> 
      <c:out value="${item.content.fields[signUKNumber]}" />
    </c:set>
    <c:set target="${map}" property="roiNumber"> 
      <c:out value="${item.content.fields[signROINumber]}" />
    </c:set>
    <collection:add collection="${resultList}" value="${map}"/>
  </c:forEach>
</c:forEach>

<c:set target="${stories}" property="resultList" value="${resultList}" />
<c:remove var="signs" scope="request"/>

<%-- remove the fields that can't be serialised --%>
<c:set target="${stories}" property="articles" value="" />
