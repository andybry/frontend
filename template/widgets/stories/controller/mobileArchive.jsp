<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="stories" class="java.util.HashMap" scope="request"/>

<%-- create the map that will contain relevant field values --%>
<jsp:useBean id="controller" class="uk.co.trinitymirror.widgets.stories.MobileArchiveController" scope="page"/>
<jsp:setProperty property="request" name="controller" value="${pageContext.request}"/>
<jsp:setProperty property="response" name="controller" value="${pageContext.response}"/>
<jsp:setProperty property="viewContent" name="controller" value="${stories}"/>
<c:set var="stories" scope="request" value="${controller.viewContent}"/>

<wf-core:getPaginationRange numberOfPages="${stories.numberOfPages}"
                            currentPageNumber="${stories.currentPageNumber}"
                            numberOfPageLinks="${stories.numberOfPageLinks}"/>
<c:set target="${stories}" property="beginPageNumber" value="${requestScope.beginPageNumber}"/>
<c:set target="${stories}" property="endPageNumber" value="${requestScope.endPageNumber}"/>
<c:set target="${stories}" property="paginationUrl"
       value="${requestScope.publication.url}${requestScope['uk.co.trinitymirror.archive.url.pattern']}/${requestScope['uk.co.trinitymirror.archive.date']}" />
<c:set target="${stories}" property="heading">
  <fmt:message key="stories.widget.archivedList.heading.label"/>
</c:set>

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
