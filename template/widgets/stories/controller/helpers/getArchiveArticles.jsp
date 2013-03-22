<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="article" uri="http://www.escenic.com/taglib/escenic-article" %>
<%@ taglib prefix="section" uri="http://www.escenic.com/taglib/escenic-section" %>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core" %>
<%@ taglib prefix="tm" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>

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
                      startIndex="${stories.startIndex}"
                      maxItem="${stories.numberOfItems}"
                      homeSectionOnly="${stories.homeSectionOnly}"
                      fromDate="${stories.fromDate}"
                      toDate="${stories.toDate}"
                      enableMultisitePublishedArticles="${stories.enableMultisitePublishedArticles}"/>
<c:set target="${stories}" property="articles" value="${resultMap.items}"/>
<c:set target="${stories}" property="resultCount" value="${resultMap.count}"/>