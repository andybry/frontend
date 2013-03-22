 <%@ page contentType="text/html; charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core" %>

<jsp:useBean id="stories" type="java.util.Map" scope="request"/>

<jsp:useBean id="controller" class="uk.co.trinitymirror.widgets.stories.PaginatedMobileController" scope="page"/>
<jsp:setProperty property="request" name="controller" value="${pageContext.request}"/>
<jsp:setProperty property="response" name="controller" value="${pageContext.response}"/>
<jsp:setProperty property="viewContent" name="controller" value="${stories}"/>
<c:set var="stories" scope="request" value="${controller.viewContent}"/>

<wf-core:getPaginationRange numberOfPages="${stories.numberOfPages}"
                            currentPageNumber="${stories.currentPageNumber}"
                            numberOfPageLinks="${stories.numberOfPageLinks}"/>
<c:set target="${stories}" property="beginPageNumber" value="${requestScope.beginPageNumber}"/>
<c:set target="${stories}" property="endPageNumber" value="${requestScope.endPageNumber}"/>

<jsp:include page="helpers/calculateViewModel.jsp" />

<%--
  on the first page change the first image (if present) to be a larger crop size
--%>
<c:if test="${stories.articleMaps[0].showImage and stories.currentPageNumber eq 1}">
  <tm:getTeaserImageMap var="teaserImageMap" articleId="${stories.articleMaps[0].id}" 
    imageVersion="${stories.firstArticleImageVersion}" />
  <c:set target="${stories.articleMaps[0].imageMap}" property="url" value="${teaserImageMap.url}" />
  <c:set target="${stories.articleMaps[0].imageMap}" property="width" value="${teaserImageMap.width}" />
  <c:set target="${stories.articleMaps[0].imageMap}" property="height" value="${teaserImageMap.height}" />
  <c:remove var="teaserImageMap" />
</c:if>

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
