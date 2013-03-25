<%--
 * Author : octavian.boicu@trinitymirror.com
--%>
<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="collection" uri="http://www.escenic.com/taglib/escenic-collection" %>
<%@ taglib prefix="tm" tagdir="/WEB-INF/tags" %>

<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>

<jsp:include page="pictureNavigator.jsp"/>
