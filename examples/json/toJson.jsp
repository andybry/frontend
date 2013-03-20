<%--
  This example builds up a Java object and then demonstrates how to serialise it
  to JSON
--%>

<jsp:useBean id="listOfObjects" class="java.util.ArrayList" scope="page" />
<jsp:useBean id="object1" class="java.util.HashMap" scope="page" />
<c:set target="${object1}" property="key1" value="value1" />
<c:set target="${object1}" property="key2" value="value2" />
<c:set target="${object1}" property="key3" value="value3" />
<jsp:useBean id="object2" class="java.util.HashMap" scope="page" />
<c:set target="${object2}" property="key1" value="value1" />
<c:set target="${object2}" property="key2" value="value2" />
<c:set target="${object2}" property="key3" value="value3" />
<jsp:useBean id="object3" class="java.util.HashMap" scope="page" />
<c:set target="${object3}" property="key1" value="value1" />
<c:set target="${object3}" property="key2" value="value2" />
<c:set target="${object3}" property="key3" value="value3" />
<collection:add collection="${listOfObjects}" value="${object1}"/>
<collection:add collection="${listOfObjects}" value="${object2}"/>
<collection:add collection="${listOfObjects}" value="${object3}"/>

${elfn:toJson(listOfObjects)}
