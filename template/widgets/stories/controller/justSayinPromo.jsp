<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="wf-core" uri="http://www.escenic.com/widget-framework/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:useBean id="stories" class="java.util.HashMap" scope="request"/>

<%-- create the map that will contain relevant field values --%>
<jsp:useBean id="controller" class="uk.co.trinitymirror.widgets.stories.JustSayinPromoController" scope="page"/>
<jsp:setProperty property="request" name="controller" value="${pageContext.request}"/>
<jsp:setProperty property="response" name="controller" value="${pageContext.response}"/>
<jsp:setProperty property="viewContent" name="controller" value="${stories}"/>
<c:set var="stories" scope="request" value="${controller.viewContent}"/>

<c:set target="${stories}" property="carouselJsUrl" value="${requestScope.resourceUrl}js/tm.carousel.js?v=1"/>

<jsp:include page="helpers/calculateViewModel.jsp" />
