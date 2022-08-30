-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: localhost
-- Thời gian đã tạo: Th8 29, 2022 lúc 06:39 AM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `cosmetics`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `password`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Trần Hoàng Đăng', 'tranhoangdang1402@gmail.com', '$2y$10$t3Y1hzqVTE8WOUbiJeEPR.Cy.OfkwLBF2/I7dM3sXcLOwUXjFmTeu', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `carts`
--

CREATE TABLE `carts` (
  `id` int(10) UNSIGNED NOT NULL,
  `userID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `carts`
--

INSERT INTO `carts` (`id`, `userID`, `productID`, `qty`, `created_at`, `updated_at`) VALUES
(6, 11, 27, 1, '2022-08-28 01:19:10', '2022-08-28 01:19:10'),
(39, 10, 4, 2, '2022-08-28 10:39:22', '2022-08-28 10:45:01'),
(57, 1, 28, 1, '2022-08-28 23:27:21', '2022-08-28 23:27:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `adminID` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `adminID`, `name`, `slug`, `is_active`, `created_at`, `updated_at`) VALUES
(1, NULL, 'Chăm sóc da', 'cham-soc-da', 1, NULL, '2022-08-26 09:42:58'),
(2, 1, 'Chăm sóc cơ thể', 'cham-soc-co-the', 1, '2022-08-26 09:16:18', '2022-08-26 09:16:18'),
(3, 1, 'Chăm sóc tóc', 'cham-soc-toc', 1, '2022-08-26 09:19:36', '2022-08-26 09:19:36'),
(4, 1, 'Trang điểm', 'trang-diem', 1, '2022-08-26 09:19:44', '2022-08-26 09:19:44');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contacts`
--

CREATE TABLE `contacts` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `orderID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `events`
--

CREATE TABLE `events` (
  `id` int(10) UNSIGNED NOT NULL,
  `adminID` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `events`
--

INSERT INTO `events` (`id`, `adminID`, `name`, `slug`, `image`, `content`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Khóa ẩm dài lâu - Ưu đãi đậm sâu', 'khoa-am-dai-lau-uu-dai-dam-sau', '1661531025.png', '<p>Đây là ngày hội tới trường đầu tiên của học sinh Trường Tiểu học, THCS và THPT Hy Vọng. Các em đến từ 41 tỉnh thành, đều mồ côi cha, mẹ hoặc cả hai sau đại dịch Covid-19. Trong đồng phục áo xanh, quần ghi, học sinh xếp hàng đánh trống chào đón đại biểu, biểu diễn văn nghệ.</p><p>Những em 6 tuổi, nhỏ nhất Trường Hy Vọng, được Chủ tịch nước Nguyễn Xuân Phúc, Bộ trưởng Giáo dục và Đào tạo Nguyễn Kim Sơn cùng Bí thư Thành ủy Đà Nẵng Nguyễn Văn Quảng dắt tay bước vào không gian ngày hội trong tiếng vỗ tay của khoảng 500 người thanh dự.</p><p>Phát biểu tại buổi lễ, Chủ tịch nước Nguyễn Xuân Phúc đánh giá cao quyết tâm và nỗ lực của Tập đoàn FPT cùng thầy cô Trường Hy Vọng trong việc gõ cửa từng nhà nạn nhân, thuyết phục người thân đưa con em ra Đà Nẵng học tập.</p><p>Chủ tịch nước chia sẻ những khoảng trống của học sinh trong hai năm Covid-19, nhiều gia đình ly tán, mất người thân, nhiều em mất cả cha lẫn mẹ, bị tổn thương về tinh thần cũng như điều kiện phát triển. \"Trong điều kiện như vậy, sự ra đời của Trường Hy Vọng là niềm mong đợi không chỉ của những gia đình chịu đau thương vì đại dịch\", ông nói.</p><p>Kể về tuổi thơ cùng nhiều bạn bè khó khăn được thầy cô yêu thương, dạy dỗ để trở thành công dân có trách nhiệm hôm nay, Chủ tịch nước nói: \"Cá nhân tôi đồng cảm sâu sắc với các em. Từ trong gian khổ, nếu có ý chí vượt khó vươn lên và với sự quan tâm của xã hội, các em nhất định thành công\".</p><p>Nhắn gửi đến học sinh \"học tập tốt, sống tốt là cách tốt nhất để báo hiếu, tri ân những người đã giúp đỡ mình\", Chủ tịch tin tưởng các thầy cô, Ban giám hiệu nhà trường, với sự đồng hành của tập đoàn FPT và các tổ chức liên quan, sẽ xây dựng ngôi nhà chung ấm áp, đầy tình thương và trí tuệ. Các em sẽ trở thành những trí thức biết yêu thương và hạnh phúc.</p><p>Chủ tịch nước đã tặng bức tranh đá \"Bác Hồ với thiếu nhi\", tuyển tập sách và bánh Trung thu cho học sinh nhà trường. Thay cho lời cảm ơn, các em trường Hy Vọng tặng Chủ tịch nước bức tranh tự tay thực hiện ba tuần qua.</p><p>Tại ngày hội, Chủ tịch Hội đồng quản trị FPT Trương Gia Bình, thành viên sáng lập Trường Hy Vọng, cảm ơn sự hiện diện của Chủ tịch nước, cho thấy sự quan tâm của Nhà nước tới trẻ em yếu thế, giúp các em có thêm niềm tin và vững bước hơn trong tương lai.</p><p>Ông Bình nói điều tập đoàn mong muốn mang đến cho các em không chỉ là sự hỗ trợ nhất thời mà đồng hành đến trọn đời. Từ ngôi trường này, các em sẽ học tập, rèn luyện để \"trở thành công dân trách nhiệm, biến đau thương thành sức mạnh, chinh phục những đỉnh cao và quay lại giúp ích cho đất nước\".</p><p>Đại diện cho các bạn, em Lưu Hữu Nghị, 17 tuổi, quê TP HCM, rụt rè nói \"cảm ơn\". Sau khi cha qua đời vì bạo bệnh, mẹ mất vì Covid-19, Nghị quyết định nghỉ học, đi làm thuê lấy tiền nuôi em gái 15 tuổi ăn học. Hai anh em đồng ý ra Đà Nẵng học tập sau khi đã gửi tro cốt của cha mẹ cho người thân lo hương khói.</p><p>Từ ý tưởng xây ngôi trường dành cho các em nhỏ mất cha mẹ do Covid-19, Trường Tiểu học, THCS và THPT Hy Vọng đã ra đời, tọa lạc tại Khu đô thị FPT City (phường Hòa Hải, quận Ngũ Hành Sơn). Trường tiếp nhận học sinh bị ảnh hưởng do dịch Covid-19, tuổi từ 6 đến 18, ưu tiên các em hoàn cảnh khó khăn, có nguyện vọng và được người giám hộ chấp thuận.</p><p>Học viên Trường Hy Vọng được bố trí theo học chính khóa tại hệ thống trường Liên cấp FPT tại Đà Nẵng (hệ phổ thông theo chuẩn của Bộ Giáo dục và Đào tạo); tham gia các chương trình đào tạo phát triển năng khiếu, phát triển cá nhân của từng em.</p><p>Nhà trường đặt mục hoàn thiện kỹ năng cho từng cấp học. Theo đó, cấp tiểu học biết tự dọn dẹp vệ sinh tư trang và phòng ở cá nhân; cấp THCS biết chịu trách nhiệm với bản thân, gia đình, xã hội và biết tự giải quyết các vấn đề gặp phải trong cuộc sống; cấp THPT biết thích nghi với điều kiện và khả năng sống của mình, biết rõ định hướng nghề nghiệp, đích đến trong tương lai.</p>', 1, '2022-08-26 09:23:45', '2022-08-27 00:30:39'),
(2, 1, 'Tặng quà fullsize - Nắng nóng chẳng lo lắng', 'tang-qua-fullsize-nang-nong-chang-lo-lang', '1661531082.png', '<p>\"Bà ngoại, bà cố mất rồi, giờ Hoàng Anh ở với cậu được không?\", Nguyễn Phương Quốc Đạt, 22 tuổi nhìn hai bức di ảnh trên bàn thờ rồi ôm cháu gái vào lòng, mắt đỏ hoe.</p><p>Bé Hoàng Anh là cháu ruột của Đạt. Tám năm trước, mẹ cô bé mang đứa con gái một tháng tuổi về gửi bà cố Nguyễn Thị Tường còn mình cùng mẹ (bà ngoại) sang Malaysia làm thuê.</p><p>Bốn tháng đầu, mẹ Hoàng Anh vẫn gửi tiền và gọi điện về hỏi thăm con, nhưng từ tháng thứ năm, người phụ nữ bặt vô âm tín. Trong căn nhà tuềnh toàng, nhiều mảng tường bong tróc, rộng 28 m2 ở đường Tôn Thất Thuyết, phường 18, quận 4, bà Tường trở thành mẹ của đứa chắt mồ côi khi mới vài tháng tuổi.</p><p>Ngoài tiền tiết kiệm, bà đi phụ giúp quán bán hủ tiếu đầu hẻm, ngày nhận 50.000 đồng tiền công. \"Ngoại nói khổ cũng phải nuôi dạy Hoàng Anh tử tế, cho đi học, vì thương chắt bị bố mẹ ruồng bỏ\", Đạt kể và nói bản thân cũng đi làm thêm, mong phụ thêm gia đình.</p><p>Lớn lên trong tình yêu thương của bà cố và cậu, cô bé Hoàng Anh rất năng động, hoạt ngôn, hòa đồng với bạn bè, thích đến trường. \"Mới 8 tuổi nhưng bé rất hiểu chuyện, chưa từng đòi mua quần áo mới hay đồ ăn, thậm chí còn biết phụ việc nhà khi người lớn đi làm\", người cậu nói.</p><p>Tháng 8/2021, bà cố nhiễm Covid-19 nên Hoàng Anh được gửi đến nhà họ hàng ở vài ngày. Nhưng đó cũng là lần cuối cùng cô bé 8 tuổi được gặp mặt cố. Lúc lâm chung, biết không thể gặp cháu lần cuối, bà Tường dặn Đạt cố gắng nuôi Hoàng Anh, đừng để nghỉ học giữa chừng.</p><p>Hôm về nhà, Hoàng Anh chạy khắp nơi tìm nhưng chỉ thấy bức di ảnh cố đặt trên bàn thờ. Vài ngày sau, hai hũ tro cốt được chuyển về gia đình, cô bé mới biết cụ và bà ngoại không còn. Từ ấy, em trở nên trầm tính, đêm nào cũng nằm khóc. \"Trước đây cháu được ngủ cùng bà cố và cậu. Nay còn mỗi cậu, hay bà cố thấy giường chật nên bỏ đi, nhường chỗ rộng cho cậu cháu mình?\", cô bé mếu máo nói với cậu.</p><p>\"Chưa được một tuổi cháu mồ côi mẹ, giờ lại mồ côi lần nữa sao có thể chịu được cú sốc này\", Đạt thở dài.</p><p>Bà cố mất, kinh tế gia đình ngày càng suy kiệt. Hàng ngày Đạt đi lau dọn nhà cửa hoặc ai thuê gì làm nấy, nhưng bản thân mắc bệnh tim và phổi hơn chục năm, nay chuyển thành xơ phổi do từng mắc Covid-19 khiến sức khỏe ngày càng yếu. Tháng nào khỏe lắm Đạt cũng chỉ kiếm được khoảng 1,5 triệu đồng. Anh kể, không ít lần đang đi làm bị xây xẩm mặt mày, đi không vững phải ngồi thụp xuống đất thở dốc vì kiệt sức. Dẫu vậy, chàng trai 22 tuổi chưa dám ở nhà ngày nào vì tất cả tiền mua thuốc và tiền nuôi cháu đều trông chờ vào anh.</p><p>\"Học phí của Hoàng Anh năm ngoái được miễn, năm nay tôi đang đề đạt nguyện vọng, mong nhà trường hỗ trợ. Riêng 2 triệu đồng tiền trợ cấp mồ côi vì Covid-19 mỗi tháng của cháu tôi cất riêng, đợi cháu lớn sẽ có khoản vốn làm ăn\", người cậu bộc bạch.</p><p>Mỗi sáng Đạt dậy sớm chuẩn bị đồ ăn, đưa cháu đến trường cách nhà chừng 100 m, sau về dọn dẹp và chuẩn bị đi làm. Chiều về, anh giặt giũ, nấu cơm, rồi cùng cháu ôn bài. Trước lúc đi ngủ, hai cậu cháu lại hồi tưởng những câu chuyện có bà cố, khiến gương mặt của Hoàng Anh rạng rỡ hẳn. Cô bé liến thoắng kể về những ngày được cùng cố đi chợ, nấu cơm hay khoảnh khắc cả nhà cùng nhau dọn dẹp, chuẩn bị đón tết.</p><p>Cuối tháng, anh viết đơn và được UBND phường 18 xác nhận là người nuôi dưỡng trực tiếp cháu gái Lê Nguyễn Hoàng Anh thay bà ngoại đã mất. Nhiều người nói Đạt khùng khi bản thân bệnh tật còn đèo bòng người cháu. \"Họ hàng vẫn còn nhưng gia cảnh ai cũng khó khăn. Tôi coi Hoàng Anh như con, không nỡ rời xa. Chưa kể tôi còn thực hiện lời hứa với bà ngoại sẽ chăm sóc cháu gái đến năm 18 tuổi\", Đạt giải thích.</p><p>Bà Châu Thị Nhanh, tổ trưởng dân phố 24, phường 18 cho biết gia đình Quốc Đạt có hoàn cảnh khó khăn, tổ dân phố và chính quyền địa phương rất quan tâm. Mỗi khi có hỗ trợ cho gia đình có người mất vì Covid-19, cháu Hoàng Anh đều được nhận quà.</p><p>Hiện, hai cậu cháu sống căn căn nhà cấp 4 xuống cấp trầm trọng, tường nứt, bong tróc, mái sập xệ cần được tu sửa. \"Chúng tôi có đề đạt nguyện vọng với phường, mong được sửa chữa căn nhà, vì không biết lúc nào sập, nhưng vẫn chưa đủ kinh phí và nguồn lực để thực hiện. Rất mong các mạnh thường có thể chung tay giúp sức\", bà Châu nói.</p><p>Nhận trách nhiệm làm bố, làm mẹ của cháu gái, Đạt thừa nhận cũng có lúc gặp khó khi bản thân còn lúng túng, vụng về trong việc chăm sóc, dỗ dành, nhưng đang cố gắng thay đổi từng ngày. Anh bắt đầu học cách buộc tóc, chọn quần áo theo sở thích, học nấu các món ăn ngon, cố gắng hiểu tâm lý và cho cháu gái tham gia các sự kiện cộng đồng để không bị mặc cảm, tự ti.</p><p>Như ngày 28/8 tới, Hoàng Anh và cậu sẽ tham gia giao lưu trong chương trình Việt Nam mong ước tại chùa Giác Ngộ (TP HCM), nhằm chia sẻ câu chuyện, nghị lực vượt qua biến cố. \"Tôi hy vọng cháu gái có thể thổ lộ tâm tư của bản thân, truyền tải thông điệp sống tích cực nhất đến những người chung hoàn cảnh\", anh nói.</p><p>Về phần Hoàng Anh, cô bé vẫn hay thủ thỉ với cậu: \"Cậu Đạt ráng nuôi và cho con đi học nha. Khi lớn Hoàng Anh sẽ kiếm nhiều tiền để cậu chữa bệnh và nuôi cậu\".</p><p>Thương cháu, chàng trai 22 tuổi dặn lòng phải dành những điều tốt nhất cho cháu. \"Tôi chẳng biết bệnh tình của mình có thể trụ đến lúc cháu gái 18 tuổi hay không, nhưng còn sống, còn sức khỏe tôi không để Hoàng Anh thiếu thốn như lời hứa với bà ngoại\", Đạt bộc bạch.</p>', 1, '2022-08-26 09:24:42', '2022-08-27 00:30:38'),
(3, 1, 'Muôn kiểu chăm da - Sale bao la 30%', 'muon-kieu-cham-da-sale-bao-la-30', '1661531172.png', '<p>Bộ Giáo dục và Đào tạo khuyên thí sinh bình tĩnh khắc phục các vấn đề khi nộp lệ phí trực tuyến theo hướng dẫn, các lỗi như bị trừ tiền được xử lý sau ngày 31/8.</p><p>Bà Đặng Thị Oanh, Phó cục trưởng Cục Công nghệ thông tin (Bộ Giáo dục và Đào tạo) cho biết đến khoảng 17h30 ngày 26/8, có hơn 159.000 thí sinh đã nộp lệ phí xét tuyển đại học trực tuyến thành công. Dù có khoảng 620.000 thí sinh nhập nguyện vọng, chỉ hơn 420.000 em có nguyện vọng xét bằng kết quả thi tốt nghiệp THPT phải đóng lệ phí. Bộ Giáo dục và Đào tạo không thu lệ phí với các nguyện vọng xét tuyển sớm.</p><p>Như vậy, chỉ còn khoảng 261.000 thí sinh chưa nộp. Hầu hết số này thuộc 36 tỉnh, thành chưa được mở chức năng thanh toán trên hệ thống. \"Còn năm ngày nữa để nộp, với tần suất như hiện nay, thí sinh không phải lo là không thanh toán được\", bà Oanh nói.</p><p>Trước những trục trặc khi nộp lệ phí xét tuyển đại học do thí sinh phản ánh như không thể thanh toán, mạng lag, bà Oanh khuyên thí sinh nên bình tĩnh và thực hiện lại theo hướng dẫn của Bộ Giáo dục và Đào tạo. Bà lấy ví dụ có thí sinh chia sẻ 0h đêm vào hệ thống vẫn bị lag. Trường hợp này có thể do khi đó hệ thống mở chức năng thanh toán cho các tỉnh, thành mới khiến lượng thí sinh truy cập đông hoặc do đường truyền Internet của thí sinh không tốt.</p><p>Với trường hợp thí sinh thấy thanh toán thành công, bị trừ tiền trong tài khoản nhưng hệ thống không ghi nhận, sau đó thanh toán tiếp và bị trừ tiền lần thứ hai, các em sẽ được hoàn tiền sau ngày 31/8 khi các ngân hàng trung gian đối soát xong.</p><p>Theo bà Oanh, lỗi này không chỉ khi nộp lệ phí xét tuyển đại học mà với các giao dịch ngân hàng bình thường cũng có thể gặp. Tuy nhiên, do số lượng giao dịch từ thí sinh cùng một lúc lớn, các ngân hàng cần nhiều thời gian hơn để đối soát.</p><p>Có nhiều thí sinh ở một số tỉnh, thành chưa đến thời gian quy định nộp lệ phí nhưng đã lỡ nhấn thanh toán và được báo thành công. Với trường hợp này, bà Oanh khẳng định như vậy là đã hoàn thành.</p><p>\"Chúng tôi đã tính toán số lượng thí sinh, phân luồng các tỉnh, thành thanh toán theo sáu mốc thời gian. Tuy nhiên khi có ít em truy cập, hệ thống sẽ mở sớm các tỉnh, thành phía sau để thí sinh vào sớm vẫn có thể thanh toán\", bà Oanh chia sẻ.</p><p>Đại diện Cục Công nghệ thông tin (Bộ Giáo dục và Đào tạo) khẳng định sau ngày 31/8, nếu vẫn còn thí sinh gặp trục trặc và chưa thể thanh toán, Bộ sẽ có thông báo hỗ trợ như tiếp tục mở hệ thống để các em được đảm bảo quyền lợi.</p><p>Năm nay, khoảng 620.000 thí sinh xét tuyển đại học. Đây là năm đầu tiên thí sinh đăng ký nguyện vọng trực tuyến sau khi biết điểm thi tốt nghiệp THPT và cũng là lần đầu ngành giáo dục tổ chức thanh toán lệ phí xét tuyển bằng hình thức trực tuyến. So với thông báo ban đầu, Bộ Giáo dục và Đào tạo đã hai lần điều chỉnh lịch đăng ký theo hướng phân luồng ngày càng rõ hơn nhằm tránh quá tải.</p>', 1, '2022-08-26 09:26:12', '2022-08-27 00:30:37'),
(4, 1, 'Trẻ hóa làn da- Nhà quà 540k', 'tre-hoa-lan-da-nha-qua-540k', '1661531252.jpg', '<p>Bộ trưởng Nguyễn Hồng Diên cho biết nguồn cung thế giới và trong nước đều không thiếu nên thông tin thị trường khan hiếm xăng dầu là vô lý.</p><p>Để dẫn chứng cho khẳng định này, tại cuộc họp về bảo đảm nguồn cung xăng dầu, ngày 26/8, Bộ trưởng Công Thương Nguyễn Hồng Diên, cho biết, với khả năng cung ứng nguồn cung ứng từ hai nhà máy Bình Sơn và Nghi Sơn (3,3 triệu m3 xăng dầu trong quý III và 4,4 triệu m3 vào quý IV), cộng thêm nguồn nhập khẩu, từ nay tới cuối năm không thiếu nguồn cung.</p><p>\"Thế giới đang cần bán, bán với giá rẻ, Việt Nam thì giảm thuế nên giá cũng rẻ. Như vậy, nguồn cung của thế giới lẫn trong nước lúc này không thiếu. Nếu thiếu, rõ ràng đó là những hiện tượng không bình thường và cần phải xử lý\", Bộ trưởng Công Thương nhận xét.</p><p>Cuộc họp này diễn ra trong bối cảnh các đại lý, cửa hàng bán lẻ xăng dầu phản ánh vài ngày qua nhập hàng khó khăn và lỗ nặng vì bị cắt chiết khấu.</p><p>Tuy nhiên, phản ánh thực tế từ địa phương, đại diện một số Sở Công Thương như TP HCM, Kiên Giang, Cần Thơ, Đà Nẵng... cho biết, hệ thống phân phối của các doanh nghiệp đầu mối, thương nhân trên địa bàn vẫn đảm bảo nguồn hàng; không có hiện tượng cửa hàng bán lẻ xăng dầu phải đóng cửa, dừng hoạt động vì sự khan hiếm.</p><p>Ông Bùi Ngọc Bảo, Chủ tịch Hiệp hội Xăng dầu Việt Nam, cũng thông tin rà soát thực tế cho thấy không ghi nhận việc đứt gãy về nguồn.</p><p>Còn theo báo cáo của lực lượng quản lý thị trường, tại khu vực phía Nam, tới 25/8, có 4 cửa hàng đóng cửa do hết xăng dầu. So với số lượng hành chục nghìn cửa hàng trên toàn quốc, đây là số lượng ít, không phản ánh hết thực tế thị trường.</p><p>Đại diện Sở Công Thương Kiên Giang đề cập hiện tượng một số cửa hàng bán lẻ phản ánh chiết khấu hoa hồng giảm về 0, dẫn tới hệ thống khó khăn trong duy trì hoạt động kinh doanh.</p><p>Bộ trưởng Nguyễn Hồng Diên đồng tình việc cần xem xét lại toàn diện về mức chiết khấu, hoa hồng trong hệ thống, vì nếu không đảm bảo, các đại lý bán lẻ khó duy trì hoạt động. Song, ông đề nghị các Sở Công Thương địa phương làm rõ, rà soát lại.</p><p>Ông cũng nhấn mạnh quan điểm xử lý nghiêm những đơn vị kinh doanh vi phạm pháp luật. Chẳng hạn, quá trình thanh tra vừa qua Bộ này đã xử lý vi phạm hành chính, tước giấy phép nhập khẩu xăng dầu 1- 2 tháng của 7 doanh nghiệp do vi phạm quy định trong xuất nhập khẩu xăng dầu. Lãnh đạo Bộ Công Thương cũng phủ nhận chuyện tạm đình chỉ hoạt động nhập khẩu của 7 doanh nghiệp vi phạm trên ảnh hưởng tới nguồn cung.</p><p>Từ đầu năm đến nay, giá xăng trong nước đã qua 22 kỳ điều chỉnh, trong đó 12 lần tăng, 8 lần giảm và 1 lần giữ nguyên giá bán. So với cuối tháng 6, mỗi lít RON 95-III rẻ hơn khoảng 8.210 đồng; E5 RON 92 hạ 7.580 đồng; dầu diesel giảm hơn 6.200 đồng.</p><p>Giá xăng hiện đã trở lại ngưỡng ngang bằng cuối năm ngoái và tháng 1 đầu năm nay, tức trước thời điểm xảy ra xung đột Nga - Ukraine. Nhưng với diễn biến giá thành phẩm thế giới tuần qua đi lên, vượt 110 USD một thùng và dự báo tới đây neo ở ngưỡng cao, nhiều khả năng kỳ điều hành giá tiếp theo, giá nhiên liệu trong nước khó giữ ổn định như hiện nay.</p><p>Với tính chất liên thông với thị trường nhiên liệu quốc tế, ông Bùi Ngọc Bảo cho rằng, năm nay là một năm tương đối dị biệt của doanh nghiệp kinh doanh xăng dầu khi thị trường, giá cả diễn biến quá phức tạp khiến họ lúc lỗ, lúc lãi. Giá thế giới sau thời kỳ giảm, hiện đã tăng vọt trở lại, chủ yếu ở mặt hàng dầu diesel trước xu hướng dịch chuyển sử dụng khí thay thế cho dầu tại các nước châu Âu.</p><p>Mặt khác, kỳ điều hành giá tới đây do trùng dịp nghỉ lễ 2/9, nên có thể kéo dài tới ngày 5/9 mới điều chỉnh, tức thời gian giữa 2 kỳ điều hành là 15 ngày. Giá thế giới đi lên, chu kỳ điều chỉnh giá dài, nếu không có giải pháp kịp thời, doanh nghiệp xăng dầu sẽ thêm lỗ, khó khăn trong kinh doanh.</p><p>Ông đề nghị Bộ Công Thương, Tài chính sớm xem xét, phản ánh chi phí, phụ phí xăng dầu trong nước (từ nhà máy lọc dầu về tới kho của doanh nghiệp đầu mối) vào cơ cấu giá bán lẻ, nhằm phản ánh đúng chi phí thực tế. Việc này giúp doanh nghiệp có thêm phần điều chỉnh chiết khấu, đủ bù đắp chi phí kinh doanh.</p><p>Ở khía cạnh này, ông Trần Duy Đông, Vụ trưởng Vụ Thị trường trong nước cho biết, cơ quan này sẽ đề nghị Bộ Tài chính sớm xem xét.</p><p>Bên cạnh đó, tín dụng với doanh nghiệp xăng dầu hiện chỉ đáp ứng 50% nhu cầu, trong khi nhập khẩu tăng, cần nguồn ngoại tệ tăng tương ứng. Bộ Công Thương cho biết, sẽ đề nghị Ngân hàng Nhà nước chỉ đạo ngân hàng thương mại tháo gỡ vướng mắc về tín dụng, theo hướng nới hạn mức.</p><p>Ngoài ra, để đảm bảo nguồn cung, ổn định thị trường, cơ quan này đã yêu cầu những doanh nghiệp hết thời hạn bị tạm tước giấy phép nhập khẩu, nhanh chóng nối lại hoạt động kinh doanh.</p><p>Các doanh nghiệp đầu mối khác được đề nghị tăng nguồn nhập khẩu để đảm bảo tổng nguồn không thiếu. Các doanh nghiệp đầu mối, thương nhân phân phối chia sẻ lợi nhuận hài hoà, để mức chiết khấu đủ lớn giúp đại lý bán lẻ đủ chi phí kinh doanh.</p>', 1, '2022-08-26 09:27:32', '2022-08-27 00:30:36');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `invoices`
--

CREATE TABLE `invoices` (
  `id` int(10) UNSIGNED NOT NULL,
  `orderID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `invoices`
--

INSERT INTO `invoices` (`id`, `orderID`, `productID`, `qty`, `price`, `created_at`, `updated_at`) VALUES
(20, 12, 28, 1, 360000, '2022-08-28 13:22:44', NULL),
(21, 12, 25, 1, 248000, '2022-08-28 13:22:44', NULL),
(22, 12, 22, 1, 310000, '2022-08-28 13:22:44', NULL),
(23, 13, 4, 5, 500000, '2022-08-28 23:11:19', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(34, '2014_10_12_100000_create_password_resets_table', 1),
(35, '2019_08_19_000000_create_failed_jobs_table', 1),
(36, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(37, '2022_08_22_155635_create_categories_table', 1),
(38, '2022_08_22_155802_create_products_table', 1),
(39, '2022_08_22_160051_create_admins_table', 1),
(40, '2022_08_24_063154_create_policies_table', 1),
(41, '2022_08_24_193636_create_events_table', 1),
(42, '2022_08_25_100503_create_contacts_table', 1),
(44, '2022_08_28_053259_create_carts_table', 2),
(51, '2022_08_28_101034_create_orders_table', 3),
(52, '2022_08_28_101752_create_invoices_table', 3),
(55, '2014_10_12_000000_create_users_table', 4);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `userID` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `delivery` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `userID`, `name`, `phone`, `address`, `note`, `delivery`, `total`, `status`, `created_at`, `updated_at`) VALUES
(12, 1, 'Trần Hoàng Đăng', '0123456789', '19, Nguyễn Hữu Thọ, Tân Phong', NULL, 0, 918000, 0, '2022-08-28 13:22:44', NULL),
(13, 1, 'Trân Hoàng Đăng', '0123456789', '19, Tân Mỹ', NULL, 0, 2500000, 0, '2022-08-28 23:11:19', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `policies`
--

CREATE TABLE `policies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` tinyint(4) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `policies`
--

INSERT INTO `policies` (`id`, `name`, `slug`, `type`, `content`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 'Về chúng tôi', 've-chung-toi', 1, '<p>1. Tên đầy đủ: <strong>Công ty Cổ phần Văn hóa Đông A (Dong A Books, JSC)</strong></p><p>2. Trụ sở chính: 113 Đông Các, P. Ô Chợ Dừa, Q. Đống Đa, Hà Nội.&nbsp;</p><p>&nbsp; &nbsp; Tel: (024) 3856 9381. Fax: (024) 856 9367</p><p>3. Văn phòng&nbsp;đại diện&nbsp;tại TP Hồ Chí Minh: 209 Võ Văn Tần, P.5, Q.3, Tp. Hồ Chí Minh&nbsp;</p><p>&nbsp; &nbsp;Tel: (028) 3929 1286. Fax: (028) 3929 1284</p><p>4. Showroom: Gian hàng Đông A, Đường sách Nguyễn Văn Bình, Q.1, Tp. Hồ Chí Minh</p><p>&nbsp; Tel: (028) 3521 0690&nbsp;</p><p>5. Website:&nbsp;http://www.sachdonga.vn/&nbsp;</p><p>6. Fanpage:&nbsp;https://www.facebook.com/dongabook/</p><p>7. Email:&nbsp;<a href=\"mailto:dtdtdonga@gmail.com\"></a>dongabooks.vn@gmail.com</p><p><strong>ĐỐI TÁC VÀ BẢN QUYỀN QUỐC TẾ:</strong></p><p>Từ khi thành lập cho đến nay, Đông A đã liên kết với các nhà xuất bản lớn như NXB Hội nhà văn, NXB Văn học, NXB Dân Trí, NXB Trẻ, NXB Kim Đồng, NXB Mỹ Thuật... để cho ra đời hơn 1500 đầu sách và phát hành hàng ngàn đầu sách khác nhờ vào hệ thống phát hành rộng rãi.</p><p>Về mặt bản quyền, kể từ khi Việt Nam gia nhập công ước Bern, Đông A đã thiết lập quan hệ và mua bản quyền với nhiều nhà xuất bản lớn trên thế giới như Hemma, King Fisher, Dami, Dorling Kindersley, Bắc Kinh... để mang đến các đầu sách giá trị mà điển hình là Tủ sách bách khoa tri thức và phát triển tư duy dành cho trẻ em được nhiều độc giả đón nhận.</p><p><strong>CÁC ĐẾ TÀI SÁCH CHÍNH</strong></p><p>Mặc dù trải rộng trên nhiều lĩnh vực từ Khoa học, Văn hóa, Kinh doanh cho đến Thể thao nhưng Đông A tập trung vào hai mảng lớn là sách Văn học trong nước và sách Thiếu nhi.&nbsp;</p><p>Trong lĩnh vực sách văn học trong nước, thương hiệu&nbsp;<i>Văn Mới</i>&nbsp;của Đông A đã đi vào tâm thức của độc giả yêu văn học Việt Nam và liên tục đoạt được các giải thưởng như Giải thưởng Hội nhà văn năm 2004, Giải vàng sách đẹp năm 2005 và Giải thưởng Hội nhà văn năm 2007 cho tác phẩm&nbsp;<i>Utopi - một miếng để đời</i>&nbsp;của nhà văn Vũ Bão. Cho đến nay, tủ sách văn mới vẫn tiếp tục được phát hành đều đặn mỗi năm để đáp lại sự tri ân của độc giả yêu mến Văn mới Đông A cũng như yêu văn chương Việt Nam nói chung.</p><p>Trong lĩnh vực sách thiếu nhi, với thương hiệu&nbsp;<i>Picture books</i>, một mặt Đông A giới thiệu kho tàng cổ tích đặc sắc của Việt Nam và thế giới giúp các em biết và hiểu đến văn học dân gian - một nguồn chảy ngọt ngào và bất tận trong trí tuệ văn hóa nhân loại, mặt khác Đông A hướng tới việc phát triển tư duy trẻ em thông qua các tủ sách phong phú về nội dung, đa dạng về hình thức mà điển hình là Tủ sách bách khoa tri thức dành cho trẻ em vô cùng lý thú như:&nbsp;<i>Mười vạn câu hỏi vì sao? Bách khoa tri thức cho trẻ em- câu hỏi và trả lời, Bách khoa động vật cho trẻ em, Khám phá thế giới Động Vật, Hỏi đáp kiến thức phổ thông, Tri thức bách khoa bằng hình, Bách khoa tri thức cho trẻ em- Khám phá và sáng tạo...</i>. Bên cạnh đó, với nội dung phong phú, hình thức đa dạng và đặc biệt là ứng dụng những phương pháp giáo dục tiên tiến, các bộ sách phát triển tư duy của Đông A cũng được đông đảo phụ huynh hết sức ưa chuộng như các bộ Tập tô màu,&nbsp;<i>Em học tiếng Anh bằng hình ảnh</i>&nbsp;hay&nbsp;<i>Cửa sổ nhìn ra thế giới, phát triển tư duy trẻ em, phát triển IQ cho trẻ em, thử tài IQ...</i></p><p>Công ty văn hóa Đông A đã và đang xây dựng hình ảnh đẹp trong lòng nhiều độc giả với những cuốn sách thực sự bổ ích và giá trị!</p>', 1, NULL, '2022-08-26 10:28:13'),
(2, 'Chính sách đổi trả', 'chinh-sach-doi-tra', 2, '<p><strong>1. Điều kiện đổi trả</strong></p><p>Quý Khách hàng cần kiểm tra tình trạng hàng hóa và có thể đổi hàng/ trả lại hàng&nbsp;ngay tại thời điểm giao/nhận hàng&nbsp;trong những trường hợp sau:</p><ul><li>Hàng không đúng chủng loại, mẫu mã trong đơn hàng đã đặt hoặc như trên website tại thời điểm đặt hàng.</li><li>Không đủ số lượng, không đủ bộ như trong đơn hàng.</li><li>Tình trạng bên ngoài bị ảnh hưởng như rách bao bì, bong tróc, bể vỡ…</li></ul><p>&nbsp;Khách hàng có trách nhiệm trình giấy tờ liên quan chứng minh sự thiếu sót trên để hoàn thành việc&nbsp;hoàn trả/đổi trả hàng hóa.&nbsp;</p><p>&nbsp;</p><p><strong>2. Quy định về thời gian thông báo và gửi sản phẩm đổi trả</strong></p><ul><li><strong>Thời gian thông báo đổi trả</strong>:&nbsp;trong vòng 48h kể từ khi nhận sản phẩm đối với trường hợp sản phẩm thiếu phụ kiện, quà tặng hoặc bể vỡ.</li><li><strong>Thời gian gửi chuyển trả sản phẩm</strong>: trong vòng 14 ngày kể từ khi nhận sản phẩm.</li><li><strong>Địa điểm đổi trả sản phẩm</strong>: Khách hàng có thể mang hàng trực tiếp đến văn phòng/ cửa hàng của chúng tôi hoặc chuyển qua đường bưu điện.</li></ul><p>Trong trường hợp Quý Khách hàng có ý kiến đóng góp/ khiếu nại liên quan đến chất lượng sản phẩm, Quý Khách hàng vui lòng liên hệ đường dây chăm sóc khách hàng&nbsp;của chúng tôi theo số <strong>Điện thoại: 024.38569367</strong></p>', 1, NULL, '2022-08-26 10:28:42'),
(3, 'Điều khoản dịch vụ', 'dieu-khoan-dich-vu', 3, '<p><strong>1. Giới thiệu</strong></p><p>Chào mừng quý khách hàng đến với website của CTY Sách Đông A</p><p>Khi quý khách hàng truy cập vào trang website của chúng tôi có nghĩa là quý khách đồng ý với các điều khoản này. Trang web có quyền thay đổi, chỉnh sửa, thêm hoặc lược bỏ bất kỳ phần nào trong Điều khoản mua bán hàng hóa này, vào bất cứ lúc nào. Các thay đổi có hiệu lực ngay khi được đăng trên trang web mà không cần thông báo trước. Và khi quý khách tiếp tục sử dụng trang web, sau khi các thay đổi về Điều khoản này được đăng tải, có nghĩa là quý khách chấp nhận với những thay đổi đó.</p><p>Quý khách hàng vui lòng kiểm tra thường xuyên để cập nhật những thay đổi của chúng tôi.</p><p><strong>2. Hướng dẫn sử dụng website</strong></p><p>Khi vào web của chúng tôi, khách hàng phải đảm bảo đủ 18 tuổi, hoặc truy cập dưới sự giám sát của cha mẹ hay người giám hộ hợp pháp. Khách hàng đảm bảo có đầy đủ hành vi dân sự để thực hiện các giao dịch mua bán hàng hóa theo quy định hiện hành của pháp luật Việt Nam.</p><p>Trong suốt quá trình đăng ký, quý khách đồng ý nhận email quảng cáo từ website. Nếu không muốn tiếp tục nhận mail, quý khách có thể từ chối bằng cách nhấp vào đường link ở dưới cùng trong mọi email quảng cáo.</p><p><br>&nbsp;</p><p><strong>3. Thanh toán an toàn và tiện lợi</strong></p><p>Người mua có thể tham khảo các phương thức thanh toán sau đây và lựa chọn áp dụng phương thức phù hợp:</p><p><strong>Cách 1</strong>: Thanh toán trực tiếp (người mua nhận hàng tại địa chỉ người bán)<br><strong>Cách 2:</strong>&nbsp;Thanh toán sau (COD – giao hàng và thu tiền tận nơi)<br><strong>Cách 3:</strong>&nbsp;Thanh toán online qua thẻ tín dụng, chuyển khoản</p>', 1, NULL, '2022-08-26 10:29:01'),
(4, 'Hướng dẫn mua hàng', 'huong-dan-mua-hang', 4, '<p>Quý Khách hàng có thể chọn một trong hai cách sau:<br><br><strong>Cách thứ nhất:&nbsp;</strong></p><p>Gọi điện thoại đến số hotline&nbsp;028. 39291285 nhân viên của công ty sẽ tư vấn và hỗ trợ cho khác hàng tất cả các thông tin về sản phẩm và dịch vụ..<br><br><strong>Cách thứ hai:&nbsp;</strong></p><p>Đặt hàng qua website:&nbsp;</p><p><br>Bước 1: Bấm vào nút “mua hàng” để đưa sản phẩm vào giỏ hàng sau khi đã lựa chọn sản phẩm mình muốn mua</p><p><br>Bước 2: Sau khi chọn xong sản phẩm đặt mua, điền các thông tin theo yêu cầu của chúng tôi: size, màu sắc, số lượng ….</p><p><br>Bước 3: Bấm nút “Gửi”</p><p><br>Đơn hàng của bạn đã hoàn tất và được chuyển tới chúng tôi. Chúng tôi&nbsp; sẽ xử lý và liên lạc lại với bạn để thực hiện giao dịch.</p>', 1, NULL, '2022-08-26 10:29:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `adminID` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categoryID` int(11) NOT NULL,
  `brand` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `origin` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `skin` tinyint(4) NOT NULL DEFAULT 0,
  `exp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `sold` int(11) NOT NULL DEFAULT 0,
  `view` int(11) NOT NULL DEFAULT 0,
  `is_active` tinyint(4) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `adminID`, `name`, `slug`, `categoryID`, `brand`, `origin`, `skin`, `exp`, `description`, `image`, `price`, `qty`, `sold`, `view`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 1, 'Tinh chất dưỡng ẩm cô đặc từ trà xanh và dầu hạt trà xanh tươi Jeju Innisfree The Green Tea Seed Serum 80ml - NEW', 'tinh-chat-duong-am-co-dac-tu-tra-xanh-va-dau-hat-tra-xanh-tuoi-jeju-innisfree-the-green-tea-seed-serum-80ml-new', 1, 'Innisfree', 'Hàn Quốc', 1, '36 tháng kể từ ngày sản xuất', '<p>TINH CHẤT TRÀ XANH DƯỠNG ẨM INNISFREE GREEN TEA SEED SERUM 80ML</p><p>&nbsp;</p><p>Tinh chất Green Tea Seed Serum 4.0 với công thức trà xanh cải tiến, tăng cường củng cố hàng rào bảo vệ và dưỡng ẩm chuyên sâu, cho làn da mọng nước chuẩn Hàn.</p><p>&nbsp;</p><p>THÔNG TIN SẢN PHẨM</p><p>&nbsp;</p><p>Thành phần &amp; Công dụng</p><p>&nbsp;</p><p>1. Xây dựng 92.3% hàng rào dưỡng ẩm chỉ trong 30 phút sử dụng(*)</p><p>Green Tea Seed Serum với công nghệ cấp nước độc quyền, củng cố hàng rào dưỡng ẩm để bảo vệ da khỏi những tổn thương do thiếu nước và cải thiện hệ cân bằng ẩm cho làn da sáng khỏe.</p><p>(**) Những tổn thương trên da do thiếu nước: Khô và căng da, da sần, kém mịn màng và kém săn chắc do những yếu tố chủ quan lẫn khách quan.</p><p>&nbsp;</p><p>2. Tăng cường độ ẩm cho da sáng khoẻ</p><p>Tinh chất cấp nước chuyên sâu, bổ sung kịp thời lượng nước cho da với nước trà xanh tươi Fresh Green Tea Water và 05 loại Hyaluronic Acid dưỡng ẩm từ đậu nành Jeju. Làn da ẩm mượt hơn 710% chỉ sau 1 lần sử dụng.</p><p>&nbsp;</p><p>3. Tăng cường hiệu quả làm dịu da</p><p>Hỗ trợ làm dịu da, phù hợp cho làn da dễ kích ứng</p><p>(**)Non-comedogenic tested</p><p>&nbsp;</p><p>4. Thiết kế thân thiện môi trường</p><p>Cải tiến với thiết kế vặn đầu chai thông minh, không nắp cài và thân thiện môi trường nhờ giảm 13.8% lượng nhựa trong bao bì so với Green Tea Seed Serum 80ml phiên bản cũ.</p><p>&nbsp;</p><p>(*) Evaluation of Skin Barrier Damage Repair</p><p>- Test Agency: Global Medical Research Center</p><p>- Subjects: Female aged 20-49 (n=31)</p><p>- Period: November 16-20, 2020</p><p>&nbsp;</p><p>Hướng dẫn sử dụng</p><p>- Sau khi rửa mặt, lấy một lượng thích hợp rồi nhẹ nhàng thoa đều lên mặt và cổ.</p><p>[Thứ tự sử dụng] Serum - Skin hoặc Essence-in-Lotion - Kem dưỡng vùng da quanh mắt - Kem dưỡng</p><p>&nbsp;</p><p>Lưu ý</p><p>1. Chỉ sử dụng ngoài da.</p><p>2. Tránh tiếp xúc trực tiếp với mắt. Rửa sạch ngay với nước nếu xảy ra trường hợp này.</p><p>3. Ngưng sử dụng sản phẩm ngay nếu có dấu hiệu bất thường.</p><p>4. Tránh xa tầm tay trẻ em.</p>', '1661531644.jpg', 630000, 10, 0, 0, 1, '2022-08-26 09:34:04', '2022-08-27 00:25:33'),
(2, 1, 'Kem chống nắng nâng tông innisfree Tone Up Watering Sunscreen SPF 50+ PA++++ 50ml - 131173190x', 'kem-chong-nang-nang-tong-innisfree-tone-up-watering-sunscreen-spf-50-pa-50ml-131173190x', 1, 'Innisfree', 'Hàn Quốc', 1, '3 năm kể từ ngày sản xuất', '<p>Thành phần &amp; công dụng</p><p>1. Bảo vệ da mạnh mẽ</p><p>Kem chống nắng, với chỉ số SPF 50+ PA++++, giúp bảo vệ da mạnh mẽ. Kết cấu kem mỏng nhẹ, nhanh thấm vào da. Phù hợp cho mọi loại da, từ da khô, da hỗn hợp, đến da dầu.</p><p>&nbsp;</p><p>2. Nâng tông tự nhiên và dưỡng sáng từ bên trong</p><p>Kem chống nắng có kết cấu mỏng nhẹ và tiệp vào da, mang đến hiệu ứng nâng tông tự nhiên, có thể thay thế kem nền để có lớp trang điểm tự nhiên. Đồng thời, kem giúp dưỡng sáng từ bên trong và làm đều màu da nhờ dẫn xuất vitamin C.</p><p>&nbsp;</p><p>3. Tạo lớp nền sáng trong và mọng nước</p><p>Để tối giản hóa quy trình trang điểm, có thể dùng kem chống nắng làm lớp nền trang điểm, đặc biệt vào mùa hè hay khi phải mang khẩu trang thường xuyên. Kem chống nắng mang đến lớp nền sáng trong, mỏng nhẹ và vô cùng ẩm mượt.</p><p>&nbsp;</p><p>Hướng dẫn sử dụng</p><p>- Sản phẩm được sử dụng ở bước cuối cùng của chu trình chăm sóc da cơ bản.</p><p>- Lấy một lượng thích hợp và thoa đều lên vùng da mặt, cổ, tay, chân,… là những nơi dễ tiếp xúc với tia UV.</p><p>&nbsp;</p><p>Lưu ý</p><p>1. Chỉ sử dụng ngoài da.</p><p>2. Tránh tiếp xúc trực tiếp với mắt.</p><p>3. Rửa sạch ngay với nước nếu tiếp xúc trực tiếp với mắt.</p><p>4. Ngưng sử dụng sản phẩm và tham khảo ngay ý kiến bác sĩ khi thấy có dấu hiệu bất thường.</p><p>5. Tránh xa tầm tay trẻ em.</p>', '1661531775.jpg', 360000, 100, 0, 0, 1, '2022-08-26 09:36:15', '2022-08-27 00:25:34'),
(3, 1, 'Kem dưỡng ẩm từ trà xanh đảo Jeju Innisfree Green Tea Balancing Cream EX 50ml - NEW', 'kem-duong-am-tu-tra-xanh-dao-jeju-innisfree-green-tea-balancing-cream-ex-50ml-new', 1, 'Innisfree', 'Hàn Quốc', 1, '3 năm', '<p>Thành phần &amp; Công dụng</p><p>1. Giàu độ ẩm từ trà xanh dưỡng da Beauty Green Tea</p><p>Sinh ra dành riêng cho làn da, Beauty Green Tea được chọn lọc từ hơn 2,401 giống trà xanh Hàn Quốc. Thành phần dưỡng ẩm chuyên biệt này chứa 16 loại amino acid khác nhau, đậm đặc gấp 3.5 lần so với trà xanh thông thường. Đặc biệt, nước trà xanh tươi Green Tea Water 2.0™ được cải tiến nhờ công nghệ Dual-Moisture-Rising™ để lưu giữ dưỡng chất trọn vẹn.</p><p>&nbsp;</p><p>2. Mở lại đường nước và cân bằng độ ẩm cho da</p><p>Phục hồi làn da mất nước, giúp làm da sáng, ẩm và mịn màng với trà xanh dưỡng da Beauty Green Tea.</p><p>&nbsp;</p><p>3. Hình thành màng dưỡng ẩm mỏng nhẹ</p><p>Kết cấu sánh mịn như kem và tạo màng dưỡng ẩm nhờ chiết xuất bơ hạt ca cao, giữ da luôn mềm mại, ẩm mượt.</p><p>&nbsp;</p><p>Hướng dẫn sử dụng</p><p>- Lấy một lượng thích hợp rồi nhẹ nhàng thoa đều lên mặt và cổ.</p><p>- Trình tự sử dụng: Tẩy trang - Sữa rửa mặt - Tinh chất - Nước cân bằng - Sữa dưỡng kết hợp tinh chất - Sữa dưỡng - Kem mắt - Kem dưỡng</p><p>&nbsp;</p><p>Lưu ý</p><p>1. Ngưng sử dụng sản phẩm khi thấy da có dấu hiệu bất thường.</p><p>2. Luôn đóng nắp sau khi sử dụng.</p><p>3. Dùng ngay sau khi mở nắp.</p>', '1661531875.jpg', 420000, 100, 0, 5, 1, '2022-08-26 09:37:55', '2022-08-27 00:34:46'),
(4, 1, 'Kem Dưỡng Ẩm Sáng Da Từ Hoa Anh Đào Đảo Jeju Innisfree Cherry Blossom Tone Up Cream 50Ml - 131171021', 'kem-duong-am-sang-da-tu-hoa-anh-dao-dao-jeju-innisfree-cherry-blossom-tone-up-cream-50ml-131171021', 1, 'Innisfree', 'Hàn Quốc', 1, '3 năm kể từ ngày sản xuất.', '<p>Thành phần &amp; Công dụng</p><p>1. Làm sáng da hiệu quả với Jeju Cherry Blossom, không gây mỏng da</p><p>Khả năng dưỡng sáng hiệu quả của chiết xuất cánh hoa anh đào Jeju được nâng tầm bằng phương pháp ủ lạnh với nước biển lava đảo Jeju trong 3 tuần. Làn da hấp thụ tinh hoa dưỡng chất sẽ trở nên tươi sáng, trong veo và tràn đầy sức sống.</p><p>&nbsp;</p><p>2. Cung cấp và duy trì độ ẩm cho làn da mịn màng, không còn khô ráp</p><p>Bổ sung thêm Betaine từ củ dền với khả năng dưỡng ẩm dồi dào, mang đến vẻ mềm mại, mịn màng và căng mọng cho làn da.</p><p>&nbsp;</p><p>3. Dạng thạch tươi mát</p><p>Kết cấu dạng thạch thoáng nhẹ trên da, tạo lớp màng dưỡng ẩm và mang lại cảm giác dễ chịu.</p><p>&nbsp;</p><p>Tips</p><p>- Kết hợp cùng với Cherry Blossom Tone Up Cream (tuỳ theo tỉ lệ) cho làn da thêm ẩm mượt rạng rỡ.</p><p>&nbsp;</p><p>Hướng dẫn sử dụng</p><p>- Sau bước sữa dưỡng, thoa một lượng thích hợp lên mặt và cổ. Vỗ nhẹ để tăng khả năng thẩm thấu.</p><p>&nbsp;</p><p>Lưu ý</p><p>1. Chỉ sử dụng ngoài da.</p><p>2. Tránh tiếp xúc trực tiếp với mắt.</p><p>3. Rửa sạch ngay với nước nếu sản phẩm tiếp xúc với mắt.</p><p>4. Ngưng sử dụng và tham khảo ngay ý kiến bác sĩ nếu có dấu hiệu bất thường.</p><p>5. Tránh xa tầm tay trẻ em.</p>', '1661531981.jpg', 500000, 10, 5, 97, 1, '2022-08-26 09:39:41', '2022-08-28 23:38:17'),
(5, 1, 'Nước tẩy trang từ trà xanh đảo Jeju Innisfree Green Tea Cleansing Water 300ml - NEW', 'nuoc-tay-trang-tu-tra-xanh-dao-jeju-innisfree-green-tea-cleansing-water-300ml-new', 1, 'Innisfree', 'Hàn Quốc', 1, '3 năm kể từ ngày sản xuất.', '<p>Thành phần &amp; Công dụng</p><p>1. Giàu độ ẩm từ trà xanh dưỡng da Beauty Green Tea</p><p>Sinh ra dành riêng cho làn da, Beauty Green Tea được chọn lọc từ hơn 2,401 giống trà xanh Hàn Quốc. Thành phần dưỡng ẩm chuyên biệt này chứa 16 loại amino acid khác nhau, đậm đặc gấp 3.5 lần so với trà xanh thông thường. Đặc biệt, nước trà xanh tươi Green Tea Water 2.0™ được cải tiến nhờ công nghệ Dual-Moisture-Rising™ để lưu giữ dưỡng chất trọn vẹn.</p><p>&nbsp;</p><p>2. Làn sạch tạp chất nhờ các hạt micelle</p><p>Hạt micelle hút sạch bụi bẩn và bã nhờn trên da, không cần rửa lại với nước.</p><p>&nbsp;</p><p>3. Dưỡng ẩm với trà xanh và rễ trà</p><p>Trà xanh kết hợp với rễ trà giàu saponin giúp dưỡng ẩm để da không bị khô và sảng khoái hơn sau khi tẩy trang.</p><p>&nbsp;</p><p>Hướng dẫn sử dụng</p><p>- Lấy một lượng thích hợp dung dịch vào bông tẩy trang rồi nhẹ nhàng lau sạch toàn mặt. Sau đó rửa sạch lại với nước.</p><p>- Trình tự sử dụng: Tẩy trang - Sữa rửa mặt - Tinh chất - Nước cân bằng - Sữa dưỡng kết hợp tinh chất - Sữa dưỡng - Kem mắt - Kem dưỡng</p><p>&nbsp;</p><p>Lưu ý</p><p>1. Ngưng sử dụng sản phẩm khi thấy da có dấu hiệu bất thường.</p><p>2. Luôn đóng nắp sau khi sử dụng.</p><p>3. Dùng ngay sau khi mở nắp.</p><p>4. Rửa sạch ngay với nước nếu sản phẩm tiếp xúc với mắt.</p>', '1661532064.jpg', 340000, 100, 0, 3, 1, '2022-08-26 09:41:04', '2022-08-28 23:37:24'),
(6, 1, 'Tinh Chất Phục Hồi Da Và Chống Lão Hóa Từ Trà Đen Innisfree Black Tea Youth Ampoule 30ml - 131172563', 'tinh-chat-phuc-hoi-da-va-chong-lao-hoa-tu-tra-den-innisfree-black-tea-youth-ampoule-30ml-131172563', 1, 'Innisfree', 'Hàn Quốc', 1, '3 năm kể từ ngày sx', '<p>Thành phần &amp; Công dụng</p><p>1. 10 năm nghiên cứu và chiết xuất trà đen kì công</p><p>Nguyên liệu sử dụng phương pháp lên men trà xanh tự nhiên trong vòng 10-12 giờ. Trà xanh sau khi được lên men ở mức 80% và ủ trong nước khoáng 80℃ trở thành trà đen cao cấp. Chiết xuất từ trà đen cao cấp với công nghệ độc quyền, hợp chất Reset Concentrate™ có khả năng chống oxy hóa và chống lão hóa vượt trội.</p><p>&nbsp;</p><p>2. Phục hồi làn da mệt mỏi ngay lần đầu sử dụng</p><p>Trà đen giàu catechin (giàu EECG) chống oxy hóa và ngăn ngừa lão hóa mạnh mẽ. Kiểm nghiệm lâm sàng chứng mình hiệu quả rõ rệt, reset các dấu hiệu mệt mỏi của làn da ngay lần đầu sử dụng tinh chất: Độ ẩm tăng 31.9%, độ săn chắc tăng 25.4%, da sáng hơn 4.7% và kết cấu da cải thiện 4.4%.</p><p>*Tested by: P&amp;K Skin Research Center / Test period: 2020.03.17 - 2020.04.22 / Subjects: 31 women aged 22-55</p><p>&nbsp;</p><p>3. Cơ chế bảo vệ làn da xuyên màn đêm Night Defense Formula™</p><p>So với ban ngày, làn da cần được chăm sóc đặc biệt hơn vào ban đêm để bù đắp lượng dầu - nước bị mất cân bằng. Chưa kể hàng rào bảo vệ da bị đe dọa, dẫn đến tình trạng khô da và đẩy nhanh quá trình lão hóa. Khi đó, làn da cần sự bảo vệ từ cơ chế Night Defense Formula™ với ba lớp dưỡng ẩm để tạo hàng rào giữ ẩm trong giấc ngủ:</p><p>- Lớp thứ 1: Cấp nước tức thì nhờ Sodium Hyaluronate &amp; Ceramide.</p><p>- Lớp thứ 2: Cung cấp và duy trì độ ẩm suốt đêm nhờ Glyceryl Polymethacrylate.</p><p>- Lớp thứ 3: Tạo hàng rào để tránh độ ẩm thất thoát nhờ Hydrogenated Lecithin và Squalene.</p><p>&nbsp;</p><p>Hướng dẫn sử dụng</p><p>- Lấy từ 3-5 giọt sản phẩm ra tay và thoa đều lên toàn mặt, sau đó để sản phẩm thẩm thấu hoàn toàn. Ở những vùng cần chăm sóc chuyên sâu, thoa thêm một lớp sản phẩm để tăng hiệu quả dưỡng da.</p><p>&nbsp;</p><p>Lưu ý</p><p>1. Chỉ sử dụng ngoài da.</p><p>2. Tránh tiếp xúc trực tiếp với mắt.</p><p>3. Rửa sạch ngay với nước nếu tiếp xúc trực tiếp với mắt.</p><p>4. Ngưng sử dụng sản phẩm và tham khảo ngay ý kiến bác sĩ khi thấy có dấu hiệu bất thường.</p><p>5. Tránh xa tầm tay trẻ em.</p>', '1661532136.jpg', 880000, 99, 1, 4, 1, '2022-08-26 09:42:16', '2022-08-28 06:46:27'),
(7, 1, 'Kem Dưỡng Da Tay Jeju Blending Tea Handcream 100ml', 'kem-duong-da-tay-jeju-blending-tea-handcream-100ml', 2, 'Innisfree', 'Hàn Quốc', 0, '3 năm kể từ NSX', '<p><strong>Thành phần, công dụng</strong></p><p>- Kem dưỡng da tay thơm thoang thoảng trên da và tỏa hương thơm của trà xanh mang lại cảm giác thư giãn, hạnh phúc trong cuộc sống hàng ngày .</p><p>- Bơ hạt mỡ và ô liu: Kem dưỡng có nguồn gốc tự nhiên được hấp thụ nhanh chóng vào da và tạo hàng rào giữ ẩm bảo vệ da mà không hề gây bết dính.</p><p>- Giữ ẩm trong một thời gian dài</p><p>- Da tay sáng mịn: Cảm nhận làn da mịn màng, sáng mịn với công thức ẩm, mềm mại và sáng bóng</p><p><strong>Sản phẩm gồm 3 hương:</strong></p><p>- 01: Daylight Rose Tea</p><p>- 02: Midnight Apricot Tea</p><p>- 03: Daylight Hoji Tea</p><p><strong>Thiết kế sản phẩm</strong></p><p>- Dung tích 100ml.</p><p>Phù hợp với mọi làn da.</p><p><strong>Hướng dẫn sử dụng</strong></p><p>- Cho lượng sản phẩm thích hợp thoa lên tay.</p><p>- Nhẹ nhàng massage để kem thấm nhanh</p><p>- Sử dụng bất cứ lúc nào thấy cần thiết.</p><p><strong>Hướng dẫn bảo quản</strong></p><p>- Đóng nắp sau khi sử dụng</p><p>- Không bảo quản nơi có nhiệt độ quá cao hoặc quá thấp, nơi có ánh sáng trực tiếp</p><p>- Bảo quản nơi thoáng mát</p>', '1661532320.jpg', 299000, 100, 0, 0, 1, '2022-08-26 09:45:20', '2022-08-27 00:25:38'),
(8, 1, 'Sữa tắm hương nước hoa innisfree My Perfumed Body Cotton Flower Body Cleanser 330ml - 131173057x', 'sua-tam-huong-nuoc-hoa-innisfree-my-perfumed-body-cotton-flower-body-cleanser-330ml-131173057x', 2, 'Innisfree', 'Hàn Quốc', 0, '3 năm', '<p>Thành phần &amp; Công dụng</p><p>1. Sữa tắm hương nước hoa thiên nhiên Jeju</p><p>Trải nghiệm thư giãn làn da với từng nốt hương nhẹ nhàng, lấy cảm hứng từ thiên nhiên Jeju. Hương thơm phong phú, đa dạng từ hương trái cây thanh mát đến hương hoa dịu ngọt, lưu hương dài lâu để làn da thơm ngát cả ngày.</p><p>&nbsp;</p><p>2. Làm sạch và dưỡng ẩm cho làn da mịn màng</p><p>Sữa tắm nhẹ nhàng làm sạch và nuôi dưỡng độ ẩm nhờ 3 loại bơ tự nhiên: Bơ hạt mỡ, bơ xoài và bơ cacao để da thêm mịn màng.</p><p>&nbsp;</p><p>3. Hương thơm dễ chịu, lưu hương dài lâu</p><p>- Grapefruit: Hương bưởi dịu ngọt</p><p>- Green Tangerine: Hương quýt thanh mát</p><p>- Water Lily: Hương hoa súng tao nhã</p><p>- Pink Muhly Grass: Hương cỏ hồng lãng mạn</p><p>- Cotton Flower: Hương hoa bông dịu nhẹ</p><p>&nbsp;</p><p>Hướng dẫn sử dụng</p><p>- Cho lượng sản phẩm thích hợp vào bông tắm, tạo bọt và nhẹ nhàng mát-xa toàn thân. Tắm sạch lại với nước.</p><p>&nbsp;</p><p>Lưu ý</p><p>1. Chỉ sử dụng ngoài da.</p><p>2. Tránh tiếp xúc trực tiếp với mắt.</p><p>3. Rửa sạch ngay với nước nếu tiếp xúc trực tiếp với mắt.</p><p>4. Ngưng sử dụng sản phẩm và tham khảo ngay ý kiến bác sĩ khi thấy có dấu hiệu bất thường.</p><p>5. Tránh xa tầm tay trẻ em.</p>', '1661532561.jpg', 290000, 100, 0, 0, 1, '2022-08-26 09:49:21', '2022-08-27 00:25:37'),
(9, 1, 'Sữa tắm dưỡng ẩm hương ô liu innisfree Olive Real Body Cleanser 131171209 (310ml)', 'sua-tam-duong-am-huong-o-liu-innisfree-olive-real-body-cleanser-131171209-310ml', 2, 'Innisfree', 'Hàn Quốc', 0, '3 năm', '<ul><li><strong>Sữa tắm dưỡng ẩm hương ô liu innisfree Olive Real Body Cleanser&nbsp; 131171209&nbsp;</strong> giúp làm sạch sâu, giảm thiểu bụi bẩn cho làn da bạn với các dưỡng chất giàu vitamin từ dầu olive vàng. Đem đến trải nghiệm ẩm mượt, mịn màng</li><li>Chiết xuất từ dầu “olive vàng” nguyên chất vùng Địa Trung Hải chứa thành phần chống ô xy hóa và dưỡng chất phong phú chống lão hoá, tăng độ mềm mượt cho làn da.</li><li>Cấp nước và dưỡng ẩm sâu cho da không bị khô</li><li>Kết cấu dạng sữa hơi lỏng dễ tạo lớp bọt mịn làm sạch bề mặt da.</li><li>Mùi hương thoáng nhẹ của olive, dễ chịu và thư giãn.</li><li>Dạng chai nhựa màu xanh rêu, nắp chai có đầu bơm tiện dụng</li><li>Phù hợp da khô, da thiếu nước, da cần cấp ẩm sâu.</li></ul><p><strong>Hướng dẫn sử dụng</strong></p><ul><li>Làm ướt toàn thân.</li><li>Cho lượng sản phẩm thích hợp vào khăn hoặc bông tắm và tạo bọt.</li><li>Nhẹ nhàng massage toàn bộ cơ thể.</li><li>Rửa sạch lại bằng nước.</li></ul><p><strong>Hướng dẫn bảo quản</strong></p><ul><li>Đóng nắp sau khi sử dụng</li><li>Không bảo quản nơi có nhiệt độ quá cao hoặc quá thấp, nơi có ánh sáng trực tiếp</li></ul><p>Lưu ý: Rửa lại với nước ngay khi sản phẩm rơi vào mắt.</p>', '1661532764.jpg', 260000, 100, 0, 0, 1, '2022-08-26 09:52:44', '2022-08-27 00:25:47'),
(10, 1, 'Combo Serum dưỡng ẩm và chống lão hóa Senka Deep Moist 3X HA 30ml và Mặt nạ ngủ cấp ẩm chuyên sâu dạng gel Senka Deep Moist Gel Cream 50g', 'combo-serum-duong-am-va-chong-lao-hoa-senka-deep-moist-3x-ha-30ml-va-mat-na-ngu-cap-am-chuyen-sau-dang-gel-senka-deep-moist-gel-cream-50g', 1, 'Senka', 'Nhật Bản', 1, '3 năm kể từ ngày sản xuất', '<p>1) <strong>Serum dưỡng ẩm và chống lão hóa Senka Deep Moist 3X HA 30ml</strong> là dòng sản phẩm mới ra mắt đến từ thương hiệu Senka nổi tiếng lâu đời của Nhật Bản, chứa Hyaluronic Acid đậm đặc giúp cấp ẩm tức thì và tăng cường độ ẩm cho làn da suốt 24 giờ, hỗ trợ làm đầy các nếp nhăn, mang lại làn da căng mịn và rạng rỡ.</p><p>Thành phần chính:<br>- 3X Hyaluronic Acid<br>- Collagen<br>- Chiết xuất thiên nhiên Nhật Bản: Cám Gạo, Tơ Tằm Trắng, Mật Ong<br>- Không cồn - Không chất tạo màu - Không hương liệu</p><p>Công dụng:<br>- 2X Hyaluronic Acid: cấp ẩm sâu<br>- Hyaluronic Acid Vi Nang: chứa các hạt dưỡng ẩm siêu nhỏ thấm sâu vào tầng biểu bì, cung cấp trọn vẹn dưỡng chất và tối ưu hóa hiệu quả khóa ẩm trong thời gian dài, mang lại làn da trong mướt và căng mịn<br>- Chiết xuất Collagen chống oxy hóa cùng các thành phần thiên nhiên: Dầu Cám Gạo, Mật Ong, Tơ Tằm Trắng giúp da ẩm mượt, đàn hồi &amp; tươi trẻ</p><p>Loại da phù hợp<br>Mọi loại da, kể cả da nhạy cảm</p><p>Hướng dẫn sử dụng:<br>- Lấy một lượng sản phẩm vừa đủ lên lòng bàn tay và thoa đều khắp mặt &amp; cổ vào buổi sáng và tối.<br>- Sử dụng hằng ngày cho làn da căng mịn, ẩm mượt, đàn hồi và trong mướt.</p><p>Thông tin dị ứng:<br>- Không sử dụng cho vùng da bị tổn thương.<br>- Ngưng sử dụng ngay khi có biểu hiện kích ứng và hỏi ý kiến bác sĩ.</p><p>Hướng dẫn bảo quản:<br>- Lau sạch kem dính trên miệng hũ và đóng chặt nắp sau khi sử dụng.<br>- Không để úp sản phẩm.<br>- Tránh ánh sáng trực tiếp, nơi có nhiệt độ cao hoặc ẩm ướt.<br>- Cặn kem thừa xung quanh miệng hũ không ảnh hưởng đến chất lượng sản phẩm, chỉ cần lau sạch trước khi sử dụng.</p><p>&nbsp;</p><p>2) <strong>Mặt nạ ngủ cấp ẩm chuyên sâu dạng gel Senka Deep Moist Gel Cream 50g</strong></p><p>Thành phần:<br>- Công nghệ chuyển hóa Gel - nước: Chất gel trong mướt chuyển hóa thành các phân tử nước nhỏ, dễ dàng thấm sâu vào các lớp biểu bì, cấp nước và giữ ẩm cho từng tầng da, đem lại làn da mướt mịn như nhung.<br>- Công nghệ “Natu-ence” độc quyền từ Shiseido giúp nâng cao hiệu quả của các thành phần dưỡng da tự nhiên từ Nhật Bản (Collagen, Tơ Tằm Trắng, Cám Gạo, Mật Ong, Chiết xuất Chestnut Rose)<br>- Công nghệ Aqua-in-pool độc quyền từ Shiseido giúp bảo vệ màng ẩm tự nhiên và tăng cường hiệu quả cấp ẩm cho da<br>- Không Cồn – Không Mùi – Không Màu<br>- Dịu nhẹ - Không kích ứng</p><p>Công dụng:<br>- Dùng như mặt nạ ngủ: Giúp tạo thành “mặt nạ nước trong suốt” – vừa khóa ẩm tối ưu vừa lưu giữ các dưỡng chất từ các bước chăm sóc da trước đó.</p><p>Loại da phù hợp:<br>- Sản phẩm phù hợp với tất cả loại da</p><p>Hướng dẫn sử dụng:<br>- Lấy một lượng sản phẩm vừa đủ lên lòng bàn tay và thoa đều khắp mặt &amp; cổ.<br>- Sử dụng hằng ngày cho làn da căng mịn, ẩm mượt, đàn hồi và trong mướt.<br>- Đối với trường hợp sử dụng như mặt nạ ngủ, lấy một lượng gấp đôi tương đương kích thước 1 đồng xu, thoa đều khắp mặt và cổ. Sử dụng 2-3 lần/tuần nhằm mang lại hiệu quả tối ưu.</p><p>Lưu ý:<br>-Tránh sử dụng trên các vùng da bị tổn thương.<br>- Ngưng sử dụng nếu xảy ra kích ứng.<br>- Đặt xa tầm tay trẻ em.</p><p>Hướng dẫn bảo quản:<br>- Đóng chặt nắp sau khi sử dụng và không để úp sản phẩm.<br>- Tránh để nơi có nhiệt độ cao hoặc tiếp xúc trực tiếp với ánh nắng mặt trời.</p><p>Ngày sản xuất: Xem trên bao bì sản phẩm (Ngày/Tháng/Năm)<br>Hạn sử dụng: 3 năm kể từ NSX<br>Xuất xứ thương hiệu: Nhật Bản<br>Nơi sản xuất: Nhật Bản</p>', '1661533029.jpg', 610000, 100, 0, 6, 1, '2022-08-26 09:57:09', '2022-08-27 00:25:46'),
(11, 1, 'Gel rửa mặt tạo bọt làm sạch & giảm nhờn cho da dầu nhạy cảm La Roche-Posay Effaclar Purifying Foaming Gel (400ml)', 'gel-rua-mat-tao-bot-lam-sach-giam-nhon-cho-da-dau-nhay-cam-la-roche-posay-effaclar-purifying-foaming-gel-400ml', 1, 'La Roche-Posay', 'Pháp', 1, '3 năm kể từ ngày sử dụng', '<p><i><strong>Với mục tiêu chung tay bảo vệ môi trường, từ tuần 3 tháng 8 các sản phẩm của La Roche-Posay sẽ thay màng co bằng tem niêm phong trên nắp và đáy hộp.</strong></i></p><p><strong>Gel rửa mặt tạo bọt làm sạch &amp; giảm nhờn cho da dầu nhạy cảm La Roche-Posay Effaclar Purifying Foaming Gel 400ml</strong> sẽ giúp ngăn ngừa và hỗ trợ điều trị mụn tối đa với kết cấu dạng gel trong dễ dàng tạo bọt cùng công thức không chứa dầu, không cồn, an toàn cho làn da. Sản phẩm nhẹ nhàng làm sạch da từ sâu trong lỗ chân lông, loại bỏ bụi bẩn cùng dầu thừa, đồng thời giữ độ pH luôn ở mức cân bằng 5.5 nên sau khi rửa mặt xong, da không hề khô rít, căng rát, mà vẫn mềm mịn, sạch thoáng và đầy sức sống.</p><p><strong>THÔNG TIN SẢN PHẨM:</strong></p><p><strong>Loại sản phẩm</strong><br>- Sữa rửa mặt tạo bọt dạng gel làm sạch và giúp kiểm soát dầu.</p><p><strong>Loại da phù hợp</strong><br>- Dành cho da dầu và da mụn nhạy cảm.</p><p><strong>Độ an toàn</strong><br>- Độ pH trung tính 5.5.<br>- Không chứa xà phòng, không chứa cồn, không chất tạo màu và không paraben.</p><p><strong>Thành phần</strong><br>- ZINC PCA (kẽm) giúp kiểm soát dầu giảm bã nhờn hiệu quả.<br>- Nước khoáng La Roche-Posay (loại nước duy nhất có chất chống lão hoá Selenium) giúp làm dịu da và chống kích ứng.<br>- Công thức được lựa chọn kĩ càng với các thành phần làm sạch dịu nhẹ phù hợp cho da dầu và da mụn nhạy cảm.</p><p><strong>Công dụng</strong><br>- Nhẹ nhàng làm sạch bụi bẩn và bã nhờn dư thừa, hỗ trợ điều trị mụn, mang lại làn da sạch và thoáng mát.</p><p><strong>Hướng dẫn sử dụng</strong><br>- Sử dụng hằng ngày vào buổi sáng và tối.<br>- Làm ẩm da với nước ấm, cho một lượng vừa đủ sản phẩm ra tay, tạo bọt, thoa sản phẩm lên mặt, tránh vùng da quanh mắt<br>- Massage nhẹ nhàng, sau đó rửa sạch lại với nước và thấm khô<br>- Sau khi rửa mặt, nên cân bằng da và làm dịu da với nước xịt khoáng La Roche-Posay.</p><p><strong>Hướng dẫn bảo quản:</strong><br>- Nơi thoáng mát, tránh ánh nắng mặt trời trực tiếp.</p>', '1661533113.jpg', 560000, 10, 0, 0, 1, '2022-08-26 09:58:33', '2022-08-27 00:25:45'),
(12, 1, 'Bộ Đôi Kem chống nắng dưỡng da dạng sữa kiềm dầu khô thoáng hoàn hảo siêu tiết kiệm Anessa Gold Milk 60ml + Gold Milk 20ml', 'bo-doi-kem-chong-nang-duong-da-dang-sua-kiem-dau-kho-thoang-hoan-hao-sieu-tiet-kiem-anessa-gold-milk-60ml-gold-milk-20ml', 1, 'Anessa', 'Nhật Bản', 1, '3 năm kể từ ngày sản xuất', '<p><strong>BỘ SẢN PHẨM BAO GỒM:</strong></p><p>01 x Sữa chống nắng bảo vệ hoàn hảo Anessa Perfect UV Sunscreen Skincare Milk SPF 50+, PA++++ 60ml</p><p>01 x Sữa chống nắng bảo vệ hoàn hảo Anessa Perfect UV Sunscreen Skincare Milk SPF 50+, PA++++ 20ml</p><p><strong>THÔNG TIN CHI TIẾT</strong></p><p>&nbsp;</p><p>Sữa chống nắng bảo vệ hoàn hảo Anessa Perfect UV Sunscreen Skincare Milk - SPF 50+, PA++++ với kết cấu dạng sữa mỏng nhẹ, giúp chống nắng vượt trội nhiều giờ liền mà vẫn có một làn da mịn mượt, không gây nhờn rít, bóng dầu. Đặc biệt, khả năng chống trôi trong nước &amp; mồ hôi với công nghệ độc quyền Aqua Booster, lên đến 80 phút trong hồ bơi, sản phẩm rất thích hợp dùng cho những hoạt động ngoài trời hay đi chơi, du lịch, công tác.</p><p>&nbsp;</p><p><strong>THÔNG TIN SẢN PHẨM</strong></p><p>&nbsp;</p><p><strong>Công dụng</strong></p><p>- Anessa mang lại hiệu quả chống nắng tối ưu.</p><p>- Lớp màng bảo vệ trước tia UV trở nên hoàn hảo hơn nhờ công nghệ Aqua Booster chống trôi trong nước và mồ hôi.</p><p>- Chống trôi sau 80 phút trong hồ bơi, chống cát dính vào da.</p><p>- Công nghệ bảo vệ 360° ngăn chặn tác hại của tia UV trên mọi bề mặt da và mọi góc.</p><p>- Thành phần dưỡng da và giữ ẩm được chọn lọc kỹ lưỡng ngăn chặn khô da (50% thành phần dưỡng da).</p><p>- Giữ ẩm: Super Hyaluronic Acid, Glycerin.</p><p>- Giữ ẩm: Collagen - Cho lớp biểu bì: Chiết xuất Hoa Hồng - Dưỡng ẩm: Chiết xuất Lô Hội.</p><p>- Chống Oxi hóa: Chiết xuất lá Trà xanh, chiết xuất lá hoa Anh Đào, ngăn chặn sự đứt gãy collagen Chiết xuất Tormentilla.</p><p>- Có thể làm lót trang điểm. Dễ dàng làm sạch với xà phòng hoặc sữa rửa mặt.</p><p>- Công thức với mùi hương thanh mát từ cam, quýt.</p><p>- Không chất tạo màu, đã qua kiểm nghiệm với chuyên gia da liễu.</p><p>&nbsp;</p><p><strong>Độ an toàn</strong></p><p>- Không chất tạo màu.</p><p>- Được kiểm định bởi chuyên gia da liễu.</p><p>&nbsp;</p><p><strong>Đối tượng sử dụng</strong></p><p>- Thích hợp với mọi loại da.</p><p>&nbsp;</p><p><strong>Hướng dẫn sử dụng</strong></p><p>- Lắc đều trước khi sử dụng.</p><p>- Dùng sau bước dưỡng da, thoa đều khắp vùng da cần bảo vệ.</p><p>- Để đạt hiệu quả cao nhất, nên thoa lại sau khi tiếp xúc nhiều với nước hoặc lau bằng khăn.</p><p>- Dễ dàng làm sạch với sữa rửa mặt.</p><p>&nbsp;</p><p><strong>Lưu ý</strong></p><p>- Tránh tiếp xúc với mắt.</p><p>- Nếu có, rửa ngay bằng nước lạnh hoặc nước ấm.</p><p>- Bảo quản tránh ánh sáng trực tiếp, nơi có nhiệt độ cao hoặc ẩm ướt.</p><p>- Để xa tầm tay trẻ em.</p><p>- Không sử dụng cho vùng da bị tổn thương.</p><p>- Ngưng dùng ngay khi có biểu hiện kích ứng và tham khảo ý kiến bác sĩ da liễu.</p><p>&nbsp;</p><p><strong>THÔNG TIN THƯƠNG HIỆU</strong></p><p>Anessa được biết đến là thương hiệu nổi tiếng về kem chống nắng thuộc tập đoàn Shiseido của Nhật Bản đang được các tín đồ làm đẹp săn lùng nhiều nhất trong thời gian gần đây. Ngoài thế mạnh về thiết kế đơn giản và sang trọng, Anessa còn thể hiện được lợi thế về chất lượng của sản phẩm. Nếu như kem chống nắng thông thường chỉ có tác dụng chống nắng thì Anessa còn có khả năng làm đẹp da, chống thấm nước, thay thế kem lót trang điểm.</p>', '1661533199.jpg', 1000000, 100, 0, 0, 1, '2022-08-26 09:59:59', '2022-08-27 00:25:44'),
(13, 1, 'Kem Dưỡng Trắng Da Tối Ưu Hada Labo Perfect White Cream 50g', 'kem-duong-trang-da-toi-uu-hada-labo-perfect-white-cream-50g', 1, 'Hada Labo', 'Việt Nam', 1, '3 năm kể từ ngày sản xuất', '<p>Kem dưỡng trắng da tối ưu Hada Labo Perfect White Cream 50g Với thông điệp \" Da trắng hoàn hảo\", bộ sản phẩm dưỡng trắng Hadalabo Perfect White mới mang đến giải pháp cho làn da trắng mịn – đều màu- cấp ẩm sâu; để bạn có thể tự tin sỡ hữu làn da trắng mượt rạng rỡ. CÔNG DỤNG CHÍNH: Dưỡng da trắng mượt, đều màu, cấp ẩm sâu 3- Thành phần: + Dưỡng da trắng mịn: - Arbutin tinh khiết ức chế sự hình thành &amp; phân tán hắc tố Melanin từ sâu trong biểu bì nguyên nhân gây sạm nám, tàn nhang &amp; đốm nâu, đồng thời bảo vệ da khỏi tác hại của tia UV - Vitamin C và E tăng cường khả năng chống oxy hóa, dưỡng trắng các vùng da sậm màu, cho sắc da đều màu rạng rỡ + Dưỡng ẩm, mềm mịn: - HA và nano HA cung cấp độ ẩm toàn diện cho các lớp biểu bì, tái tạo cấu trúc đàn hồi cho làn da ẩm mượt - Hạt Ý Dĩ cho da mềm mịn 4- Hướng dẫn sử dụng: B1: Làm sạch sâu dịu nhẹ với kem rửa mặt. B2: dưỡng trắng và làm mềm da với dung dịch dưỡng. B3: Dưỡng trắng chuyên sâu với tinh chất cô đặc. B4: Khóa ẩm với sữa dưỡng hoặc kem dưỡng Sau 1 ngày: cảm nhận da ẩm mượt thấy rõ. Từ 6 - 8 tuần: da bắt đầu sáng và đều màu hơn. Sau 8 tuần: da trắng mượt vượt trội. Không cồn, không hương liệu, không chất tạo màu, không dầu khoáng, pH cân bằng. 5- THÔNG TIN THƯƠNG HIỆU: + Thương hiệu: Hada Labo + Xuất xứ thương hiệu: Nhật Bản +Sản xuất tại: Việt Nam + Hạn sử dụng: 3 năm kể từ ngày sản xuất + Ngày sản xuất: xem chi tiết trên vỏ hộp *Lưu ý: sản phẩm có thay đổi bao bì theo từng đợt nhập hàng</p>', '1661533257.jpg', 220000, 100, 0, 0, 1, '2022-08-26 10:00:57', '2022-08-27 00:25:43'),
(14, 1, 'Dưỡng Chất Chuyên Sâu Giúp Hỗ Trợ Quá Trình Tái Tạo Da La Roche-Posay Hyalu B5 Serum 30ml', 'duong-chat-chuyen-sau-giup-ho-tro-qua-trinh-tai-tao-da-la-roche-posay-hyalu-b5-serum-30ml', 1, 'La Roche-Posay', 'Pháp', 1, '03 năm kể từ NSX', '<p><strong>Dưỡng chất chuyên sâu giúp hỗ trợ quá trình tái tạo da La Roche-Posay Hyalu B5 Serum 30ml</strong> là dòng serum chuyên biệt với hoạt chất Hyaluronic Acid Duo giúp dưỡng ẩm chuyên sâu, cho da căng mịn; Vitamin B5 làm dịu &amp; bảo vệ da; Madecassoside cải thiện làn da hư tổn nhanh chóng. Kết cấu cực nhẹ, thẩm thấu nhanh vào da và không hề gây nhờn rít. Chỉ sau một thời gian sử dụng, da sẽ trở nên mịn màng, ẩm mượt và rạng rỡ hơn. Sản phẩm đã được kiểm nghiệm bởi bác sĩ da liễu, tuyệt đối an toàn cho da, kể cả da nhạy cảm.</p><p><strong>THÔNG TIN SẢN PHẨM</strong></p><p><strong>*Loại sản phẩm</strong><br>- Dưỡng chất (Serum) La Roche Posay HyaluB5 giúp tái tạo, phục hồi và làm săn chắc da.</p><p><strong>*Loại da phù hợp</strong><br>- Mọi loại da, kể cả da nhạy cảm</p><p><strong>*Độ an toàn</strong><br>- Không gây kích ứng da<br>- Được kiểm nghiệm bởi bác sĩ da liễu trên làn da nhạy cảm<br>- Không gây nhân mụn trứng cá</p><p><strong>*Thành phần</strong><br>- HYALURONIC ACID DUO dưỡng ẩm chuyên sâu, giúp da căng mịn<br>- Vitamin B5: làm dịu &amp; bảo vệ da<br>- Madecassoside: phục hồi làn da</p><p><strong>*Công dụng</strong><br>- Hỗ trợ quá trình tái tạo da, giúp da đàn hồi, săn chắc hơn<br>- Cung cấp độ ẩm cho da mềm mịn<br>- Kết cấu dạng lỏng, thẩm thấu nhanh, khô thoáng tức thì nhưng không làm quá khô bề mặt da, phù hợp với da châu Á<br>- Thiết kế nhỏ gọn, tiện lợi</p><p><strong>*Hướng dẫn sử dụng</strong><br>1. Sử dụng vào buổi sáng kèm kem chống nắng SPF 50+ &amp; chống được tia UVA<br>2. Cho một lượng vừa đủ ra tay, thoa đều khắp mặt<br>3. Tránh thoa vùng da quanh mắt</p><p><br>NSX: Xem trên bao bì<br>HSD: 3 năm kể từ NSX<br>Xuất xứ: Pháp<br>Nơi sản xuất: Pháp<br><i><strong>*Bao bì, mẫu mã sản phẩm thay đổi theo từng đợt nhập hàng</strong></i></p><p><br><strong>THÔNG TIN THƯƠNG HIỆU</strong></p><p>La Roche-Posay là nhãn hàng dược mỹ phẩm đến từ Pháp trực thuộc tập đoàn L’Oreal đã hoạt động được hơn 30 năm, phối hợp nghiên cứu với các bác sĩ da liễu trên toàn thế giới cho ra đời các sản phẩm dưỡng da hướng đến thị trường sản phẩm dành cho da nhạy cảm, ngoài ra còn có dòng sản phẩm dành cho trẻ em. Thành phần nổi bật xuất hiện trong các sản phẩm của La Roche-Posay (LRP) là nước suối khoáng – thermal spring water. Tất cả những sản phẩm thuộc La Roche Posay đều được thử nghiệm lâm sàng và đánh giá khách quan từ bệnh viện Saint Jacques-Toulouse. Quy trình bào chế của sản phẩm cũng rất nghiêm ngặt mang lại cho người sử dụng vẻ đẹp tự nhiên và rất an toàn.</p>', '1661533378.jpg', 1030000, 100, 0, 0, 1, '2022-08-26 10:02:58', '2022-08-27 00:28:35'),
(15, 1, 'Sữa chống nắng mỏng nhẹ lâu trôi giúp bảo vệ da tối ưu khỏi tia UVA dài La Roche-Posay Anthelios Uvmune 400 Invisible Fluid 50ml', 'sua-chong-nang-mong-nhe-lau-troi-giup-bao-ve-da-toi-uu-khoi-tia-uva-dai-la-roche-posay-anthelios-uvmune-400-invisible-fluid-50ml', 1, 'La Roche-Posay', 'Pháp', 1, '03 năm kể từ NSX', '<p>Sữa chống nắng mỏng nhẹ lâu trôi giúp bảo vệ da tối ưu khỏi tia UVA dài La Roche-Posay Anthelios Uvmune 400 Invisible Fluid là dòng sản phẩm có khả năng chống nắng phổ rộng, bảo vệ da toàn diện trước tác hại từ tia UVA/UVB. Chất kem dạng sữa với công nghệ Intelimer giúp kháng trôi tối đa với kết cấu lỏng nhẹ, thẩm thấu nhanh, không nhờn rít, không để lại vệt trắng da. Sản phẩm an toàn với mọi loại da, đặc biệt được chuyên gia khuyên dùng cho da nhạy cảm với ánh nắng do cơ địa hoặc tác nhân bên ngoài.</p><p><strong>THÔNG TIN SẢN PHẨM</strong></p><p><strong>Loại sản phẩm:</strong></p><p>- Kem chống nắng cho da mặt dạng sữa không nhờn rít</p><p><strong>Thành phần:</strong></p><p>- Công nghệ XL-PROTECTTM AntiUVB / UVA / long UVA, chống tia hồng ngoại &amp; ô nhiễm&nbsp;</p><p>- Công nghệ INTELIMER</p><p><strong>Công dụng:</strong></p><p>- Kháng trôi cao (nước, mồ hôi, cát,…)&nbsp;</p><p>- Kết cấu mỏng nhẹ, không gây nhờn rít</p><p>-&nbsp; Chống nắng và bảo vệ da mặt tối ưu SPF50+ , UVA/UVB&nbsp;</p><p>-&nbsp; Sử dụng như kem chống nắng hằng ngày hoặc trong thời gian hoạt động nhiều dưới ánh nắng mặt trời (đi biển, dã ngoại,…)</p><p><strong>Độ an toàn:</strong></p><p>- Không gây kích ứng da&nbsp;</p><p>- Không gây nhân mụn trứng cá&nbsp;</p><p>-&nbsp; Không hương liệu&nbsp;</p><p>- Được kiểm nghiệm bởi chuyên gia da liễu trên làn da nhạy cảm&nbsp;</p><p>- Không gây cay mắt</p><p><strong>Loại da phù hợp:</strong></p><p>- Dành cho da nhạy cảm, da dễ kích ứng với ánh nắng</p><p><strong>Hướng dẫn sử dụng:</strong></p><p>-Thoa kem chống nắng trước khi ra nắng &amp; thoa lại sau mỗi 2h nếu có hoạt động mạnh</p><p>Xuất xứ thương hiệu: Pháp</p><p>Nơi sản xuất: Pháp</p><p>Hạn sử dụng: 3 năm kể từ ngày sản xuất&nbsp;</p><p>Ngày sản xuất: In trên bao bì</p><p>Thành phần: Xem chi tiết trên bao bì</p><p><i>Chú ý: Bao bì thay đổi tùy theo từng đợt nhập hàng</i></p><p><strong>THÔNG TIN THƯƠNG HIỆU</strong></p><p>La Roche-Posay là nhãn hàng dược mỹ phẩm đến từ Pháp trực thuộc tập đoàn L’Oreal đã hoạt động được hơn 30 năm, phối hợp nghiên cứu với các chuyên gia da liễu trên toàn thế giới cho ra đời các sản phẩm dưỡng da hướng đến thị trường sản phẩm dành cho da nhạy cảm, ngoài ra còn có dòng sản phẩm dành cho trẻ em. Thành phần nổi bật xuất hiện trong các sản phẩm của La Roche-Posay (LRP) là nước suối khoáng – thermal spring water. Tất cả những sản phẩm thuộc La Roche Posay đều được thử nghiệm lâm sàng và đánh giá khách quan từ bệnh viện Saint Jacques-Toulouse. Quy trình bào chế của sản phẩm cũng rất nghiêm ngặt mang lại cho người sử dụng vẻ đẹp tự nhiên và rất an toàn.</p>', '1661533448.jpg', 495000, 100, 0, 1, 1, '2022-08-26 10:04:08', '2022-08-27 12:41:45'),
(16, 1, 'Kem chống nắng dạng tinh chất Senka Perfect UV Essence 50g', 'kem-chong-nang-dang-tinh-chat-senka-perfect-uv-essence-50g', 1, 'Senka', 'Nhật Bản', 1, '3 năm kể từ ngày sản xuất', '<p><strong>Kem chống nắng dạng tinh chất Senka Perfect UV Essence 50g</strong> nay có thêm phiên bản mới với dạng tinh chất dễ dàng thẩm thấu sâu vào da và mang lại hiệu quả chống nắng với chỉ số lên tới SPF 50+, PA++++. Sản phẩm chứa thành phần dưỡng ẩm, không những chống nắng mà còn dưỡng da mịn mượt, không gây khô rát, an toàn cho mọi làn da. Kem chống nắng có thể sử dụng như kem lót trang điểm và mang đến tính năng ngăn chặn các đốm nâu, tàn nhang, lão hóa sớm. Hãy trải nghiệm ngay với dòng kem chống nắng này của Senka nhé!</p><p><strong>THÔNG TIN SẢN PHẨM</strong></p><p><strong>Công dụng:</strong></p><p>- Chỉ số chống nắng vượt trội SPF 50+, PA++++ che chắn và bảo vệ da khỏi tia tử ngoại.</p><p>- Giảm thiểu các đốm nâu, tàn nhang.</p><p>- Ngăn chặn dấu hiệu lão hóa sớm, tình trạng cháy nắng và sạm da.&nbsp;</p><p>- Dạng tinh chất dễ dàng thẩm thấu sâu vào da, mang lại hiệu quả chống nắng cao.</p><p>- Dưỡng da ẩm mịn, không gây khô rát.</p><p>- Dễ dàng làm sạch với sữa rửa mặt.&nbsp;</p><p><strong>Thành phần:</strong></p><p>- Chiết xuất từ từ phức hợp tinh chất tơ tằm thiên nhiên.</p><p>- Giàu thành phần cấp ẩm Hyaluronic acid giúp da căng mượt, mềm mại.&nbsp;</p><p><strong>Loại da phù hợp:</strong></p><p>- Phù hợp với mọi làn da.</p><p><strong>Độ an toàn:</strong></p><p>- Đã qua kiểm nghiệm y tế an toàn cho da.</p><p><strong>Hướng dẫn sử dụng:</strong></p><p>- Bước 1: Làm sạch tay và rửa mặt với sữa rửa mặt Senka&nbsp;</p><p>- Bước 2: Lấy ra tay một lượng sản phẩm vừa đủ và thoa đều trên lòng bàn tay&nbsp;&nbsp;</p><p>- Bước 3: Dùng tay đã thoa kem chống nắng vỗ nhẹ lên bề mặt da&nbsp;</p><p>- Bước 4: Tẩy trang và rửa mặt thật sạch vào cuối ngày</p><p>&nbsp;</p><p>Ngày sản xuất: Xem NSX trên bao bì sản phẩm (Ngày/Tháng/Năm)</p><p>Hạn sử dụng: 3 năm kể từ NSX</p><p>Xuất xứ thương hiệu: Nhật Bản</p><p>Nơi sản xuất: Nhật Bản</p><p>&nbsp;</p><p><strong>THÔNG TIN THƯƠNG HIỆU</strong></p><p>Ra đời năm 2002 tại Nhật Bản, nhãn hiệu Senka thừa hưởng lịch sử 140 năm của Tập đoàn Shiseido để mang đến những sản phẩm dưỡng da hiệu quả và an toàn với làn da phụ nữ châu Á. Với sản phẩm đại diện Senka Perfect Whip đứng đầu thị trường sữa rửa mặt Nhật Bản trong 7 năm liền (từ 2008 đến 2015), Senka mong muốn chăm sóc những người phụ nữ bận rộn một cách hiệu quả và tinh tế nhất.</p>', '1661533544.jpg', 175000, 100, 0, 0, 1, '2022-08-26 10:05:44', '2022-08-27 00:28:33'),
(17, 1, 'Sữa Chống Nắng Nâng Tông Dành Cho Da Dầu/Hỗn Hợp Sunplay Skin Aqua Tone Up UV Milk Happiness Aura (Rose) (Cho Da Sáng Hồng, Khuyết Điểm Xanh) (50g)', 'sua-chong-nang-nang-tong-danh-cho-da-dauhon-hop-sunplay-skin-aqua-tone-up-uv-milk-happiness-aura-rose-cho-da-sang-hong-khuyet-diem-xanh-50g', 1, 'Sunplay', 'Việt Nam', 1, '3 năm kể từ ngày sản xuất', '<p>Sữa Chống Nắng Nâng Tông Dành Cho Da Dầu/Hỗn Hợp Sunplay Skin Aqua Tone Up UV Milk Happiness Aura (Rose) (Cho Da Sáng Hồng, Khuyết Điểm Xanh) (50g) giúp chống mọi tia UV- Che phủ tự nhiên - Nâng tông da sáng tựa cánh hồng tinh khôi Chông nắng hiệu quả với: PA++++ tăng cường chống mọi loại tia UVA (gây đen sạm, nám, tàn nhang, nếp nhăn, đốm nâu,) SPF50+ ngăn tia UVB (gây rát da, cháy nắng,). Dòng sản phẩm Chống nắng hiệu chỉnh sắc da che khuyết điểm Tone Up UV Happiness Aura có hai phiên bản: Sunplay Skin Aqua Tone Up UV Essence: Dành cho mọi loại da, đặc biệt là da sáng, nhạy cảm, mẩn đỏ. Sunplay Skin Aqua Tone Up UV Milk: Dành cho nhóm da dầu, da hỗn hợp, da thường; đặc biệt là da sáng, nhạy cảm ngay cả khi nổi mẩn đỏ. 1- Đặc tính của sản phẩm: Chống nắng hiệu quả với SPF50+, PA++++ giúp ngăn ngừa đen sạm, nám, nếp nhăn, đốm nâ Hiệu chỉnh tông da tái xanh, che phủ khuyết điểm tự nhiên giúp da ửng hổng. Kiểm soát dầu và dưỡng sáng da. Không chứa cồn, có thể làm lớp lót trang điểm. 2 - Thành phần chính và công dụng: Sự hòa quyện sắc hồng đậm và sắc vỏ cam nhạt: tạo nên màu cánh hồng giúp hiệu chỉnh tông da tái xanh, che phủ khuyết điểm tự nhiên. Hạt ngọc trai siêu mịn: phản chiếu ánh sáng da chiều, cho da trong suốt, rạng rỡ. Vitamin C &amp; B3: dưỡng da sáng mịn Hương hoa hồng tự nhiên lan tỏa hạnh phúc. 3 - Hướng dẫn sử dụng: Lắc kỹ trước khi dùng. Thoa đều sản phẩm trước khi ra nắng. Dùng hàng ngày để bảo vệ da tốt nhất. Sau khi ra mồ hôi nhiều, thoa lại để có hiệu quả tốt hơn. 4 - Lưu ý: Không thoa lên vết thương hở hoặc bị bỏng. Ngưng sử dụng và tham khảo ý kiến bác sĩ nếu có dấu hiệu dị ứng như: nổi mẩn đỏ, sưng, ngứa. Không ở ngoài nắng quá lâu ngay cả khi đang sử dụng sản phẩm chống nắng. 5 - Bảo quản: Bảo quản nơi khô mát, tránh ánh nắng mặt trời trực tiếp chiếu vào. 6 - Thông tin thương hiệu: Thương hiệu Sunplay thuộc công ty TNHH Rohto-Mentholatum Việt Nam Xuất xứ thương hiệu: Nhật Bản Nơi sản xuất: Việt Nam Hạn sử dụng: 3 năm kể từ ngày sản xuất Ngày sản xuất và số lô: Xem chi tiết trên bao bì ***sản phẩm có thể thay đổi bao bì theo từng đợt nhập hàng ***quà tặng đính kèm có thể xuất hiện tùy theo từng đợt nhập hàng, số lượng có hạn</p>', '1661533591.jpg', 175000, 100, 0, 0, 1, '2022-08-26 10:06:31', '2022-08-27 00:28:33'),
(18, 1, 'Sữa chống nắng nâng tông dành cho da dầu/ hỗn hợp Sunplay Skin Aqua Tone Up UV Milk (Latte Beige) (hiệu chỉnh da trong mướt, đều màu) (50g)', 'sua-chong-nang-nang-tong-danh-cho-da-dau-hon-hop-sunplay-skin-aqua-tone-up-uv-milk-latte-beige-hieu-chinh-da-trong-muot-deu-mau-50g', 1, 'Sunplay', 'Việt Nam', 1, '3 năm kể từ ngày sản xuất', '<p>Sữa chống nắng nâng tông dành cho da khô/ thường Sunplay Skin Aqua Tone Up UV Milk (50g) Màu Latte Beige giúp hiệu chỉnh da trong mướt, đều màu Sữa chống nắng hiệu chỉnh sắc da Sunplay Skin Aqua Tone Up UV Milk - Latte Beige Color giúp chống các tia UV với hệ số chống nắng tối ưu SPF 50+; PA++++ Giúp hiệu chỉnh sắc da trong mướt, đều màu. Tạo hiệu ứng trong suốt với các hạt ngọc trai siêu mịn. Từ đó, giúp làn da bạn được nâng tông da sáng trong veo, rạng rỡ. Sản phẩm giúp kiểm soát dầu nhờ các hạt phấn siêu mịn kết hợp Vitamin C &amp; B3. Dùng hàng ngày, dành riêng cho da mặt. 1 - Đặc tính của sản phẩm: Chống nắng hiệu quả với: - PA++++ tăng cường chống mọi loại tia UVA (gây đen sạm, nám, tàn nhang, nếp nhăn, đốm nâu,)- SPF50+ ngăn tia UVB (gây rát da, cháy nắng,). Hiệu chỉnh da trong mướt, đều màu. Tạo hiệu ứng trong suốt với hạt ngọc trai siêu mịn. Dòng sản phẩm Chống nắng hiệu chỉnh sắc da trong mướt, đều màu Tone Up UV Latte Beige có hai phiên bản: - Sunplay Skin Aqua Tone Up UV Essence: Dành cho mọi loại da- Sunplay Skin Aqua Tone Up UV Milk: Dành cho nhóm da dầu, da hỗn hợp, da thường. 2 - Hướng dẫn sử dụng: - Thoa đều sản phẩm trước khi ra nắng.- Dùng hàng ngày để bảo vệ da dưới tác động của tia UV hiệu quả.- Sau khi ra mồ hôi nhiều, thoa lại để hiệu quả chống nắng được duy trì. 3 - Lưu ý: - Không thoa lên vết thương hở hoặc bị bỏng.- Ngưng sử dụng và tham khảo ý kiến bác sĩ nếu có dấu hiệu dị ứng như: nổi mẩn đỏ, sưng, ngứa. 4 - Bảo quản: - Bảo quản nơi khô mát, tránh ánh nắng mặt trời trực tiếp chiếu vào. 5 - Thông tin thương hiệu: - Thương hiệu Sunplay thuộc công ty TNHH Rohto-Mentholatum Việt Nam- Xuất xứ thương hiệu: Nhật Bản- Nơi sản xuất: Việt Nam- Hạn sử dụng: 3 năm kể từ ngày sản xuất- Ngày sản xuất và số lô: Xem chi tiết trên bao bì Lưu ý: Bao bì sản phẩm có thể thay đổi theo từng đợt nhập hàng.</p>', '1661533643.jpg', 175000, 48, 2, 9, 1, '2022-08-26 10:07:23', '2022-08-28 23:37:13'),
(19, 1, 'Combo 10+10 Mặt Nạ Giấy Dưỡng Ẩm Phục Hồi Da Innisfree My Real Squeeze Mask 20ml (Giao mẫu ngẫu nhiên)', 'combo-1010-mat-na-giay-duong-am-phuc-hoi-da-innisfree-my-real-squeeze-mask-20ml-giao-mau-ngau-nhien', 1, 'Innisfree', 'Hàn Quốc', 1, '2 năm kể từ ngày sản xuất', '<ul><li><br><strong>Combo 10+10 Mặt Nạ Giấy Dưỡng Ẩm Phục Hồi Da Innisfree My Real Squeeze Mask 20ml - 278002044</strong> chiết xuất từ các thành phần thiên nhiên vắt tươi giúp cải thiện từng vấn đề da khác nhau tha hồ cho bạn lựa chọn.</li><li>Chất liệu 100% cellulose mỏng nhẹ, làm từ bạc hà giúp đưa dưỡng chất hiệu quả vào làn da.</li><li>Phương pháp vắt và ép lạnh để tối ưu nhất các thành phần giàu dưỡng chất.</li><li>Có 3 dạng mặt nạ giấy: Dạng tinh chất dưỡng ẩm phục hồi da; Dạng nước tinh chất dịu mát; Dạng kem giàu dinh dưỡng.</li><li>Thiết kế thông minh với 2 miếng vải dư nằm ngoài khuôn mặt giúp gỡ mặt nạ ra một cách dễ dàng.</li><li>Phù hợp mọi loại da.</li></ul><p><strong>Hướng dẫn sử dụng:</strong></p><ul><li>Sau khi rửa mặt, dùng nước cân bằng làm sạch và cân bằng kết cấu da.</li><li>Lấy mặt nạ ra khỏi bao bì, đắp lên da tránh vùng mắt, môi.</li><li>Sau 10-20 phút, tháo mặt nạ ra.</li><li>Vỗ nhẹ để dưỡng chất thẩm thấu.</li></ul><p><strong>Hướng dẫn bảo quản:</strong></p><ul><li>Không bảo quản nơi có nhiệt độ quá cao hoặc quá thấp, nơi có ánh sáng trực tiếp.</li></ul>', '1661533755.jpg', 540000, 100, 0, 1, 1, '2022-08-26 10:09:15', '2022-08-27 06:25:09'),
(20, 1, 'Sữa Tắm Lifebuoy Detox Và Sạch Sâu Khỏi Bụi Mịn Pm2.5 Detox Bảo Vệ Khỏi Vi Khuẩn Gây Mụn Cơ Thể Matcha & Khổ Qua Chai 800G', 'sua-tam-lifebuoy-detox-va-sach-sau-khoi-bui-min-pm25-detox-bao-ve-khoi-vi-khuan-gay-mun-co-the-matcha-kho-qua-chai-800g', 2, 'Lifebuoy', 'Việt Nam', 0, '30 tháng kể từ ngày sản xuất', '<p><strong>SỮA TẮM LIFEBUOY DETOX MATCHA VÀ KHỔ QUA 800GR</strong><br><br>Lifebuoy Detox được chiết xuất 100% từ Matcha thiên nhiên và khổ qua, mang lại cho gia đình một làn da được detox sạch sâu, loại bỏ vi khuẩn để từ đây có thể nói tạm biệt với bụi siêu mịn PM2.5 siêu đáng ghét và loại bỏ các nguyên nhân dẫn đến các vấn đề về da như ngứa, mụn và ửng đỏ.<br><br><strong>ƯU ĐIỂM NỔI BẬT:</strong><br>&nbsp;</p><ul><li>Chiết xuất 100% từ Matcha từ thiên nhiên và Khổ qua, giúp bạn tự tin với làn da sạch khuẩn, sạch bụi mịn PM 2.5 và loại bỏ các tác nhân gây mụn cơ thể và các vấn đề về nha khác<br>&nbsp;</li><li>Sản phẩm sữa tắm của nhãn hàng sạch khuẩn chạy số số 1 thế giới.<br>&nbsp;</li></ul><p><strong>HƯỚNG DẪN SỬ DỤNG:</strong><br>&nbsp;</p><ul><li>Bước 1:Làm ướt cơ thể<br>&nbsp;</li><li>Bước 2: Lấy một lượng sản phẩm vừa đủ ra lòng bàn tay hoặc bông tắm rồi tạo bọt cùngi một ít nước<br>&nbsp;</li><li>Bước 3: Mát-xa lên cơ thể theo chuyển động tròn.<br>&nbsp;</li><li>Bước 4: Tắm sạch lại với nước.<br>&nbsp;</li></ul><p><strong>SẢN PHẨM CÙNG THƯƠNG HIỆU:</strong><br>&nbsp;</p><p>- Nước rửa tay Lifebuoy<br>- Xà bông cục Lifebuoy<br>- Gel rửa tay khô Lifebuoy<br>- Dung dịch sạch khuẩn Lifebuoy<br>- Dầu gội Lifebuoy<br><br><strong>LƯU Ý:</strong><br>&nbsp;</p><p>- Đổ đầy chai để tái sử dụng khi dùng hết với túi lẻ tiết kiệm<br>- Tránh tiếp xúc với mắt<br>- Hãy rửa kỹ bằng nước nếu dính vào mắt<br>- Để xa tầm tay trẻ em<br>&nbsp;</p>', '1661533844.jpg', 195000, 100, 0, 0, 1, '2022-08-26 10:10:44', '2022-08-27 00:28:46'),
(21, 1, 'Combo Dầu Gội, Dầu Xả TRESEMME Salon Rebond Cho tóc hư tổn do tạo kiểu Công Nghệ Tái Kết Nối Giúp ngăn gãy rụng tóc 640g, 620g', 'combo-dau-goi-dau-xa-tresemme-salon-rebond-cho-toc-hu-ton-do-tao-kieu-cong-nghe-tai-ket-noi-giup-ngan-gay-rung-toc-640g-620g', 3, 'TRESemmé', 'Việt Nam', 0, '36 tháng kể từ ngày sản xuất', '<p><strong>DETOX SẠCH SÂU, DƯỠNG TÓC CHẮC KHOẺ, CHUẨN SALON TẠI NHÀ</strong></p><p>Bạn có biết, mái tóc mỗi ngày đều tiếp xúc với nhiều yếu tố gây hại đến từ môi trường: nắng nóng, tia UV, thay đổi nhiệt độ đột ngột, gió lạnh, khói bụi bẩn &amp; ô nhiễm,… Bên cạnh đó, tóc còn chịu thương tổn từ cặn hóa chất trong sản phẩm tạo kiểu và chăm sóc tóc.<br>Lâu dần, những yếu tố gây hại này sẽ khiến mái tóc trông yếu hơn, xỉn màu mất đi độ bóng mượt tự nhiên, thậm chí trở nên khô xơ và dễ gãy rụng. Khi ấy, bạn sẽ cần detox ngay để lấy lại vẻ đẹp tràn đầy sức sống cho mai tóc.<br>TRESemmé giới thiệu giải pháp detox cho tóc và da đầu từ các chuyên gia tạo mẫu tóc trên thế giới, cho mái tóc của bạn đẹp chuẩn salon ngay tại nhà: COMBO GỘI - XẢ TRESEMMÉ SALON DETOX!<br><br><strong>ƯU ĐIỂM NỔI BẬT:</strong></p><ul><li>Thành phần từ thiên nhiên</li><li>Công nghệ thanh lọc tiên tiến làm sạch sâu, loại bỏ các tạp chất, bụi bẩn và bã nhờn tích tụ trên tóc và da đầu.</li><li>Không chứa parabens và chất tạo màu</li><li>Thích hợp cho cả tóc nhuộm, không làm ảnh hưởng tới màu tóc.</li><li>Hương thơm thư giãn từ Gừng &amp; Trà Xanh.</li></ul><p><strong>HIỆU QUẢ SỬ DỤNG:</strong></p><p>Giúp detox tóc sạch sâu &amp; bù đắp dưỡng chất, nuôi dưỡng tóc chắc khỏe.</p><ul><li>Hỗ trợ phục hồi lại mái tóc chắc khỏe đẹp chuẩn salon tại nhà cho mái tóc yếu và hư tổn.</li><li>Giúp tóc trở nên mềm mại, bóng mượt và tràn đầy sức sống.</li></ul><p><strong>HƯỚNG DẪN SỬ DỤNG:</strong></p><p>Dầu gội TRESemmé Salon Detox</p><ul><li>Thoa đều dầu gội TRESemmé Salon Detox lên tóc ướt</li><li>xoa bóp nhẹ nhàng để tạo bọt</li><li>Gội sạch với nước.</li></ul><p>Dầu xả TRESemmé Salon Detox</p><ul><li>Sau khi sử dụng dầu gội, lấy một lượng vừa đủ dầu xả TRESemmé Salon Detox</li><li>Vuốt nhẹ từ 2/3 đoạn tóc từ thân đến ngọn, đồng thời massage đều nhiều lần giúp dưỡng chất được thấm vào tóc tốt hơn.</li><li>Xả sạch bằng nước lạnh để cố định lớp biểu bì và cho tóc thêm phần sáng bóng.</li></ul><p><strong>SẢN PHẨM CÙNG THƯƠNG HIỆU</strong></p><p>Khuyên dùng trọn bộ sản phẩm&nbsp;<strong>&nbsp;Salon Detox</strong></p><ul><li>Dầu gội TRESemmé Salon Detox Cho tóc chắc khỏe bóng mượt với Gừng &amp; Trà Xanh giúp Detox tóc sạch sâu</li><li>Dầu xả TRESemmé Salon Detox Cho tóc chắc khỏe bóng mượt với Gừng &amp; Trà Xanh giúp Detox tóc sạch sâu</li></ul><p>Xuất xứ thương hiệu: Mỹ<br>Nơi sản xuất: Xem trên bao bì sản phẩm<br>Ngày sản xuất: Xem trên bao bì sản phẩm<br>Hạn sử dụng: 3 năm từ ngày sản xuất (xem trên bao bì)<br>Thành phần: Xem trên bao bì sản phẩm<br>Hướng dẫn bảo quản: Nơi thoáng mát, tránh ánh nắng trực tiếp. Đậy nắp kín sau khi sử dụng</p>', '1661533945.jpg', 440000, 100, 0, 2, 1, '2022-08-26 10:12:25', '2022-08-28 03:58:51'),
(22, 1, 'Combo Dove Phục Hồi Hư Tổn Dầu Gội 640g + Kem Xả 610g', 'combo-dove-phuc-hoi-hu-ton-dau-goi-640g-kem-xa-610g', 3, 'Dove', 'Việt Nam', 0, '36 tháng kể từ ngày sản xuất', '<p><strong>SỞ HỮU MÁI TÓC SUÔN MƯỢT KHỎA ĐẸP CÙNG DOVE PHỤC HỒI HƯ TỔN</strong><br><br>Dove luôn quan tâm đến các giải pháp chuyên biệt vượt trội để nuôi dưỡng tóc. Chúng tôi tin rằng nếu bạn muốn có mái tóc chắc khỏe và đẹp, bạn cần sự chăm sóc thực sự tối ưu, giúp tóc ngày càng được cải thiện sau mỗi lần dùng. Đó là lý do chúng tôi sáng tạo ra Dove Phục Hồi Hư Tổn với 2 tác dụng: vừa giúp mang đến kết quả tức thời, vừa nuôi dưỡng tóc lâu dài cho mái tóc ngày một chắc khỏe.<br><br><strong>ƯU ĐIỂM NỔI BẬT:</strong><br>&nbsp;</p><p>- Công Nghệ Tái Cấu Trúc Tóc không chỉ phục hồi hư tổn mà còn có khả năng tái cấu trúc tóc hư tổn cực kỳ hiệu quả<br>- Công nghệ độc quyền Đinh Vị Hư Tổn Chính Xác giúp bổ sung dưỡng chất chính xác và phục hồi tóc chuyên sâu<br><br><strong>HIỆU QUẢ SỬ DỤNG</strong><br>&nbsp;</p><p>- Phục hồi hư tổn<br>- Nuôi dưỡng mái tóc chắc khỏe suôn mượt<br><br><strong>HƯỚNG DẪN SỬ DỤNG:</strong><br>&nbsp;</p><p>Dầu gội<br>&nbsp;</p><p>- Thoa một lượng dầu gội vừa đủ lên tóc<br>- Mát xa nhẹ nhàng. Tập trung làm sạch trên da dầu.<br>- Gội sạch bằng nước<br>&nbsp;</p><p>Dầu xả<br>&nbsp;</p><p>- Sau khi xả sạch dầu gội, lấy một lượng vừa đủ kem xả ra lòng bàn tay.<br>- Nhẹ nhàng vuốt kem xả từ thân đến đuôi tóc, lưu ý cách xa chân tóc 10-15 cm và không bôi vào da đầu.<br>- Đợi kem xả thấm từ 1-3 phút, sau đó xả sạch với nước ấm hoặc nước mát (không dùng nước nóng).<br><br>Ngày sản xuất: Xem trên bao bì sản phẩm<br>Hạn sử dụng: Xem trên bao bì sản phẩm<br>Thành phần: Xem trên bao bì sản phẩm<br>Hướng dẫn bảo quản: Nơi thoáng mát, tránh ánh nắng trực tiếp</p>', '1661534021.jpg', 310000, 97, 3, 24, 1, '2022-08-26 10:13:41', '2022-08-28 13:22:44');
INSERT INTO `products` (`id`, `adminID`, `name`, `slug`, `categoryID`, `brand`, `origin`, `skin`, `exp`, `description`, `image`, `price`, `qty`, `sold`, `view`, `is_active`, `created_at`, `updated_at`) VALUES
(23, 1, 'Combo Dầu Gội, Dầu Xả TRESEMME Keratin Smooth Dưỡng tóc khô xơ rối Công thức chuẩn salon Hydrolyzed Keratin trong Dầu Gội và dầu Xả dưỡng Tóc Vào Nếp Suôn Mượt 640g, 620g', 'combo-dau-goi-dau-xa-tresemme-keratin-smooth-duong-toc-kho-xo-roi-cong-thuc-chuan-salon-hydrolyzed-keratin-trong-dau-goi-va-dau-xa-duong-toc-vao-nep-suon-muot-640g-620g', 3, 'TRESemmé', 'Việt Nam', 0, '36 tháng kể từ ngày sản xuất', '<p>Combo Gội - Xả Keratin Smooth cho tóc vào nếp và suôn mượt suốt ngày dài<br>Sản phẩm phù hợp với tóc nhuộm<br>Công thức ưu việt CHUẨN SALON được đặc chế với dưỡng chất Hydrolyzed Keratin thấm sâu qua 10 lớp Keratin cho tới tận lõi tóc, giúp nuôi dưỡng &amp; phục hồi tóc<br><br>Thành phần an toàn, không gây hại cho mái tóc và da đầu.<br>Được các chuyên gia tạo mẫu tóc tin dùng để chăm sóc và dưỡng tóc<br>Khuyên dùng trọn bộ gội xả TRESmmé Keratin Smooth để có 1 trải nghiệm hoàn mỹ<br><br><strong>TRỌN BỘ BÍ QUYẾT TỪ CÁC NHÀ TẠO MẪU TÓC CHO MÁI TÓC SUÔN MƯỢT CHUẨN SALON</strong><br><br>Tóc bạn không còn suôn mượt vào nếp sau cả ngày dài hay dù có thử mọi cách nhưng cũng không thể đẹp như ở salon? Bạn có biết, để sở hữu một mái tóc vào nếp suôn mượt suốt cả ngày, tóc mình phải được nuôi dưỡng mềm mượt ngay từ sâu bên trong? Và một trong những liệu pháp hiệu quả nhất chính là bổ sung protein Keratin &amp; tinh dầu dưỡng tóc giúp thấm sâu &amp; nuôi dưỡng từng sợi tóc. Thay vì phải ra salon thường xuyên mất nhiều thời gian và chi phí, TRESemmé đem lại cho bạn bí quyết dưỡng tóc từ các chuyên gia tạo mẫu tóc trên thế giới, cho mái tóc của bạn đẹp chuẩn salon ngay tại nhà: COMBO GỘI-XẢ TRESEMMÉ KERATIN SMOOTH!<br><br>ƯU ĐIỂM NỔI BẬT</p><ul><li>Công thức Hydrolyzed Keratin ưu việt chuẩn salon giúp thấm sâu qua 10 lớp vảy Keratin ở lớp biểu bì &amp; lõi tóc lớp giữa, giúp thay thế lượng protein đã mất, từ đó trả lại cho nàng mái tóc sự mềm mại, bóng mượt như vừa bước ra khỏi salon.</li><li>Hương thơm cuốn hút ngọt ngào đầy quyến rũ</li></ul><p><strong>HIỆU QUẢ SỬ DỤNG</strong></p><ul><li>Làm sạch bã nhờn, dầu thừa trên da đầu và khỏi bụi bẩn nơi thân tóc</li><li>Loại bỏ tóc khô - xơ - rối, giúp mái tóc vào nếp suôn mượt chuẩn salon suốt 48 giờ.</li></ul><p><strong>HƯỚNG DẪN SỬ DỤNG</strong><br>Dầu gội TRESemmé Keratin Smooth:</p><ul><li>Thoa đều dầu gội TRESemmé Keratin Smooth lên tóc ướt, xoa bóp nhẹ nhàng để tạo bọt</li><li>Gội sạch với nước.</li></ul><p>Dầu xả TRESemmé Keratin Smooth:</p><ul><li>Sau khi sử dụng dầu gội, lấy một lượng vừa đủ dầu xả TRESemmé Keratin Smooth</li><li>Vuốt nhẹ từ 2/3 đoạn tóc từ thân đến ngọn, đồng thời massage đều nhiều lần giúp dưỡng chất được thấm vào tóc tốt hơn.</li><li>Xả sạch bằng nước lạnh để cố định lớp biểu bì và cho tóc thêm phần sáng bóng.</li></ul><p><strong>SẢN PHẨM CÙNG THƯƠNG HIỆU</strong><br>Khuyên dùng trọn bộ sản phẩm TRESemmé Keratin Smooth:</p><ul><li>Dầu gội TRESemmé Keratin Smooth Cho tóc khô xơ rối với công thức chuẩn salon Hydrolyzed Keratin Vào Nếp Suôn Mượt</li><li>Dầu xả TRESemmé Keratin Smooth Cho tóc khô xơ rối với công thức chuẩn salon Hydrolyzed Keratin Vào Nếp Suôn Mượt</li><li>Kem Ủ Tóc TRESemmmé Keratin Smooth Cho tóc khô xơ rối với Dầu Dưỡng Tóc Argan &amp; Keratin Vào Nếp Suôn Mượt 180ml</li><li>Xịt bảo vệ tóc khỏi nhiệt TRESemmé Keratin Smooth với Dầu Dưỡng tóc Marula &amp; Keratin Cho tóc tạo kiểu 236ml</li><li>Serum Dưỡng Tóc Bóng Mượt TRESemmé Keratin Smooth với Dầu Dưỡng tóc Marula &amp; Keratin Cho tóc tạo kiểu 97ml</li></ul><p>Xuất xứ thương hiệu: Mỹ<br>Nơi sản xuất: Xem trên bao bì sản phẩm<br>Ngày sản xuất: Xem trên bao bì sản phẩm<br>Hạn sử dụng: 3 năm từ ngày sản xuất (xem trên bao bì)<br>Thành phần: Xem trên bao bì sản phẩm<br>Hướng dẫn bảo quản: Nơi thoáng mát, tránh ánh nắng trực tiếp. Đậy nắp kín sau khi sử dụng</p>', '1661534098.png', 440000, 100, 0, 1, 1, '2022-08-26 10:14:58', '2022-08-27 12:41:21'),
(24, 1, 'Bộ Ba Chăm Sóc Tóc TSUBAKI Phục Hồi Ngăn Rụng Tóc Gội Xả (490ml/chai) + Kem Xả 180g', 'bo-ba-cham-soc-toc-tsubaki-phuc-hoi-ngan-rung-toc-goi-xa-490mlchai-kem-xa-180g', 3, 'TSUBAKI', 'Nhật Bản', 0, '3 NĂM KỂ TỪ NGÀY SẢN XUẤT', '<p>Sản phẩm chăm sóc tóc cao cấp giúp ngăn rụng tóc và phục hồi hư tổn từ gốc đến ngọn nhờ công nghệ thẩm thấu độc quyền của Shiseido, dưỡng chất hấp thu nhanh và sâu vào trong tóc qua cơ chế.<br>1. Mở rộng đường dẫn dưỡng chất vào tóc<br>2. Dưỡng chất thiết yếu (thành phần phục hồi + thành phần nuôi tóc bóng mượt) dễ dàng di chuyển và thấm sâu vào biểu bì tóc.<br>3. Thành phần Dual Amino Acid giúp khép và khoác chặt dưỡng chất nuôi dưỡng bên trong tóc.<br>- Mùi hương hoa và quả mọng trẻ trung sang trọng</p><p>Sản phẩm chăm sóc tóc cao cấp giúp tăng cường dưỡng chất, phục hồi hư tổn và ngăn rụng tóc nhờ công nghệ thẩm thấu độc quyền của Shiseido, dưỡng chất hấp thu nhanh và sâu vào trong tóc qua cơ chế:<br>1. Mở rộng đường dẫn dưỡng chất vào tóc<br>2. Dưỡng chất thiết yếu (thành phần phục hồi + thành phần nuôi tóc bóng mượt) dễ dàng di chuyển và thấm sâu vào biểu bì tóc.<br>3. Thành phần Dual Amino Acid giúp khép và khoác chặt dưỡng chất nuôi dưỡng bên trong tóc.<br>- Mùi hương hoa và quả mọng trẻ trung sang trọng</p><p><br>- Chăm sóc chuyên sâu mỗi ngày với thành phần phục hồi chuyên biệt cho tóc hư tổn có dấu hiệu hư tổn.<br>- Giảm các dấu hiệu hư tổn như, khô, gãy, chẻ ngọn và rụng tóc, bên cạnh cung cấp độ ẩm cần thiết để tóc vào nếp trong thời gian dài.<br>- Công nghệ thẩm thấu độc quyền của Shiseido giúp dưỡng chất hấp thu nhanh và sâu vào trong tóc qua cơ chế.<br>1. Mở rộng đường dẫn dưỡng chất vào tóc<br>2. Dưỡng chất thiết yếu (thành phần phục hồi + thành phần nuôi tóc bóng mượt) dễ dàng di chuyển và thấm sâu vào biểu bì tóc.<br>3. Thành phần Dual Amino Acid giúp khép và khoác chặt dưỡng chất nuôi dưỡng bên trong tóc.<br>- Mùi hương hoa và quả mọng trẻ trung sang trọng</p>', '1661534558.jpg', 587000, 99, 1, 2, 1, '2022-08-26 10:22:38', '2022-08-28 06:47:11'),
(25, 1, 'Kem Nền Mịn Nhẹ Kiềm Dầu Fit Me Maybelline New York Matte Poreless Foundation 30ml', 'kem-nen-min-nhe-kiem-dau-fit-me-maybelline-new-york-matte-poreless-foundation-30ml', 4, 'Maybelline', 'Trung Quốc', 0, '3 năm kể từ ngày sản xuất', '<p><strong>1. VÌ SAO BẠN SẼ THÍCH</strong><br>Kem Nền Mịn Nhẹ Kiềm Dầu Maybelline Fit Me gây tiếng vang trong giới làm đẹp toàn thế giới và được mệnh danh là kem nền \'quốc dân\' khi có mặt tại Việt Nam.<br>Kem nền Fit Me gây ấn tượng với khả năng kiềm dầu cho lớp nền mịn lì tự nhiên, đồng thời che phủ tốt mọi khuyết điểm trên bề mặt da và che phủ hoàn hảo lỗ chân lông. Dòng kem nền Fit Me có 15 tông màu phù hợp, tiệp mọi tông da phụ nữ Việt Nam. Kem nền lý tưởng dành cho da thường, da hỗn hợp thiên dầu &amp; da dầu.<br><br><strong>BẢNG MÀU:</strong><br><i><strong>Tông sáng:</strong></i><br>103 FAIR<br>108 LIGHT PORCELAIN<br>109 LIGHT IVORY<br>112 NATURAL IVORY<br>115 IVORY<br>120 CLASSIC IVORY<br>122 CREAMY BEIGE<br><br><i><strong>Tông trung bình:</strong></i><br>125 NUDE BEIGE<br>128 WARM NUDE<br>130 BUFF BEIGE<br>220 NATURAL BEIGE<br>222 TRUE BEIGE<br><br><i><strong>Tông ngăm:</strong></i><br>230 NATURAL BUFF<br>235 PURE BEIGE<br>310 SUN BEIGE<br><br><strong>2. ƯU ĐIỂM NỔI BẬT</strong><br>• Kềm dầu tốt, cho lớp nền luôn mịn lì.<br>• Độ che phủ trung bình- cao, che khuyết điểm &amp; lỗ chân lông hoàn hảo.<br>• Hiệu ứng mịn nhẹ tự nhiên<br>• 15 tông màu tiệp mọi tông da.<br>• Kem nền lý tưởng cho da thường, da hỗn hợp và da dầu.<br>• Bao bì cải tiến với đầu nhấn tiện lợi.<br><br><strong>3. HIỆU QUẢ SỬ DỤNG</strong><br>Kem nền Fit Me được đánh giá cao bởi người tiêu dùng với khả năng kiềm dầu tốt, lên da mịn nhẹ tự nhiên nhưng vẫn che phủ tốt khuyết điểm và lỗ chân lông.<br><br><strong>4. HƯỚNG DẪN SỬ DỤNG CHO KẾT QUẢ TỐT NHẤT</strong><br>Chấm đều kem nền 5 điểm lên mặt (vùng trán, mũi, cằm và 2 má).<br>• Tán đều kem theo hướng từ trong ra ngoài.<br>• Sử dụng các bước sau để đảm bảo một lớp nền hoàn hảo lâu trôi không tì vết:<br>1. Dùng Kem lót Baby Skin giúp làm mịn và mờ khuyết điểm, giúp giữ lớp trang điểm lâu hơn và mền mịn hơn trước.<br>2. Sau bước kem nền, sử dụng kem che khuyết điểm Fit Me để che các khuyết điểm trên da và sử dụng tiếp phấn phủ Fit Me Matte Powder để khóa lớp trang điểm trên da.<br>3. Cuối cùng sử dụng phấn má hồng Fit Me để tô điểm cho gương mặt ửng hồng tự nhiên<br><br><strong>5. THÔNG TIN THƯƠNG HIỆU</strong><br>Là thương hiệu trang điểm số 1 thế giới, Maybelline New York chính thức có mặt tại Việt Nam từ năm 2007 và nhanh chóng trở thành thương hiệu trang điểm hàng đầu ở các dòng sản phẩm Mascara, Kem nền, Son kem lì... Sản phẩm của Maybelline luôn ứng dụng công nghệ tiên tiến, dễ sử dụng, dẫn đầu xu hướng Makeup với sự đa dạng về sản phẩm cùng giá thành hợp lý. Maybelline trở thành thương hiệu được yêu thích nhất tại Việt Nam bởi các bạn trẻ thích trang điểm, thích thể hiện chất riêng và dám nghĩ dám làm.<br>*Bắt nguồn từ New York- Mỹ và đã có mặt ở hơn 150 quốc gia, Maybelline sở hữu nhiều nhà máy sản xuất trên toàn thế giới như Trung Quốc, Mỹ, Pháp, Nhật,... Dù được sản xuất ở đâu, các sản phẩm đều tuân thủ quy trình kiểm soát chất lượng nghiêm ngặt của Maybelline toàn cầu. Sản phẩm Maybelline chính hãng tại Việt Nam đều có tem nhãn tiếng Việt phía sau và nhập khẩu trực tiếp từ Công ty TNHH L’Oreal Việt Nam nên các bạn hoàn toàn yên tâm về chất lượng và xuất xứ sản phẩm.<br><br>Xuất xứ thương hiệu: Mỹ<br>Nơi sản xuất: Trung Quốc<br>Ngày sản xuất: Xem trên bao bì sản phẩm<br>Hạn sử dụng: 3 năm kể từ ngày sản xuất.</p>', '1661534659.jpg', 248000, 99, 1, 5, 1, '2022-08-26 10:24:19', '2022-08-28 13:22:44'),
(26, 1, 'Phấn Nước Trang Điểm Kiềm Dầu Thế Hệ Mới Cho Lớp Nền Mịn Lì Laneige Neo Cushion Matte 15g', 'phan-nuoc-trang-diem-kiem-dau-the-he-moi-cho-lop-nen-min-li-laneige-neo-cushion-matte-15g', 4, 'Laneige', 'Hàn Quốc', 0, '3 năm kể từ ngày sản xuất', '<p>Laneige Neo Cushion Matte là dòng phấn nước thế hế đột phá, được thiết kế dành riêng cho làn dầu, tiết nhiều bã nhờn khiến lớp trang điểm dễ bị trôi, lỗ chân lông to và có thâm mụn với hiệu ứng bề mặt mịn lì ráo dầu suốt 24 tiếng mà vẫn mỏng nhẹ không gây bí da. Neo Cushion Matte có chứa chỉ số chống nắng cao SPF 42 PA+++ vừa giúp bảo vệ da vừa giữ cho lớp nền không bị xuống tông khi tiếp xúc với môi trường nhiều khói bụi.</p><p>Tính năng sản phẩm:</p><p>1/ Che phủ hoàn toàn mà không làm nặng da: Bột siêu mịn che phủ hoàn hảo suốt cả ngày tình trạng da có lỗ chân lông, da không đều màu và da không hoàn hảo.</p><p>2/ Chống mồ hôi suốt 24h: Công thức chống mồ hôi, kiềm việc tiết bã nhờn quá mức trong thời thiết nóng ẩm, giữ cho lớp nền mịn lì cả ngày dài mà không bí da.</p><p>3/ Che phủ mọi khuyết điểm, cho lớp nền mịn lì mềm mại nhưng vẫn rạng rỡ tự nhiên nhất.</p><p>4/ Là cushion đầu tiên có khả năng chốn ánh sáng xanh từ thiết bị điện tử với khả năng ngăn chặn và phá vỡ tác hại của các dòng ánh sáng xanh phát ra từ màn hình máy tính PC, laptop, smartphone với lớp vỏ bọc bảo vệ da mạnh mẽ.</p><p>5/ Mang lại hiệu quả kiềm dầu tối ưu nhờ công nghệ Film former kết hợp hạt phấn thấm dầu giúp kiềm cân bằng dầu-ẩm bên trong da giúp giữ độ ẩm trong thời gian lâu dài.</p><p>7/ Thiết kế đặc biệt dễ thay thế lõi refill chỉ trong một lần xoay chạm với thiết kế “One-touch” thay thế refill dễ dàng chỉ trong một lần chạm xoay.</p><p>8/ Bông phấn được cải thiện sự đột phá trong thiết kế khi sở hữu những đường rãnh nhỏ, giúp làm thoáng khí cho phần tiếp xúc giữa mút tán và da mặt, tạo nên lớp nền mỏng mịn, dàn đều. gia tăng khả năng che phủ trên da.</p><p>LƯU Ý: Trên đây là thông tin từ nhà sản xuất. Hãy lưu ý:</p><p>• Không có một sản phẩm nào có thể khẳng định phù hợp với 100% tất cả các làn da, bạn cần thử sản phẩm ở một vùng nhỏ trên da trước khi sử dụng toàn khuôn mặt.</p><p>• Màu sắc sản phẩm phụ thuộc rất nhiều vào tông da của mỗi người và mức độ phân giải của thiết bị điện tử (smartphone, ipad, laptop,…)</p><p><strong>Thông tin sản phẩm</strong></p><p>HSD: 3 năm kể từ ngày sản xuất</p><p>NSX: In trên bao bì</p><p>Xuất xứ thương hiệu: Hàn Quốc</p><p>Nơi sản xuất: Hàn Quốc</p><p>Công ty chịu trách nhiệm nhập khẩu và phân phối độc quyền: Công ty TNHH Amorepacific Việt Nam</p><p>Thành phần: Xem chi tiết trên bao bì</p><p>*** Bao bì thay đổi theo từng đợt nhập hàng</p><p><strong>Thông tin thương hiệu</strong></p><p>LANEIGE là thương hiệu mỹ phẩm trẻ trung, năng động và thời thượng dành cho mọi cô gái. Dẫn đầu về các công trình nghiên cứu dưỡng ẩm để tối đa hóa tiềm năng từ nước tạo nên công thức Water Recipe, dựa trên ý tưởng một làn da căng mọng được cung cấp đầy đủ nước là giải pháp cho nhiều vấn đề về da. Độ ẩm sâu giúp nuôi dưỡng làn da, tăng cường hàng rào bảo vệ da, thanh lọc và duy trì một làn da khoẻ mạnh, trong trẻo và rạng rỡ hơn.</p><p>Với những sản phẩm dẫn đầu xu thế và đầy sáng tạo, LANEIGE đã mau chóng chiếm lĩnh trái tim của hàng triệu phụ nữ châu Á và thành công tại hơn 15 quốc gia trên toàn thế giới. Cuộc sống với những khoảnh khắc tỏa sáng rực rỡ cùng làn da khỏe mạnh, căng tràn độ ẩm là một khái niệm làm đẹp mới từ LANEIGE</p><p><strong>Thông tin Tập đoàn Amorepacific</strong></p><p>Amorepacific là tập đoàn mỹ phẩm lớn nhất Hàn Quốc ra đời từ những năm 1945 cùng sứ mệnh đưa vẻ đẹp Châu Á ra thế giới với lý tưởng làm đẹp bắt nguồn từ các yếu tố thiên nhiên gắn kết chặt chẽ với con người. Với hơn 20 nhãn hàng chăm sóc sức khỏe, chăm sóc cá nhân và mỹ phẩm, Amorepacific đang đi đầu toàn cầu về xu hướng làm đẹp thông qua việc ra mắt các sản phẩm đẳng cấp thế giới trên cơ sở tiếp tục nghiên cứu và phát triển kết hợp các thành phần tự nhiên và công nghệ sinh học tiên tiến của châu Á, mang đến với người tiêu dùng trên khắp thế giới, trong đó có châu Á, Bắc Mỹ và châu Âu.</p>', '1661534726.jpg', 620000, 9, 1, 28, 1, '2022-08-26 10:25:26', '2022-08-28 10:34:30'),
(27, 1, 'Son Ofélia x Miracle Apo Flawsome Glow Lip (2g)', 'son-ofelia-x-miracle-apo-flawsome-glow-lip-2g', 4, 'Miracle Apo', 'Việt Nam', 0, '3 năm kể từ ngày sản xuất', '<p>Son Ofélia x Miracle Apo Flawsome Glow Lip (2g) là dòng son môi đến từ thương hiệu mỹ phẩm Miracle Apo kết hợp cùng Ofélia, với thiết kế thời thượng, giữ màu lâu trôi suốt nhiều giờ nhưng vẫn giữ độ dưỡng ẩm cho môi căng mọng. Flawsome Glow Lip là dòng son sáp tint bóng có dưỡng cùng mùi hương đào thơm ngọt, gồm 6 sắc son lấy cảm hứng từ xu hướng MLBB (My Lips But Better) gồm: Cherry On Top - Đỏ Cherry Frenzy - Đỏ Gạch Cutie Pie - Hồng Đất Bubble Pop - Hồng Đỏ Trầm I Got U - Nude Mật Ong 17 - Nâu Cam Đất Flawsome chứa: Thành phần Collagen và dầu Macadamia dưỡng ẩm, giúp ngăn ngừa mất nước. Hỗn hợp vitamin A, C, E chống oxi hóa, làm mềm và ngăn ngừa thâm môi. Hỗn hợp 9 loại Berries giúp chống oxi hóa, dưỡng ẩm môi mềm mịn, căng mọng. Thành phần chống tia UV Tất cả các sản phẩm của OFÉLIA đều không thử nghiệm trên động vật hay chứa nguyên liệu có nguồn gốc từ động vật. * Lưu ý: Có bao bì thay đôi theo từng đợt nhập hàng Thông tin thương hiệu: Thương hiệu Miracle Apo thuộc Công ty Rohto-Mentholatum (Việt Nam). Xuất xứ thương hiệu: Nhật Bản. Nơi sản xuất: Việt Nam. Ngày sản xuất: Xem chi tiết trên bao bì. Hạn sử dụng: 3 năm kể từ ngày sản xuất.</p>', '1661534771.jpg', 180000, 92, 8, 28, 1, '2022-08-26 10:26:11', '2022-08-28 14:06:21'),
(28, 1, 'Son lì dạng thỏi siêu nhẹ môi innisfree Airy Matte Lipstick 3.5 g', 'son-li-dang-thoi-sieu-nhe-moi-innisfree-airy-matte-lipstick-35-g', 4, 'Innisfree', 'Hàn Quốc', 0, '3 năm', '<p><strong>1. Kết cấu mỏng nhẹ, tự nhiên với bảng màu thời thượng</strong></p><p>Công thức bột siêu mịn cùng kết cấu mềm mại giúp son lên môi được mượt mà và mỏng nhẹ tuyệt đối, không tạo cảm giác nặng nề, khô cứng. Bảng màu MLBB đa dạng và dễ dùng, phù hợp với nhiều tông da Châu Á:</p><p># No.1 Almond Butter: Tông cam nude nhẹ nhàng mang lại cảm giác thời thượng và vô cùng nổi bật.<br># No.2 Mood Orange: Tông cam cháy pha nâu cực kỳ trendy, không làm xỉn da và phù hợp với mọi làn da.<br># No.3 Coral Land: Một sự kết hợp tinh tế giữa sắc cam san hô và sắc hồng đào đầy ấn tượng và cực kì tôn da.<br># No.4 Soft Rose: Sắc hồng nude pha đất phù hợp với tông da sáng mang lại phong thái dịu dàng, nữ tính.<br># No.5 Pink Cream: Sắc hồng phấn nổi bật, tôn lên màu da của bạn đặc biệt là những cô nàng có làn da trắng<br># No.6 Rosy Bow: Tông hồng pha lẫn sắc đỏ của Berry mang đến sự quyến rũ ngọt ngào khó phai<br># No.7 Apple Candy: Một tông đỏ đất quyến rũ, cuốn hút mọi ánh nhìn<br># No.8 Amber Brick: Tông đỏ gạch quyền lực cho những cô nàng cá tính</p><p><strong>2. Chất son nhiều dưỡng giúp giảm thiểu bong tróc</strong></p><p>Sự kết hợp hoàn hảo giữa phức hợp Ceramide và 4 loại bơ: bơ cacao, bơ hạt mỡ, bơ hạt Murumuru, bơ hạt xoài Mangifera Indica giúp dưỡng ẩm toàn diện, làm mềm môi, giảm thiểu tình trạng nứt nẻ và bong tróc, giúp màu son lên môi chuẩn và mịn màng ngay từ lần thoa đầu tiên.</p><p><strong>3. Hiệu ứng lì mịn và bền màu</strong></p><p>Airy Matte Lipstick với đa sắc màu tự nhiên, chất son mịn và lì nhưng vẫn nhẹ nhàng, độ bám màu cao cho đôi môi tươi tắn suốt cả ngày dài.</p>', '1661534839.jpg', 360000, 91, 9, 59, 1, '2022-08-26 10:27:19', '2022-08-28 23:27:21');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(4) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `image`, `is_active`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Trần Hoàng Đăng', 'tranhoangdang1402@gmail.com', NULL, '$2y$10$84u.OQXBry1wEX9z9H.7gOe6CHMwoXD0vuUe/vlHKkTpi/v.It8I6', '1661707265.jpg', 1, NULL, '2022-08-28 11:20:55', '2022-08-28 12:34:17'),
(2, NULL, 'tranhhoangdang1402@gmail.com', NULL, '$2y$10$eVfmaAaJgMza/vxgZwFyZeZv2qqfdGnxUOq9GicJjsII1QOULu/vy', NULL, 0, '$2y$10$dB/Tgya.bD.OIE4m8.3Vn.xUrjb2zQqgP8QAEBqvmV4jEWby2ywfS', '2022-08-28 11:26:12', '2022-08-28 11:26:12');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD KEY `admins_is_active_index` (`is_active`);

--
-- Chỉ mục cho bảng `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `categories_name_unique` (`name`),
  ADD KEY `categories_slug_index` (`slug`),
  ADD KEY `categories_is_active_index` (`is_active`);

--
-- Chỉ mục cho bảng `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `contacts_is_active_index` (`is_active`);

--
-- Chỉ mục cho bảng `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `events_name_unique` (`name`),
  ADD KEY `events_slug_index` (`slug`),
  ADD KEY `events_is_active_index` (`is_active`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Chỉ mục cho bảng `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders_status_index` (`status`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Chỉ mục cho bảng `policies`
--
ALTER TABLE `policies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `policies_name_unique` (`name`),
  ADD KEY `policies_slug_index` (`slug`),
  ADD KEY `policies_is_active_index` (`is_active`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_name_unique` (`name`),
  ADD KEY `products_slug_index` (`slug`),
  ADD KEY `products_skin_index` (`skin`),
  ADD KEY `products_sold_index` (`sold`),
  ADD KEY `products_view_index` (`view`),
  ADD KEY `products_is_active_index` (`is_active`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD KEY `users_is_active_index` (`is_active`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `events`
--
ALTER TABLE `events`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `invoices`
--
ALTER TABLE `invoices`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT cho bảng `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `policies`
--
ALTER TABLE `policies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
