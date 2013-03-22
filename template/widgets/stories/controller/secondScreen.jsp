<%@ page contentType="text/html; charset=UTF-8" language="java" isELIgnored="false" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:useBean id="stories" type="java.util.Map" scope="request"/>

<jsp:useBean id="controller" class="uk.co.trinitymirror.widgets.stories.SecondScreenController" scope="page"/>
<jsp:setProperty property="request" name="controller" value="${pageContext.request}"/>
<jsp:setProperty property="response" name="controller" value="${pageContext.response}"/>
<jsp:setProperty property="viewContent" name="controller" value="${stories}"/>
<c:set var="stories" scope="request" value="${controller.viewContent}"/>

<jsp:include page="helpers/calculateViewModel.jsp" />
