<!DOCTYPE html>
<html lang="en">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="url"
       value="${pageContext.request.scheme}://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>
<head>
  <meta charset="UTF-8">
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no" name="viewport">
  <title>404 Not Found</title>
  <!-- General CSS Files -->
  <link rel="stylesheet" href="${url}/Assets/assets/css/app.min.css">
  <!-- Template CSS -->
  <link rel="stylesheet" href="${url}/Assets/assets/css/style.css">
  <link rel="stylesheet" href="${url}/Assets/assets/css/components.css">
  <!-- Custom style CSS -->
  <link rel="stylesheet" href="${url}/Assets/assets/css/custom.css">
</head>

<body>
  <div class="loader"></div>
  <div id="app">
    <section class="section">
      <div class="container mt-5">
        <div class="page-error">
          <div class="page-inner">
            <h1>404</h1>
            <div class="page-description">
              The page you were looking for could not be found.
            </div>

              <div class="mt-3">
                <a href="${url}/home">Back to Home</a>
              </div>
            </div>
          </div>
        </div>
    </section>
  </div>
  <!-- General JS Scripts -->
  <script src="${url}/Assets/assets/js/app.min.js"></script>
  <!-- JS Libraies -->
  <!-- Page Specific JS File -->
  <!-- Template JS File -->
  <script src="${url}/Assets/assets/js/scripts.js"></script>
  <!-- Custom JS File -->
  <script src="${url}/Assets/assets/js/custom.js"></script>
</body>

</html>