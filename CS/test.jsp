<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>  
<h1>ABC.com</h1>  
<hr/>  
<c:import var="data" url="http://www.javatpoint.com"></c:import>  
  
<h2>Data is:</h2>  
<c:out value="${data}"></c:out>  