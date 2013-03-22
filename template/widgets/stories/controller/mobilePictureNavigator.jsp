<%--
 * Author : octavian.boicu@trinitymirror.com
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="collection" uri="http://www.escenic.com/taglib/escenic-collection" %>
<%@ taglib prefix="tm" tagdir="/WEB-INF/tags" %>

<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>

<c:set target="${stories}" property="imageVersion" value="s318" />

<jsp:include page="pictureNavigator.jsp"/>

<%-- change the crop for the images --%>
<c:forEach var="articleMap" items="${stories.articleMaps}" varStatus="status">
  <c:set target="${articleMap.imageMap}" property="url" value="${elfn:replaceFirst(articleMap.imageMap.url, stories.imageVersion, 's318')}" />
</c:forEach>
