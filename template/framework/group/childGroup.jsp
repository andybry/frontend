<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="childGroup">
  <div class="top">
    <c:set var="items" value="${requestScope.items}" scope="page"/>
    <c:set var="items" value="${requestScope.areas.top.items}" scope="request"/>
    <jsp:include page="showitems.jsp" />
    <c:set var="items" value="${pageScope.items}" scope="request"/>
  </div>
  
  <div class="main">
    <c:set var="items" value="${requestScope.items}" scope="page"/>
    <c:set var="items" value="${requestScope.areas.main.items}" scope="request"/>
    <jsp:include page="showitems.jsp" />
    <c:set var="items" value="${requestScope.items}" scope="request"/>
  </div>
</div>
