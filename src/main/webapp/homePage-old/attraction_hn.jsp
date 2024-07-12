

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Document</title>
  <link
          href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous"
  />
  <script
          src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
          crossorigin="anonymous"
  ></script>
  <style>
    .card {
      border: 1px solid #ccc;
      padding: 16px;
      margin: 16px;
      border-radius: 8px;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    .card img {
      max-width: 100%;
      height: auto;
      display: block;
      margin-bottom: 8px;
      /* text-align:left; */
    }
    .root {
      width: 100%;
      max-width: 1024px;
      /* display: flex; */
      /* text-align: center; */
      align-items: center;
    }
  </style>
</head>
<body>
<div class="root"></div>

<div class="card mb-3" style="max-width: 540px">
  <div class="row g-0">
    <div class="col-md-4">
      <img src="..." class="img-fluid rounded-start" alt="..." />
    </div>
    <div class="col-md-8">
      <div class="card-body">
        <h5 class="card-title">Card title</h5>
        <p class="card-text">
          This is a wider card with supporting text below as a natural
          lead-in to additional content. This content is a little bit
          longer.
        </p>
        <p class="card-text">
          <small class="text-muted">Last updated 3 mins ago</small>
        </p>
        <button class="end-right"></button>
      </div>
    </div>
  </div>
</div>

<script>
  const data = [
    {
      title: "Hồ Hoàn Kiếm",
      address: "Quận Hoàn Kiếm, Hà Nội",
      content: 'Hồ Hoàn Kiếm là địa điểm du lịch nổi tiếng không chỉ riêng của quận Hoàn Kiếm mà còn của cả Thủ đô. Vào các buổi tối cuối tuần, nơi đây là không gian của phố đi bộ Hồ Gươm, mọi người ở khắp các quận, huyện khác đổ về đây rất đông để tham gia các hoạt động vui chơi, giải trí.',
      distinct: "100m",
      type: "thắng cảnh",
      img: "https://statics.vinpearl.com/quan-hoan-kiem-co-gi-choi-3_1687796493.jpg",
      location: "21.0285, 105.8542"
    },
    {
      title: "Nhà Hát Lớn",
      address: "Số 1 Tràng Tiền, Hoàn Kiếm, Hà Nội",
      content: 'Nhà Hát Lớn Hà Nội là một công trình kiến trúc mang phong cách tân cổ điển Pháp, là nơi diễn ra nhiều sự kiện văn hóa, nghệ thuật lớn của thành phố.',
      distinct: "500m",
      type: "nhà hát",
      img: "https://statics.vinpearl.com/quan-hoan-kiem-co-gi-choi-4_1687796545.jpg",
      location: "21.0257, 105.8566",
    },
    {
      title: "Nhà hát múa rối nước Thăng Long",
      address: "57B Đinh Tiên Hoàng, Hoàn Kiếm, Hà Nội",
      content: 'Nhà hát múa rối nước Thăng Long là nơi biểu diễn nghệ thuật múa rối nước truyền thống, một nét văn hóa độc đáo của Việt Nam.',
      distinct: "150m",
      type: "nhà hát",
      img: "https://cdn.justfly.vn/1200x800/media/a8/66/3906-443a-45cf-abbc-6bb5b96f9d1f.jpg",
      location: "21.0307, 105.8539",
    },
    {
      title: "Cầu Thê Húc",
      address: "Phường Lý Thái Tổ, Hoàn Kiếm, Hà Nội",
      content: 'Cầu Thê Húc là một cây cầu màu đỏ nổi bật dẫn vào đền Ngọc Sơn, là biểu tượng văn hóa và lịch sử của Hà Nội.',
      distinct: "120m",
      type: "công trình kiến trúc",
      img: "https://cdn.justfly.vn/1080x720/media/43/4d/17ef-0ed2-4b35-9add-ae544b50b5ef.jpg",
      location: "21.0294, 105.8528",
    },
    {
      title: "Di tích Nhà tù Hỏa Lò",
      address: "1 Hỏa Lò, Trần Hưng Đạo, Hoàn Kiếm, Hà Nội",
      content: 'Di tích Nhà tù Hỏa Lò là một bảo tàng lịch sử, nơi giam giữ các chiến sĩ cách mạng và tù binh trong thời kỳ chiến tranh.',
      distinct: "700m",
      type: "bảo tàng",
      img: "https://cdn.justfly.vn/512x341/media/ed/76/0392-80da-4805-8bb1-a809fb9c94d3.jpg",
      location: "21.0245, 105.8475",
    },
    {
      title: "Chợ Đồng Xuân",
      address: "Quận Hoàn Kiếm, Hà Nội",
      content: "Chợ Đồng Xuân là chợ lớn nhất Hà Nội với nhiều mặt hàng đa dạng từ quần áo, đồ lưu niệm đến thực phẩm.",
      distinct: "500m",
      type: "chợ",
      img: "https://example.com/cho-dong-xuan.jpg",
      location: "21.0362, 105.8480"
    },
    {
      title: "Văn Miếu Quốc Tử Giám",
      address: "Quận Đống Đa, Hà Nội",
      content: "Văn Miếu Quốc Tử Giám là trường đại học đầu tiên của Việt Nam, nơi thờ Khổng Tử và các bậc hiền triết Nho giáo.",
      distinct: "2km",
      type: "thắng cảnh",
      img: "https://example.com/van-mieu-quoc-tu-giam.jpg",
      location: "21.0285, 105.8355"
    },
    {
      title: "Nhà hát Lớn Hà Nội",
      address: "Quận Hoàn Kiếm, Hà Nội",
      content: "Nhà hát Lớn Hà Nội là nhà hát opera cổ kính với kiến trúc Pháp đẹp mắt.",
      distinct: "1km",
      type: "thắng cảnh",
      img: "https://example.com/nha-hat-lon-ha-noi.jpg",
      location: "21.0247, 105.8575"
    },
    {
      title: "Lăng Chủ tịch Hồ Chí Minh",
      address: "Quận Ba Đình, Hà Nội",
      content: "Lăng Chủ tịch Hồ Chí Minh là nơi an nghỉ cuối cùng của Chủ tịch Hồ Chí Minh, vị lãnh tụ vĩ đại của Việt Nam.",
      distinct: "2.5km",
      type: "thắng cảnh",
      img: "https://example.com/lang-chu-tich-ho-chi-minh.jpg",
      location: "21.0368, 105.8342"
    },
    {
      title: "Đền Ngọc Sơn",
      address: "Quận Hoàn Kiếm, Hà Nội",
      content: "Đền Ngọc Sơn là ngôi đền Nho giáo trên hồ nước có cầu bắc qua nổi bật với tòa tháp và các gian điện thờ anh hùng dân tộc.",
      distinct: "500m",
      type: "thắng cảnh",
      img: "https://example.com/den-ngoc-son.jpg",
      location: "21.0285, 105.8530",
      opening_hours: "Thứ Hai - Chủ Nhật: 8:00 sáng - 6:00 chiều",
      rating: "4.4"
    },
    {
      title: "Tượng Đài Vua Lý Thái Tổ",
      address: "Quận Hoàn Kiếm, Hà Nội",
      content: "Tượng Vua Lý Thái Tổ uy nghi bằng đồng nằm trong khu vườn thanh bình nhằm tôn vinh tự do, văn hóa và lịch sử.",
      distinct: "700m",
      type: "thắng cảnh",
      img: "https://example.com/tuong-dai-vua-ly-thai-to.jpg",
      location: "21.0308, 105.8550",
      opening_hours: "Mở cửa cả ngày",
      rating: "4.6"
    },
    {
      title: "Tháp Bút",
      address: "Quận Hoàn Kiếm, Hà Nội",
      content: "Tháp Bút là một công trình kiến trúc đặc sắc nằm cạnh hồ Hoàn Kiếm.",
      distinct: "100m",
      type: "thắng cảnh",
      img: "https://example.com/thap-but.jpg",
      location: "21.0285, 105.8535",
      opening_hours: "Mở cửa cả ngày",
      rating: "4.6"
    },
    {
      title: "Khu Phố Cổ Hà Nội",
      address: "Quận Hoàn Kiếm, Hà Nội",
      content: "Khu Phố Cổ Hà Nội là khu giao thương lâu đời, có chợ đêm, những con ngõ nhỏ, quầy hàng rong và nhà cửa xây hình ống.",
      distinct: "500m",
      type: "khu phố",
      img: "https://example.com/khu-pho-co-ha-noi.jpg",
      location: "21.0348, 105.8522",
      opening_hours: "Mở cửa cả ngày",
      rating: "4.5"
    }
  ];


  // Select the element with the class 'root'
  const rootElement = document.querySelector(".root");

  // Create content from the data
  const content = data
          .map(
                  (item) => `
      <div class="card mb-3" style="max-width: 540px;">
    <div class="row g-0">
      <div class="col-md-4">
        <img src="${item.img}" class="img-fluid rounded-start" alt="${item.title}">
      </div>
      <div class="col-md-8">
        <div class="card-body">
          <h5 class="card-title">${item.title}</h5>
          <p class="card-text"><small class="text-muted">${item.distinct}</small></p>
          <p class="card-text">${item.content}</p>
        </div>
      </div>
    </div>
  </div>
    `
          )
          .join("");

  // Set the inner HTML of the selected element
  rootElement.innerHTML = content;

  const type = data.map(item =>
          console.log(item.type)
  )
</script>
</body>
</html>
