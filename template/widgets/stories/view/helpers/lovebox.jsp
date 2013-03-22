<%--
$Id:$
$URL:$
--%>
<%@ page language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="stories" type="java.util.HashMap" scope="request"/>

<c:choose>
  <c:when test="${stories.recommendState == 1 }">
    <%-- logged in, personalisation on => hide box --%>
    <!-- State 1 -->
  </c:when>
  <c:when test="${stories.recommendState == 2 }">
    <!-- State 2 -->
  </c:when>
  <c:when test="${stories.recommendState == 3 }">
    <%-- Logged out and Personalisation On --%>
    <div class="recommended-seemore">
      <h3 class="box-heading no-topbdr">See more stories you'll love</h3>
      <div class="box-bottom">
        <p>Stories shown below are those we think you'll like based on what you've read before.
Improve what we show you by logging in with Facebook.</p>
      </div>
    </div>
  </c:when>
  <c:when test="${stories.recommendState == 4 }">
    <!-- State 4 -->
  </c:when>
  <c:when test="${stories.recommendState == 5 }">
    <c:if test="${not empty stories.enableRummbleLabs and stories.enableRummbleLabs}">
      <%--   Logged out and Personalisation Off - --%>
      <div class="recommended-seemore">
        <h3 class="box-heading no-topbdr">See more stories you'll love</h3>
        <div class="box-bottom">
          <p>You've turned off story recommendations. <a href="#" id="rlRecOn${stories.widgetId}">Turn them on</a> and we'll update the list below with stories we think you'll love (<a href="${stories.helpSectionLink}">how we do this</a>).</p><br />
        </div>
      </div>
      <script type="text/javascript">
        $LAB.script("${stories.personalisationJsUrl}")
        .script("${stories.uuidJsUrl}")
        .script("${stories.cookieJsUrl}")
        .wait(function(){
          $('#rlRecOn${stories.widgetId}').click(
            function () {
              $().personalisation("setPersonalisationOn");
              window.location.reload();
            }
          );
        });
      </script>
    </c:if>
  </c:when>
  <c:otherwise>
    <%-- All states should be covered. Do nothing. --%>
    <!-- State Other -->
  </c:otherwise>
</c:choose>
