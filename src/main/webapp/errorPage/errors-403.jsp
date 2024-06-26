<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="url"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>403 Forbidden</title>
  <!-- General CSS Files -->
  <link rel="stylesheet" href="${url}/Assets/cssf/app.min.css">
  <!-- Template CSS -->
  <link rel="stylesheet" href="${url}/Assets/cssf/style.css">
  <link rel="stylesheet" href="${url}/Assets/cssf/components.css">
  <!-- Custom style CSS -->
  <link rel="stylesheet" href="${url}/Assets/cssf/custom.css">
</head>

<body>
  <div class="loader"></div>
  <div id="app">
    <section class="section">
      <div class="container mt-5">
        <div class="page-error">
          <div class="page-inner">
            <h1>403</h1>
            <div class="page-description">
              You do not have access to this page.
            </div>

              <div class="mt-3">
                <a href="index">Back to Home</a>
              </div>
            </div>
          </div>
        </div>
    </section>
  </div>
  <!-- General JS Scripts -->
  <script src="${url}/Assets/jsf/app.min.js"></script>
  <!-- JS Libraies -->
  <!-- Page Specific JS File -->
  <!-- Template JS File -->
  <script src="${url}/Assets/jsf/scripts.js"></script>
  <!-- Custom JS File -->
  <script src="${url}/Assets/jsf/custom.js"></script>
</body>

</html>