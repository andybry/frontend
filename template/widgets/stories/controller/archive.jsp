<%--
 * $Id:$
 * $URL:$
 *
 * This is the controller for the largeTeaser view of stories widget
--%>

<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="article" uri="http://www.escenic.com/taglib/escenic-article" %>
<%@ taglib prefix="section" uri="http://www.escenic.com/taglib/escenic-section" %>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core" %>
<%@ taglib prefix="tm" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>


<c:set var="pageNumber" value="${fn:trim(param.pageNumber)}"/>
<c:if test="${empty pageNumber or pageNumber == 0}">
  <c:set var="pageNumber" value="1"/>
</c:if>

<c:set target="${stories}" property="pageLength"
       value="${requestScope.widgetContent.fields.numberOfItemsArchive.value}"/>


<c:set var="pageLength" value="${stories.pageLength}"/>
<c:set var="startIndex" value="${stories.pageLength + (pageNumber - 2) * pageLength}"/>


<c:set target="${stories}" property="begin" value="${startIndex}"/>
<c:set target="${stories}" property="numberOfItems" value="${pageLength}"/>


<c:set target="${stories}" property="dateType"
       value="${fn:trim(requestScope.widgetContent.fields.dateTypeArchive.value)}"/>
<c:set target="${stories}" property="dateFormat"
       value="${fn:trim(requestScope.widgetContent.fields.dateFormatArchive.value)}"/>
<c:set target="${stories}" property="showComments"
       value="${fn:trim(requestScope.widgetContent.fields.showCommentArchive.value)}"/>
<c:set target="${stories}" property="showIcons"
       value="${fn:trim(requestScope.widgetContent.fields.showIconsArchive.value)}"/>

<c:if test="${not empty requestScope['uk.co.trinitymirror.archive.url.year']
              and not empty requestScope['uk.co.trinitymirror.archive.url.month']
              and not empty requestScope['uk.co.trinitymirror.archive.url.day']}">

  <fmt:parseDate value="${requestScope['uk.co.trinitymirror.archive.url.year']}-${requestScope['uk.co.trinitymirror.archive.url.month']}-${requestScope['uk.co.trinitymirror.archive.url.day']} 00:00:00" pattern="yyyy-MM-dd HH:mm:ss" var="fromDate"/>
  <fmt:parseDate value="${requestScope['uk.co.trinitymirror.archive.url.year']}-${requestScope['uk.co.trinitymirror.archive.url.month']}-${requestScope['uk.co.trinitymirror.archive.url.day']} 23:59:59" pattern="yyyy-MM-dd HH:mm:ss" var="toDate"/>

  <fmt:parseDate value="${requestScope['uk.co.trinitymirror.archive.url.year']}-${requestScope['uk.co.trinitymirror.archive.url.month']}-${requestScope['uk.co.trinitymirror.archive.url.day']}" pattern="yyyy-MM-dd" var="forDate"/>
  <fmt:formatDate value="${forDate}" pattern="${stories.dateFormat}" var="dateTime"/>

  <c:set target="${stories}" property="heading">
    <fmt:message key="stories.widget.archivedList.heading.label"/>
  </c:set>
  <c:set target="${stories}" property="forDate" value="${dateTime}"/>

  <c:choose>
    <c:when test="${not empty stories.excludeSectionUniqueName}">
      <section:use uniqueName="${stories.excludeSectionUniqueName}">
        <c:set var="excludeSectionQuery"
               value="-(section:${requestScope.section.id} OR home_section:${requestScope.section.id})"/>
      </section:use>
    </c:when>
    <c:otherwise>
      <c:set var="excludeSectionQuery" value=""/>
    </c:otherwise>
  </c:choose>
 
  <tm:getArticleListMap var="resultMap"
                        sectionName="${stories.sectionUniqueName}"
                        contentType="${stories.contentType}"
                        filterQuery="${stories.weights}${stories.subTypeQuery} ${excludeSectionQuery}"
                        sortBy="${stories.sortBy} ${stories.sortOrder}"
                        startIndex="${startIndex}"
                        maxItem="${stories.numberOfItems}"
                        homeSectionOnly="${stories.homeSectionOnly}"
                        fromDate="${fromDate}"
                        toDate="${toDate}"
                        enableMultisitePublishedArticles="${stories.enableMultisitePublishedArticles}"/>
  <c:set target="${stories}" property="articles" value="${resultMap.items}"/>
  <c:set target="${stories}" property="resultCount" value="${resultMap.count}"/>


  <c:set var="numberOfPages" value="${stories.pageLength}"/>


  <c:set target="${stories}" property="numberOfPageLinks"
         value="${requestScope.widgetContent.fields.numberOfPageLinksArchive.value}"/>
  <c:set var="pageCount" value="1"/>

  <c:if test="${stories.pageLength < stories.resultCount}">
    <c:set var="pageCount" value="${stories.resultCount / stories.pageLength}"/>
    <c:set var="pageCountMultiplied" value="${pageCount * stories.pageLength}"/>
    <c:if test="${pageCountMultiplied < stories.resultCount}">
      <c:set var="pageCount" value="${pageCount+1}"/>
    </c:if>
  </c:if>

  <c:set var="numberOfPages" value="${pageCount}"/>
  <c:if test="${empty stories.numberOfPageLinks}">
    <c:set target="${stories}" property="numberOfPageLinks" value="${numberOfPages}"/>
  </c:if>
  <c:set target="${stories}" property="numberOfPages" value="${numberOfPages + 0}"/>
  <c:set target="${stories}" property="numberOfPageLinks" value="${stories.numberOfPageLinks + 0}"/>
  <c:set target="${stories}" property="pageLength" value="${pageLength + 0}"/>
  <c:set target="${stories}" property="currentPageNumber" value="${pageNumber + 0}"/>

  <wf-core:getPaginationRange numberOfPages="${stories.numberOfPages}"
                              currentPageNumber="${stories.currentPageNumber}"
                              numberOfPageLinks="${stories.numberOfPageLinks}"/>
  <c:set target="${stories}" property="beginPageNumber" value="${requestScope.beginPageNumber}"/>
  <c:set target="${stories}" property="endPageNumber" value="${requestScope.endPageNumber}"/>

  <c:set target="${stories}" property="paginationUrl"
         value="${requestScope.publication.url}${requestScope['uk.co.trinitymirror.archive.url.pattern']}/${requestScope['uk.co.trinitymirror.archive.date']}" />
</c:if>

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
