<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="configGroup">
  <div class="top">
    <c:set var="currentAreaName" value="top" scope="request" />
  
    <c:set var="area" value="top" scope="request" />
    <c:set var="currentSectionLevel" value="${section}" scope="request"/>
    <jsp:include page="getitems.jsp" />
    <c:remove var="currentSectionLevel" scope="request"/>
    <c:remove var="area" scope="request" />
  
    <c:set var="level" value="0" scope="request" />
    <jsp:include page="showitems.jsp" />
    <c:remove var="level" scope="request" />
  </div>
  
  <div class="main">
    <c:set var="currentAreaName" value="main" scope="request" />
  
    <c:set var="area" value="main" scope="request" />
    <c:set var="currentSectionLevel" value="${section}" scope="request"/>
    <jsp:include page="getitems.jsp" />
    <c:remove var="currentSectionLevel" scope="request"/>
    <c:remove var="area" scope="request" />
  
    <c:set var="level" value="0" scope="request" />
    <jsp:include page="showitems.jsp" />
    <c:remove var="level" scope="request" />
  </div>
  
  <div class="bottom">
    <c:set var="currentAreaName" value="bottom" scope="request" />
  
    <c:set var="area" value="bottom" scope="request" />
    <c:set var="currentSectionLevel" value="${section}" scope="request"/>
    <jsp:include page="getitems.jsp" />
    <c:remove var="currentSectionLevel" scope="request"/>
    <c:remove var="area" scope="request" />
  
    <c:set var="level" value="0" scope="request" />
    <jsp:include page="showitems.jsp" />
    <c:remove var="level" scope="request" />
  </div>
</div>
