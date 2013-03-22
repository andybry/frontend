<%--
 * $Id:$
 * $URL:$
 *
 * This is the controller for the paginatedList view of list widget
--%>

<%@ page contentType="text/html; charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="collection" uri="http://www.escenic.com/taglib/escenic-collection" %>
<%@ taglib prefix="tm" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="article" uri="http://www.escenic.com/taglib/escenic-article" %>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core" %>

<%--create a map that will contain relevant field values --%>
<jsp:useBean id="stories" class="java.util.HashMap" scope="request"/>

<c:set target="${stories}" property="source"
       value="${fn:trim(requestScope.widgetContent.fields.sourcePaginatedList.value)}"/>

<c:set var="pageNumber" value="${fn:trim(param.pageNumber)}"/>
<c:if test="${empty pageNumber or pageNumber == 0}">
  <c:set var="pageNumber" value="1"/>
</c:if>

<c:set target="${stories}" property="firstPageLength"
       value="${requestScope.widgetContent.fields.numberOfFirstPageItemsPaginatedList.value}"/>
<c:set target="${stories}" property="restPageLength"
       value="${requestScope.widgetContent.fields.numberOfOtherPageItemsPaginatedList.value}"/>

<c:choose>
  <c:when test="${pageNumber eq '1'}">
    <c:set var="pageLength" value="${stories.firstPageLength}"/>
    <c:set var="startIndex" value="0"/>
  </c:when>
  <c:otherwise>
    <c:set var="pageLength" value="${stories.restPageLength}"/>
    <c:set var="startIndex" value="${stories.firstPageLength + (pageNumber - 2) * pageLength}"/>
  </c:otherwise>
</c:choose>


<c:set target="${stories}" property="begin" value="${startIndex}"/>
<c:set target="${stories}" property="numberOfItems" value="${pageLength}"/>

<jsp:include page="helpers/getArticles.jsp">
  <jsp:param name="widgetContentId" value="${requestScope.widgetContent.id}"/>
</jsp:include>


<c:set target="${stories}" property="showComments"
       value="${fn:trim(requestScope.widgetContent.fields.showCommentsPaginatedList.value)}"/>
<c:set target="${stories}" property="numberOfPageLinks"
       value="${requestScope.widgetContent.fields.numberOfPageLinksPaginatedList.value}"/>
<c:set target="${stories}" property="showIcons"
       value="${fn:trim(requestScope.widgetContent.fields.showIconsPaginatedList.value)}"/>
<c:set target="${stories}" property="showLeadText"
       value="${fn:trim(requestScope.widgetContent.fields.showLeadTextPaginatedList.value)}"/>
<c:set target="${stories}" property="dateType"
       value="${fn:trim(requestScope.widgetContent.fields.dateTypePaginatedList.value)}"/>
<c:set var="imageVersion" value="${fn:trim(requestScope.widgetContent.fields.imageVersionPaginatedList.value)}"/>
<c:if test="${empty imageVersion}">
  <c:set var="imageVersion" value="s148"/>
</c:if>
<c:set target="${stories}" property="imageVersion" value="${imageVersion}"/>

<c:set var="firstArticleImageVersion" value="${fn:trim(requestScope.widgetContent.fields.firstImageVersionPaginatedList.value)}"/>
<c:if test="${empty firstArticleImageVersion}">
  <c:set var="firstArticleImageVersion" value="s338b"/>
</c:if>
<c:set target="${stories}" property="firstArticleImageVersion" value="${firstArticleImageVersion}"/>

<c:set var="dateFormatPaginatedList" value="${fn:trim(requestScope.widgetContent.fields.dateFormatPaginatedList)}"/>
<c:if test="${empty dateFormatPaginatedList}">
  <c:set var="dateFormatPaginatedList" value="dd-MM-yyyy"/>
</c:if>
<c:set target="${stories}" property="dateFormat" value="${dateFormatPaginatedList}"/>

<c:set var="numberOfPages" value="${stories.pageLength}"/>

<c:set var="pageCount" value="1"/>

<c:if test="${stories.firstPageLength < stories.resultCount}">
  <c:set var="restPageCount" value="${(stories.resultCount - stories.firstPageLength) / stories.restPageLength}"/>
  <c:set var="restPageCountMod" value="${(stories.resultCount - stories.firstPageLength) % stories.restPageLength}"/>
  <c:if test="${restPageCountMod > 0 
      && ((restPageCount * stories.restPageLength) < (stories.resultCount - stories.firstPageLength))}">
    <c:set var="restPageCount" value="${restPageCount+1}"/>
  </c:if>
  <c:set var="pageCount" value="${pageCount + restPageCount}"/>
</c:if>

<c:set var="numberOfPages" value="${pageCount}"/>

<c:set target="${stories}" property="numberOfPages" value="${numberOfPages + 0}"/>
<c:set target="${stories}" property="numberOfPageLinks" value="${stories.numberOfPageLinks + 0}"/>
<c:set target="${stories}" property="pageLength" value="${pageLength + 0}"/>
<c:set target="${stories}" property="currentPageNumber" value="${pageNumber + 0}"/>

<wf-core:getPaginationRange numberOfPages="${stories.numberOfPages}"
                            currentPageNumber="${stories.currentPageNumber}"
                            numberOfPageLinks="${stories.numberOfPageLinks}"/>
<c:set target="${stories}" property="beginPageNumber" value="${requestScope.beginPageNumber}"/>
<c:set target="${stories}" property="endPageNumber" value="${requestScope.endPageNumber}"/>

<jsp:include page="helpers/calculateViewModel.jsp" />

<%-- 
  calculate pagination variables 
--%>
<c:set target="${stories}" property="showPagination" value="${stories.numberOfPages > 1}" />
<c:set target="${stories}" property="showLeftPaginationButton" value="${stories.currentPageNumber > 1}" />
<c:set target="${stories}" property="leftPaginationHref" value="?pageNumber=${stories.currentPageNumber - 1}" />
<c:set target="${stories}" property="leftPageLinkText" value="Previous" />
<c:set target="${stories}" property="showRightPaginationButton" value="${stories.currentPageNumber < stories.numberOfPages}" />
<c:set target="${stories}" property="rightPaginationHref" value="?pageNumber=${stories.currentPageNumber + 1}" />
<c:set target="${stories}" property="rightPageLinkText" value="Next" />
