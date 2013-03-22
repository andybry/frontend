<%--
 * $Id:$
 * $URL:$
 *
 * This is the view for the Just Sayin view of stories widget
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="article" uri="http://www.escenic.com/taglib/escenic-article" %>

<jsp:useBean id="stories" class="java.util.HashMap" scope="request"/>

<div id="justsaying">
  <div class="just-sayin-wrapper">
    <div class="just-sayin-panel">

      <c:forEach var="articleMap" items="${stories.articleMaps}" varStatus="status"> 
        <div class="just-sayin">
          <div class="visor">             

            <%-- date --%>
            <div class="date-calendar">
              <p class="month"><fmt:formatDate value="${articleMap.publishingDate}" pattern="MMMMMMMMM yyyy" /></p>
              <p class="day"><fmt:formatDate value="${articleMap.publishingDate}" pattern="EEE dd" /></p>
            </div>

            <%-- image and link --%>
            <div class="video-box">
              <a href="${articleMap.url}">  
                <span class="play"></span>
                <img src="${articleMap.videoMainImageUrl}" alt="thumbnail" height="229" width="407" />           
              </a>          
            </div>        

         </div>
 
         <%-- caption --%>
         <div class="caption">
           <h2>IN OUR DAILY VIDEO SHOW TODAY...</h2>
           <p>${articleMap.intro}</p>
         </div>      

        </div>
      </c:forEach>

    </div>

    <div class="calendar-controls">
      <a href="#" class="ir btn-left">Left</a>
      <a href="#" class="ir btn-right">Right</a>
    </div>

    <script type="text/javascript">//<![CDATA[
      $LAB.script("${stories.carouselJsUrl}").wait(function(){
        $("#justsaying").carousel_3am();
      });
    //]]></script>


  </div>
</div>

<c:remove var="stories" scope="request"/>
