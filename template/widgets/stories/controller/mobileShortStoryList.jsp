<%--
 * File           : $Header: //depot/escenic/widget-framework/branches/1.10/widget-core-logo/src/main/webapp/template/widgets/stories/controller/shortStoryListMobile.jsp#1 $
 * Last edited by : $Author: james.knowling $ $Date: 2012-05-20 22:28:28 +0300 (Sun, 20 May 2012) $
 * Version        : $Revision: 3789 $
 *
 * Copyright (C) 2010 Escenic AS.
 * All Rights Reserved.  No use, copying or distribution of this
 * work may be made except in accordance with a valid license
 * agreement from Escenic AS.  This notice must be included on
 * all copies, modifications and derivatives of this work.
--%>

<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%--JSLT related important tags--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%-- create the map that will contain relevant field values --%>
<jsp:useBean id="controller" class="uk.co.trinitymirror.widgets.stories.ShortStoryListMobileController" scope="page"/>
<jsp:useBean id="stories" class="java.util.HashMap" scope="request"/>
<jsp:setProperty property="request" name="controller" value="${pageContext.request}"/>
<jsp:setProperty property="response" name="controller" value="${pageContext.response}"/>
<jsp:setProperty property="viewContent" name="controller" value="${stories}"/>
<c:set var="stories" scope="request" value="${controller.viewContent}"/>

<jsp:include page="helpers/calculateViewModel.jsp" />

<%-- first header (this view has 3 headers, which are not compatible, and they can more than one of which can show,
in practice though I don't think the first one is used) --%>
<c:set target="${stories}" property="showFirstHeader" value="${stories.showSectionTitle and stories.selectSectionName == 'current'}" />
<c:set target="${stories}" property="firstHeaderText" value="${empty stories.headerText ? stories.sectionName : stories.headerText}" />

<%-- second header --%>
<c:set target="${stories}" property="showSecondHeader" value="${stories.showSectionTitleAsLink}" />
<c:if test="${stories.showSecondHeader}">
  <c:choose>
    <c:when test="${not empty stories.sectionForHeader}">
      <section:use uniqueName="${stories.sectionForHeader}">
        <c:set target="${stories}" property="secondHeaderUrl" value="${section.url}" />
        <c:set target="${stories}" property="secondHeaderText" value="${empty stories.headerText ? fn:toUpperCase(stories.sectionForHeader) : fn:toUpperCase(stories.headerText)}" />
      </section:use>
    </c:when>
    <c:when test="${not empty stories.topicForHeader}">
      <c:set target="${stories}" property="escapedTopicForHeader"><c:out value="${stories.topicForHeader}" /></c:set>
      <c:set target="${stories}" property="secondHeaderUrl" value="${publication.url}${requestScope['com.escenic.framework.topic.pattern.uri']}/${stories.escapedTopicForHeader}" />
      <c:set target="${stories}" property="secondHeaderText" value="${empty stories.headerText ? fn:toUpperCase(stories.topicForHeader) : fn:toUpperCase(stories.headerText)}" />
    </c:when>
    <c:when test="${stories.showSectionTitle and stories.selectSectionName == 'first' and stories.hasArticles}">
      <c:set target="${stories}" property="secondHeaderUrl" value="${stories.articleMaps[0].homeSectionUrl}" />
      <c:set target="${stories}" property="secondHeaderText" value="${empty stories.headerText ? stories.articleMaps[0].homeSection.name : stories.headerText}" />
    </c:when>
    <c:otherwise>
      <c:set target="${stories}" property="secondHeaderUrl" value="${stories.sectionUrl}" />
      <c:set target="${stories}" property="secondHeaderText" value="${empty stories.headerText ? fn:toUpperCase(stories.sectionName) : fn:toUpperCase(stories.headerText)}" />
    </c:otherwise>
  </c:choose>
</c:if>


