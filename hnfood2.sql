-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 11, 2023 at 02:59 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 7.4.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hnfood`
--

-- --------------------------------------------------------

--
-- Table structure for table `api_food`
--

CREATE TABLE `api_food` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `price` decimal(10,3) NOT NULL,
  `price_sale` decimal(10,3) NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `image1` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image2` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image3` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `isProduct` tinyint(1) NOT NULL,
  `slug` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `popular` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `api_food`
--

INSERT INTO `api_food` (`id`, `name`, `description`, `price`, `price_sale`, `image`, `image1`, `image2`, `image3`, `isProduct`, `slug`, `category_id`, `popular`) VALUES
(1, 'Sữa chua Vinamilk', 'Sữa chua là một trong những loại đồ ăn nhanh có nhiều công dụng cho sức khỏe, từ việc có lợi cho tiêu hóa đến làm đẹp cho da. Sữa chua nhìn mềm mịn cùng vị chua đặc trưng, có thể dùng trực tiếp hoặc kết hợp với nhiều loại trái cây, rau củ để tăng thêm chất dinh dưỡng.', '60.000', '85.000', 'uploads/Sữa-chua-nha-đam-Vinamilk-hộp-100g.jpg', 'uploads/loc-4-hop-sua-chua-co-duong-vinamilk-100g.jpg', 'uploads/d79e02a30a8c4adcaa581b9944994287.png', 'uploads/7948e8d9c1af4909929886eb6748cb22.jpg', 1, 'sua-chua-vinamilk', 1, 0),
(2, 'Bánh kẹp thịt', 'Bánh kẹp thịt là đồ ăn nhanh ngon tiết kiệm thời gian chuẩn bị và tiết kiệm chi phí cá nhân mỗi ngày. Bạn có thể dùng bánh mì kẹp thịt, chả hay bánh mì Hy Lạp cuộn thịt gà để thưởng thức. Lớp bánh mì nóng giòn kết hợp với thịt dai mềm vừa ăn cùng nước sốt đậm đà dùng làm món điểm tâm sáng rất tuyệt vời.', '20.000', '30.000', 'uploads/sandwich-kep-thit-600x400.png', 'uploads/cachlamsandwich1.jpg', 'uploads/cach-lam-banh-mi-sandwich-ngon-don-gian.html-image00.png', 'uploads/banh-mi-sandwich-6-600x400.jpg', 1, 'banh-kep-thit', 1, 0),
(3, 'Bánh mỳ bơ lạc', 'Bánh mỳ bơ lạc là đồ ăn nhanh dễ làm, cân bằng mà không cần phải bảo quản trong tủ lạnh. Bạn chỉ cần một lát bánh mì và một thìa bơ lạc là đủ. Để tăng cường sức khỏe, bạn nên sử dụng bánh mỳ được làm từ ngũ cốc nguyên hạt và bơ lạc tự nhiên không chất bảo quản.', '25.000', '40.000', 'uploads/an-bo-dau-phong-co-map-khong-va-cach-su-dung-2.jpg', 'uploads/bo-dau-phong-nen-mua-o-dau-ngon-3-1.jpg', 'uploads/hoan-tat-banh-mi-bo-dau-phong-1.jpeg', 'uploads/sandwich-kep-thit-600x400_DnMNxZm.png', 1, 'banh-my-bo-lac', 1, 0),
(4, 'Bánh Pizza', 'Pizza là món đồ ăn nhanh ngon có nguồn gốc xuất xứ từ Ý. Bánh có đế là bánh mì được nướng trên đá nóng rồi rắc thêm phô mai, sốt cà chua và nhiều loại nhân khác nhau như hải sản, bò, xúc xích, nấm,... cực hấp dẫn và bắt mắt.', '50.000', '65.000', 'uploads/pp1.jpeg', 'uploads/pizza-ngon-re-11-compressed.jpg', 'uploads/pizza-american_style-texgrill-haiphong__5__0c4a7117ab9a418c97b60aa709165974_grande.jpg', 'uploads/an-bo-dau-phong-co-map-khong-va-cach-su-dung-2_ueFRKPv.jpg', 1, 'banh-pizza', 1, 0),
(5, 'Khoai tây chiên', 'Khoai tây chiên là đồ ăn nhanh phổ biến ở nhiều quốc gia từ thành thị cho đến nông thôn. Mỗi củ khoai tây sẽ được biến tấu thành đủ món và các món đều có hương vị riêng không giống nhau. Hiện nay, có ít nhất 15 loại khoai tây chiên như khoai tây xoắn, khoai tây cắt lát mỏng, khoai tây cắt dọc truyền thống, khoai tây kiểu Bỉ,...', '25.000', '30.000', 'uploads/an-bo-dau-phong-co-map-khong-va-cach-su-dung-2_GCpqpzU.jpg', 'uploads/pizza-ngon-re-11-compressed_11sWBVY.jpg', 'uploads/pizza-american_style-texgrill-haiphong__5__0c4a7117ab9a418c97b60aa709165974_gran_RViySyV.jpg', 'uploads/khoaitaychienbo-1627903280-4666-1627903355.jpg', 1, 'khoai-tay-chien', 1, 0),
(6, 'Xúc xích bò', 'Xúc xích là một trong những loại đồ ăn nhanh phổ biến được chế biến từ các loại thịt như heo, bò hay gà. Với thành phần chính là thịt xay nhuyễn kết hợp cùng bột, phụ gia và các loại gia vị. Bên cạnh đó, vỏ xúc xích được làm bằng Collagen vì mỏng, có độ dai và giòn. Bạn có thể đem xúc xích đi chiên, nướng hoặc hấp đều thơm ngon.', '15.000', '20.000', 'uploads/an-bo-dau-phong-co-map-khong-va-cach-su-dung-2_GUJysJM.jpg', 'uploads/pizza-ngon-re-11-compressed_HRNuu6H.jpg', 'uploads/pizza-american_style-texgrill-haiphong__5__0c4a7117ab9a418c97b60aa709165974_gran_piu3Nya.jpg', 'uploads/khoaitaychienbo-1627903280-4666-1627903355_1mOce9v.jpg', 1, 'xuc-xich-bo', 1, 0),
(7, 'Bim bim Snack Lays', 'Snack hay còn gọi là bim bim, một trong những loại đồ ăn vặt thường được làm từ khoai tây hay các loại bột được tẩm ướp gia vị. Snack được đóng túi ăn liền nên có thể giúp bạn chống đói nhanh chóng hoặc ăn kèm khi tán gẫu cùng bạn bè.', '20.000', '25.000', 'uploads/an-bo-dau-phong-co-map-khong-va-cach-su-dung-2_Ja5jOuT.jpg', 'uploads/khoaitaychienbo-1627903280-4666-1627903355_wrzO6iK.jpg', 'uploads/pizza-ngon-re-11-compressed_on9dmEt.jpg', 'uploads/pizza-american_style-texgrill-haiphong__5__0c4a7117ab9a418c97b60aa709165974_gran_FGooud7.jpg', 1, 'bim-bim-snack-lays', 1, 0),
(8, 'Salad rau trộn', 'Salad rau trộn là một món đồ ăn nhanh ngon được nhiều người ưa chuộng, bởi sử dụng nhiều loại rau xanh cùng nước sốt có vị chua ngọt để kích thích vị giác ngon hơn trong bữa ăn. Bạn có thể dùng cải xoăn, rong nhỏ, rau bina,... vì chứa nhiều vitamin, chất xơ, các chất chống oxy hóa có lợi cho hệ tiêu hóa, phòng ngừa bệnh ung thư và tim mạch.', '35.000', '50.000', 'uploads/pizza-ngon-re-11-compressed_9kHItlH.jpg', 'uploads/an-bo-dau-phong-co-map-khong-va-cach-su-dung-2_qF8J7LF.jpg', 'uploads/khoaitaychienbo-1627903280-4666-1627903355_pyVH074.jpg', 'uploads/pizza-american_style-texgrill-haiphong__5__0c4a7117ab9a418c97b60aa709165974_gran_VSgzZCI.jpg', 1, 'salad-rau-tron', 1, 0),
(9, 'Chè đậu xanh', 'Chè đậu thường được nấu bằng đậu đen, đậu xanh, đậu đỏ hoặc đậu trắng,... Món chè đậu thơm ngon ăn kèm nước cốt dừa, có thể ăn nóng hoặc lạnh. Đậu ngọt bùi, nước cốt dừa béo béo vừa ăn, sẽ là món tráng miệng phù hợp cho những buổi cơm chiều cuối tuần oi ả.', '15.000', '20.000', 'uploads/pizza-american_style-texgrill-haiphong__5__0c4a7117ab9a418c97b60aa709165974_gran_vSiZO6B.jpg', 'uploads/pizza-ngon-re-11-compressed_p9wpZ5O.jpg', 'uploads/khoaitaychienbo-1627903280-4666-1627903355_i8xK9ww.jpg', 'uploads/an-bo-dau-phong-co-map-khong-va-cach-su-dung-2_LqT5L8e.jpg', 1, 'che-au-xanh', 2, 0),
(10, 'Bánh chuỗi nướng', 'Bánh chuối nướng là món bánh tráng miệng thơm ngon, nguyên liệu dễ. Món bánh tơi xốp có vị ngọt vừa phải của chuối, mùi thơm nồng nàn, rất kích thích vị giác. Bạn có thể thêm một ít socola chip để bánh ngon hơn, các em nhỏ cũng thích thú thưởng thức hơn.', '30.000', '40.000', 'uploads/an-bo-dau-phong-co-map-khong-va-cach-su-dung-2_yngDM5w.jpg', 'uploads/pizza-ngon-re-11-compressed_4E8fLjb.jpg', 'uploads/pizza-american_style-texgrill-haiphong__5__0c4a7117ab9a418c97b60aa709165974_gran_c57qHCj.jpg', 'uploads/khoaitaychienbo-1627903280-4666-1627903355_l6cxjJM.jpg', 1, 'banh-chuoi-nuong', 2, 0),
(11, 'Kem vị chuối', 'Kem chuối mát lạnh sẽ là món tráng miệng ngon sau bữa ăn. Kem chuối có vị ngọt từ chuối, vị béo từ nước cốt dừa, vị bùi của đậu phộng và dừa bào. Tất cả hương vị sẽ hòa quyện với nhau, tạo nên món ăn vừa miệng và độc đáo.', '10.000', '15.000', 'uploads/pizza-ngon-re-11-compressed_uu9CGjR.jpg', 'uploads/an-bo-dau-phong-co-map-khong-va-cach-su-dung-2_6W0sg6K.jpg', 'uploads/khoaitaychienbo-1627903280-4666-1627903355_iIJ9MDw.jpg', 'uploads/pizza-american_style-texgrill-haiphong__5__0c4a7117ab9a418c97b60aa709165974_gran_V4E3Rk2.jpg', 1, 'kem-vi-chuoi', 2, 0),
(12, 'Thạch rau câu dừa', 'Rau câu dừa là món tráng miệng phổ biến tại Việt Nam. Đây là món tráng miệng dịu mát, thích hợp dùng sau bữa cơm gia đình. Rau câu dừa có vị ngọt thanh của nước dừa tươi và vị béo nhẹ từ nước cốt dừa. Bạn cũng có thể biến tấu rau câu bằng cách thêm những màu thực phẩm tự nhiên vào rau câu để thêm phần bắt mắt.', '25.000', '35.000', 'uploads/khoaitaychienbo-1627903280-4666-1627903355_Xs714Yi.jpg', 'uploads/an-bo-dau-phong-co-map-khong-va-cach-su-dung-2_r5ailgD.jpg', 'uploads/pizza-american_style-texgrill-haiphong__5__0c4a7117ab9a418c97b60aa709165974_gran_frMCnG3.jpg', 'uploads/pizza-ngon-re-11-compressed_BYmGcgF.jpg', 1, 'thach-rau-cau-dua', 2, 0),
(13, 'Nước ép dưa hấu', 'Nước ép dưa hấu là một thức uống giải khát phổ biến và được nhiều người ưa chuộng. Bên cạnh công dụng làm mát, thanh nhiệt cơ thể, nước dưa hấu còn đem lại nhiều lợi ích khác đối với sức khỏe con người. Trong dưa hấu cũng chứa nhiều hàm lượng vitamin C, bổ sung 1 ly nước ép dưa hấu đã giúp cung cấp 21% nhu cầu vitamin C của cơ thể.', '25.000', '30.000', 'uploads/pizza-ngon-re-11-compressed_OwvH57E.jpg', 'uploads/pizza-american_style-texgrill-haiphong__5__0c4a7117ab9a418c97b60aa709165974_gran_g2LIaxP.jpg', 'uploads/khoaitaychienbo-1627903280-4666-1627903355_4xLdLJE.jpg', 'uploads/nuoc-ep-dua-hau-ngot-mat.png', 1, 'nuoc-ep-dua-hau', 2, 0),
(14, 'Bánh phú sĩ', 'Bánh phú sĩ thực chất nó cũng chỉ là một loại bánh bông lan thông thường mà thôi. Chỉ là ở phần mặt ngoài của bánh, được rải một lớp dừa nạo mịn lên như nhưu tuyết trên núi Phú Sĩ. Do đó, người ta lấy luôn cái tên này cho phú hợp với hình thức bên ngoài của bánh.', '30.000', '35.000', 'uploads/nuoc-ep-dua-hau-ngot-mat_quiXB7n.png', 'uploads/khoaitaychienbo-1627903280-4666-1627903355_7xjTRNQ.jpg', 'uploads/pizza-american_style-texgrill-haiphong__5__0c4a7117ab9a418c97b60aa709165974_gran_omjGFVH.jpg', 'uploads/pizza-ngon-re-11-compressed_CO3QYC8.jpg', 1, 'banh-phu-si', 2, 0),
(15, 'Tào phớ tàu hũ', 'Là một món ăn được làm từ đậu nành ( đậu tương ). Khi ăn vào bạn sẽ cảm nhận được vị hơi bùi bùi, sệt sệt… ăn vào tào phớ sẽ tan ngay trong miệng. Không chỉ ở Việt Nam, mà đây còn là món ăn được nhiều nước tại Châu Á yêu thích.', '10.000', '15.000', 'uploads/pizza-american_style-texgrill-haiphong__5__0c4a7117ab9a418c97b60aa709165974_gran_p4bRNnC.jpg', 'uploads/khoaitaychienbo-1627903280-4666-1627903355_KLj1eKD.jpg', 'uploads/mon_tao_pho_bo_duong_d4bc6ac2dac849f19918b9076bedbe21.png', 'uploads/hat-sen-4-1521473243208192765278.png', 1, 'tao-pho-tau-hu', 2, 0),
(16, 'Bánh đậu xanh', 'Bánh đậu xanh là một loại bánh ngọt làm từ bột đậu xanh quết nhuyễn với đường và dầu thực vật hay mỡ động vật, thường là mỡ lợn. Bánh được cắt thành từng khối vuông nhỏ, gói giấy bạc thành hộp nhỏ, lớn hay gói giấy thấm mỡ thành từng thỏi vàng.', '40.000', '50.000', 'uploads/banh-dau-xanh-ngay-tet.jpg', 'uploads/banh-dau-xanh-bao-nhieu-calo-an-banh-dau-xanh-co-beo-khong.jpg', 'uploads/khoaitaychienbo-1627903280-4666-1627903355_GtbI7pY.jpg', 'uploads/pizza-american_style-texgrill-haiphong__5__0c4a7117ab9a418c97b60aa709165974_gran_RzyhRNH.jpg', 1, 'banh-au-xanh', 2, 0),
(17, 'Cơm gà rang', 'Cơm gà là món ăn được chế biến và trình bày với hình thức cơm và thịt gà. Cơm có thể dùng là cơm trắng hoặc cơm chiên, cơm rang và thịt gà được trình bày thông thường là đùi gà hay cánh gà. Món cơm gà tương đối dễ làm và phổ biến. Nhưng tùy theo từng quốc gia và tập tục địa phương mà có những phương cách thực hiện khác nhau.', '35.000', '40.000', 'uploads/47681983_537445423397435_3382415809367244800_n.jpg', 'uploads/71727574_1249422308575924_7876688610311798784_n.jpg', 'uploads/foody-upload-api-foody-mobile-com12-190514153209.jpg', 'uploads/Gà-rang-gừng.jpg', 1, 'com-ga-rang', 3, 0),
(18, 'Cơm cá kho', 'Cơm cá kho là món ăn được chế biến từ cơm và cá. Trong đó, cá sẽ được đun kho với các gia vị như xả, ớt, đường. Cơm cá kho tạo cảm giác lạ, ngon miệng cho bữa sáng hoặc bữa chính. Cơm các kho còn được kèm theo sốt kho cá giúp cơm có vị đậm đà, ngọt ngào khi thưởng thức.', '30.000', '35.000', 'uploads/71727574_1249422308575924_7876688610311798784_n_TwjUkBw.jpg', 'uploads/47681983_537445423397435_3382415809367244800_n_u94ffw3.jpg', 'uploads/fullsizerender-2-15573943705411480150305-1557395260995682516933.png', 'uploads/Gà-rang-gừng_M1DwLAT.jpg', 1, 'com-ca-kho', 3, 0),
(19, 'Cơm chiên trứng', 'Cơm chiên trứng là loại cơm nguội được xào đảo kèm theo các loại trứng gà, vịt... Cơm chiên trứng có màu vàng đẹp mắt, màu xanh xanh của hành lá. Để biết cách làm món cơm chiên trứng thơm ngon, hạt cơm tơi. Cơm chiên trứng là một món ăn rất quen thuộc với tất cả mọi người, bổ xung nhiều hàm lượng chất béo cho cơ thể.', '30.000', '35.000', 'uploads/71727574_1249422308575924_7876688610311798784_n_98Xy2bd.jpg', 'uploads/fullsizerender-2-15573943705411480150305-1557395260995682516933_jNSShZY.png', 'uploads/47681983_537445423397435_3382415809367244800_n_d5qS2lf.jpg', 'uploads/Gà-rang-gừng_6Ig9gb3.jpg', 1, 'com-chien-trung', 3, 0),
(20, 'Cơm rang dưa bò', 'Cơm rang dưa bò là món ngon mê mẩn với nhiều tín đồ yêu thích các món cơm chiên. Nguyên liệu làm quen thuộc, cách làm đơn giản nhanh chóng, ăn vào thấy được vị chua chua giòn giòn của dưa chua, đậm đà của thịt bò, mùi cơm thơm lừng, chỉ có vậy thôi cũng là ta xao xuyến.', '35.000', '40.000', 'uploads/cach-lam-com-rang-dua-bo-1.jpg', 'uploads/cach-lam-com-rang-dua-bo-tai-nha-ngon-nhu-ngoai-hang-202201061628031278.jpg', 'uploads/com-rang-dua-bo-tai-giao-com-ha-noi.jpg', 'uploads/cơm-rang-dưa-bo-recipe-main-photo.jpg', 1, 'com-rang-dua-bo', 3, 0),
(21, 'Cơm bình dân', 'Cơm bình dân là bữa cơm được đi kèm theo nhiều món phụ và xoay quanh món chính là cơm trắng. Cơm bình dân cung cấp nhiều thức ăn đi kèm theo như: thịt lợn, thịt gà, trứng, rau, canh và món chính là cơm trắng. Cơm bình dân cung cấp đầy đủ năng lượng cần thiết cho người ăn.', '35.000', '40.000', 'uploads/quan-com-ngon-binh-dan-tai-ha-noi-wecheckin-10.jpg', 'uploads/quan-com-ngon-binh-dan-tai-ha-noi-wecheckin-9.jpg', 'uploads/cach-nau-com-ngon-tu-nau-com.jpg', 'uploads/640-480-nhung-quan-com-ngon-re-o-ha-noi-0d2e.jpg', 1, 'com-binh-dan', 3, 0),
(22, 'Cơm thịt kho trứng', 'Cơm thịt kho trứng là loại cơm được ăn kèm theo thức ăn thịt lợn kho cùng với trứng, thịt lợn và trứng khi kho cùng nhau sẽ có đầy đủ gia vị như nước sốt, nước kho, ớt, đường. Cơm thịt kho chứng sẽ là sự kết hợp hoàn hảo giữa cả trứng cả thịt và cả cơm. Khi kho trứng với thịt còn có nước dùng ăn kèm cùng với cơm, giúp món ăn thêm ngọt ngào đậm đà.', '30.000', '35.000', 'uploads/Anh3-1606619513-6851-1606619920.jpg', 'uploads/photo.jpg', 'uploads/4-mon-an-kem-voi-thit-kho-tau-chong-ngan-hieu-qua-202102051013091497.jpg', 'uploads/49769213_2152103948215657_2483689904064692224_n.jpg', 1, 'com-thit-kho-trung', 3, 0),
(23, 'Cơm Pizza', 'Sử dụng các nguyên liệu như trứng gà, nước sốt cà chua, phô mai Mozzarella và nguyên liệu kèm theo tùy sở thích.Cơm pizza là món ăn chính của cơm, món cơm này rất lạ miệng, ngon không khác gì pizza truyền thống mà còn cung cấp đầy đủ chất béo và chất dinh dưỡng cho người ăn.', '25.000', '35.000', 'uploads/4-mon-an-kem-voi-thit-kho-tau-chong-ngan-hieu-qua-202102051013091497_wvLCPXD.jpg', 'uploads/49769213_2152103948215657_2483689904064692224_n_QAOs6ST.jpg', 'uploads/Anh3-1606619513-6851-1606619920_zTnXKlr.jpg', 'uploads/pizza-com-5-1550580952700108361849-crop-15505812996681844613027.png', 1, 'com-pizza', 3, 0),
(24, 'Cơm cháy giòn', 'Từng miếng cơm cháy giòn tan ăn kèm với chà bông, khô gà, mỡ hành. Rưới lên trên là nước mắm kích thích vị giác. Món ăn này thích hợp để làm món ăn vặt ngồi thưởng thức quây quần cùng gia đình vào cuối tuần.', '25.000', '30.000', 'uploads/242155533_2645475232424617_8614505083727285194_n_2a85fb0fb175480ebe2c63eaed5376f4.jpg', 'uploads/cach-lam-com-chay-cha-bong-mo-hanh-gion-ngon-5.jpg', 'uploads/com-chay-cha-bong.jpg', 'uploads/lam-com-chay-chien-nuoc-mam-kieu-moi-gion-rum-thom-phuc-an-chang-muon-dung-20210_YU1vgFQ.jpg', 1, 'com-chay-gion', 3, 0),
(25, 'Nước uống Coca Cola', 'Coca-Cola là một thương hiệu nước ngọt có ga chứa nước cacbon dioxide bão hòa được sản xuất bởi Công ty Coca-Cola. Coca-Cola được điều chế bởi dược sĩ John Pemberton vào cuối thế kỷ XIX với mục đích ban đầu là trở thành một loại biệt dược.', '12.000', '15.000', 'uploads/0006966_nuoc-ngot-coca-cola-original-nhat-500ml.png', 'uploads/242155533_2645475232424617_8614505083727285194_n_2a85fb0fb175480ebe2c63eaed5376f_zbPmdb2.jpg', 'uploads/cocacola_320ml_8be946c2e0344c4ba7d9988e1127a9c8_f19e0f18d02b4e79ab54f8b9c2f9566f_master.png', 'uploads/Nước-giải-khát-Coca-Cola-lon-250ml.jpg', 1, 'nuoc-uong-coca-cola', 4, 0),
(26, 'Nước uống Pepsi', 'Pepsi một đồ uống giải khát có gas, lần đầu tiên được sản xuất bởi Bradham.Ban đầu, Ông pha chế ra một loại nước uống dễ hấp thụ làm từ nước cacbonat, đường, vani và một ít dầu ăn dưới tên “Nước uống của Brad\" năm 1892.', '12.000', '15.000', 'uploads/pepsi.jpg', 'uploads/Nước-giải-khát-Coca-Cola-lon-250ml_mPgTaUV.jpg', 'uploads/london-uk-june-aluminium-can-gla1.jpg', 'uploads/242155533_264547523244.jpg', 1, 'nuoc-uong-pepsi', 4, 0),
(27, 'Nước uống Sting', 'Sting là thương hiệu nước tăng lực của Tập đoàn PepsiCo. Sản phẩm cung cấp các chất bổ sung năng lượng cho cơ thể như taurine, inositol, vitamin B và caffeine, đồng thời mang đến cảm giác sảng khoái và bứt phá.', '10.000', '12.000', 'uploads/nuoc-tang-luc-sting-sleek-huong-dau-320ml-202111061723498584.jpg', 'uploads/nuoc-tang-luc-sting-sleek-huong-dau-lon-320ml-5.jpg', 'uploads/8934588232220.jpg', 'uploads/Nước-tăng-lực-Sting-hương-dâu-tây-đỏ-lon-330ml.jpg', 1, 'nuoc-uong-sting', 4, 0),
(28, 'Nước uống Rell Bull', 'Red Bull là loại nước uống tăng lực sở hữu bởi công ty Red Bull GmbH của Áo. Nước uống này được doanh nhân người Áo Dietrich Mateschitz phát minh ra vào năm 1987 và thị phần của Red Bull chiếm phần lớn trong thị trường đồ uống tăng lực trên thế giới, với khoảng 3 tỷ lon được bán mỗi năm.', '15.000', '17.000', 'uploads/Nước-tăng-lực-Sting-hương-dâu-tây-đỏ-lon-330ml_CAilrRj.jpg', 'uploads/nuoc-tang-luc-sting-sleek-huong-dau-lon-320ml-5_dU37aVe.jpg', 'uploads/nuoc-tang-luc-sting-sleek-huong-dau-320ml-202111061723498584_fTecZW0.jpg', 'uploads/c2a88a7d8943aadccd588fe38c2f3141.png', 1, 'nuoc-uong-rell-bull', 4, 0),
(29, 'Nước uống Nutriboost', 'Nutriboost là thức uống dinh dưỡng kết hợp sữa và nước trái cây thơm ngon, giúp bạn luôn tràn năng lượng cho một ngày làm việc hiệu quả. Sản phẩm là sự kết hợp của nguồn sữa chất lượng từ New Zealand, nước trái cây thật, bổ sung thêm Vitamin B3, B6, Canxi, Kẽm.', '15.000', '20.000', 'uploads/sua-trai-cay-nutriboost-huong-cam-297ml-202202122134397133.jpg', 'uploads/Nước-tăng-lực-Sting-hương-dâu-tây-đỏ-lon-330ml_O1UBFeR.jpg', 'uploads/nuoc-tang-luc-sting-sleek-huong-dau-lon-320ml-5_wnkCCNT.jpg', 'uploads/nuoc-tang-luc-sting-sleek-huong-dau-320ml-202111061723498584_DCxQjLg.jpg', 1, 'nuoc-uong-nutriboost', 4, 0),
(30, 'Nước uống C2', 'Trà xanh C2 được chắt lọc từ 100% trà xanh tự nhiên cao nguyên Việt Nam, đảm bảo sự tươi nguyên và thanh khiết của trà. Trà C2 có 3 loại sản phẩm C2 trà đào, C2 trà táo, C2 trà vải và 5 hương vị cho bạn nhiều sự lựa chọn.', '10.000', '12.000', 'uploads/tra-xanh-c2-huong-chanh-360ml-201912090949471802.jpg', 'uploads/03a2592190d1d1151e0f98a2c4057eed.jpg_525x525q80.jpg', 'uploads/eaab7659abcce76fa3909db07fbaaad7.jpg', 'uploads/56dd9fa72c02699f187de288294cbf85.jpg', 1, 'nuoc-uong-c2', 4, 0),
(31, 'Trà xanh Không độ', 'Thực phẩm bổ sung Trà xanh Không Độ được Tập đoàn Tân Hiệp Phát tung ra thị trường đầu năm 2006. Bởi sản phẩm được chiết xuất từ lá trà xanh nguyên chất 100%, được đóng trong chai Pet, chịu được nhiệt độ cao nên vẫn giữ được các chất bổ dưỡng.', '10.000', '12.000', 'uploads/56dd9fa72c02699f187de288294cbf85_4vfwRZ0.jpg', 'uploads/03a2592190d1d1151e0f98a2c4057eed.jpg_525x525q80_RHCttgm.jpg', 'uploads/eaab7659abcce76fa3909db07fbaaad7_zKkWMgv.jpg', 'uploads/tra-xanh-c2-huong-chanh-360ml-201912090949471802_5Giiirh.jpg', 1, 'tra-xanh-khong-o', 4, 0),
(32, 'Nước cam Twister', 'Nước ép cam Twister được biết đến là dòng sản phẩm được làm hoàn toàn từ cam tươi nguyên chất và điều đặc biệt là không chứa phẩm màu hay chất bảo quản gây hại cho sức khỏe. Nước cam cung cấp nhiều vitamin C cho cơ thể, giúp ta bù nước và chất khoáng.', '15.000', '17.000', 'uploads/mBHNbDZDiM.jpg', 'uploads/K0CtrJud7pj.jpg', 'uploads/zk6q9pRobUby.jpg', 'uploads/BRc3Y7wCMVY6X.jpg', 1, 'nuoc-cam-twister', 1, 0),
(33, 'Nam', 'abc', '10.000', '15.000', 'uploads/4te2SOmsVU.jpg', 'uploads/dTavC4Hg15Q.jpg', 'uploads/nWvuHRBYEEYM.jpg', 'uploads/J6VWgeLHPYvnx.jpg', 1, 'nam', 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `api_foodcart`
--

CREATE TABLE `api_foodcart` (
  `id` bigint(20) NOT NULL,
  `addCart` tinyint(1) NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `isOrder` tinyint(1) NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(10,3) NOT NULL,
  `number` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `api_foodcart`
--

INSERT INTO `api_foodcart` (`id`, `addCart`, `product_id`, `user_id`, `isOrder`, `image`, `name`, `price`, `number`) VALUES
(27, 1, 1, 1, 0, 'uploads/Sữa-chua-nha-đam-Vinamilk-hộp-100g.jpg', 'Sữa chua Vinamilk', '60.000', 1),
(28, 0, 5, 1, 0, 'uploads/an-bo-dau-phong-co-map-khong-va-cach-su-dung-2_GCpqpzU.jpg', 'Khoai tây chiên', '25.000', 1),
(29, 0, 5, 1, 0, 'uploads/an-bo-dau-phong-co-map-khong-va-cach-su-dung-2_GCpqpzU.jpg', 'Khoai tây chiên', '25.000', 1),
(30, 0, 11, 1, 0, 'uploads/pizza-ngon-re-11-compressed_uu9CGjR.jpg', 'Kem vị chuối', '10.000', 1),
(31, 0, 3, 1, 0, 'uploads/an-bo-dau-phong-co-map-khong-va-cach-su-dung-2.jpg', 'Bánh mỳ bơ lạc', '25.000', 1),
(32, 0, 9, 1, 0, 'uploads/pizza-american_style-texgrill-haiphong__5__0c4a7117ab9a418c97b60aa709165974_gran_vSiZO6B.jpg', 'Chè đậu xanh', '15.000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `api_foodcategory`
--

CREATE TABLE `api_foodcategory` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `api_foodcategory`
--

INSERT INTO `api_foodcategory` (`id`, `name`, `slug`, `description`, `image`) VALUES
(1, 'Đồ Ăn Nhanh', 'o-an-nhanh', 'Đồ ăn nhanh có tên gọi tiếng anh là Fastfood. Đây là những món ăn, thực phẩm hay đồ uống được chế biến nhanh chóng và thưởng thức tại chỗ hoặc gói mang về. Thông thường, đồ ăn nhanh được chế biến sẵn, khi khách tới mua thì nhà hàng chỉ cần làm nóng hoặc chiên lại trong vài phút là đã có thể phục vụ thực khách.', 'uploads/do_an_nhanh.png'),
(2, 'Đồ Tráng Miệng', 'o-trang-mieng', 'Tráng miệng là một món ăn nhẹ (có thể là bánh kẹo) dùng khi kết thúc một bữa ăn chính. Khẩu phần nhỏ thôi nhưng trình bày đẹp mắt. Món này thường bao gồm các loại thực phẩm ngọt, và có thể là đồ uống như rượu vang tráng miệng hoặc rượu mùi, nhưng có thể bao gồm cà phê, pho mát, hạt quả, hoặc các món ăn khác.', 'uploads/trang_mieng.png'),
(3, 'Đồ Ăn Cơm', 'o-an-com', 'Cơm là một loại thức ăn được làm ra từ gạo bằng cách đem nấu với một lượng vừa đủ nước để nấu chín. Cơm thường có nguyên liệu là gạo tẻ/gạo nếp và không có thêm gia vị, là thức ăn chính gần như hàng ngày của người Đông Nam Á và Đông Á. Cơm còn là nguyên liệu cho các món ăn chế biến khác nhau', 'uploads/do_an_com.png'),
(4, 'Nước Giải Khát', 'nuoc-giai-khat', 'Nước giải khát có ga là một loại thức uống thường chứa nước cácbon dioxide bão hòa, chất làm ngọt, và thường có thêm hương liệu. Chất làm ngọt có thể là đường, xirô bắp giàu gluctose, chất làm ngọt thay thế. Một số nước giải khát có ga khác còn chứa caffeine, phẩm màu, chất bảo quản và các thành phần khác.', 'uploads/nuoc_giai_khat.png');

-- --------------------------------------------------------

--
-- Table structure for table `api_foodorder`
--

CREATE TABLE `api_foodorder` (
  `id` bigint(20) NOT NULL,
  `personOrder` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `addressOrder` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `timeOrder` datetime(6) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(10,3) NOT NULL,
  `isReceived` tinyint(1) NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `phoneOrder` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `isCancel` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `api_foodorder`
--

INSERT INTO `api_foodorder` (`id`, `personOrder`, `addressOrder`, `timeOrder`, `name`, `image`, `price`, `isReceived`, `product_id`, `user_id`, `number`, `phoneOrder`, `isCancel`) VALUES
(1, 'Chu Minh Nam', 'Cổ Nhuế, Bắc Từ Liêm, Hà Nội', '2022-11-02 09:35:52.981413', 'Sữa chua Vinamilk', 'uploads/Sữa-chua-nha-đam-Vinamilk-hộp-100g.jpg', '60.000', 0, 1, 1, 1, '0', 0),
(2, 'Trần Ngọc Hà', 'Xuan Dinh, Bac Tu Liem, Ha Noi', '2022-11-02 09:49:56.000000', 'Salad rau trộn', 'uploads/pizza-ngon-re-11-compressed_9kHItlH.jpg', '35.000', 1, 8, 2, 1, '03883159688', 0),
(3, 'Trần Ngọc Hà', 'Xuan Dinh, Bac Tu Liem, Ha Noi', '2022-11-02 16:51:31.916989', 'Nước cam Twister', 'uploads/tra-xanh-c2-huong-chanh-360ml-201912090949471802_cuq7fgZ.jpg', '15.000', 0, 32, 2, 1, '0', 0),
(4, 'Chu Minh Nam', 'Ha Noi', '2023-07-11 07:53:11.293525', 'Cơm cá kho', 'uploads/71727574_1249422308575924_7876688610311798784_n_TwjUkBw.jpg', '30.000', 0, 18, 13, 1, '0999888999', 0);

-- --------------------------------------------------------

--
-- Table structure for table `api_person`
--

CREATE TABLE `api_person` (
  `id` bigint(20) NOT NULL,
  `money` decimal(10,3) NOT NULL,
  `phone` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `avatar` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `api_person`
--

INSERT INTO `api_person` (`id`, `money`, `phone`, `address`, `user_id`, `avatar`) VALUES
(2, '0.000', '0379962045', 'Cổ Nhuế, Bắc Từ Liêm, Hà Nội', 1, 'uploads_avatar/292185726_163358052892234_5730603579703538344_n.jpg'),
(3, '0.000', '03883159688', 'Xuan Dinh, Bac Tu Liem, Ha Noi', 2, 'uploads_avatar/default.png'),
(4, '0.000', '0999888777', '', 5, 'uploads_avatar/default.png'),
(5, '0.000', '0966888999', '', 6, 'uploads_avatar/default.png'),
(6, '0.000', '0966888999', '', 7, 'uploads_avatar/default.png'),
(7, '0.000', '0999888777', '', 8, 'uploads_avatar/default.png'),
(8, '0.000', '0999888777', '', 9, 'uploads_avatar/default.png'),
(9, '0.000', '0214268999', '', 10, 'uploads_avatar/default.png'),
(10, '0.000', '0388315968', '', 11, 'uploads_avatar/default.png'),
(11, '0.000', '0999888999', 'Ha Noi', 12, 'uploads_avatar/default.png'),
(12, '0.000', '0999888999', 'Ha Noi', 13, 'uploads_avatar/default.png');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add food category', 7, 'add_foodcategory'),
(26, 'Can change food category', 7, 'change_foodcategory'),
(27, 'Can delete food category', 7, 'delete_foodcategory'),
(28, 'Can view food category', 7, 'view_foodcategory'),
(29, 'Can add food', 8, 'add_food'),
(30, 'Can change food', 8, 'change_food'),
(31, 'Can delete food', 8, 'delete_food'),
(32, 'Can view food', 8, 'view_food'),
(33, 'Can add person', 9, 'add_person'),
(34, 'Can change person', 9, 'change_person'),
(35, 'Can delete person', 9, 'delete_person'),
(36, 'Can view person', 9, 'view_person'),
(37, 'Can add food cart', 10, 'add_foodcart'),
(38, 'Can change food cart', 10, 'change_foodcart'),
(39, 'Can delete food cart', 10, 'delete_foodcart'),
(40, 'Can view food cart', 10, 'view_foodcart'),
(41, 'Can add food order', 11, 'add_foodorder'),
(42, 'Can change food order', 11, 'change_foodorder'),
(43, 'Can delete food order', 11, 'delete_foodorder'),
(44, 'Can view food order', 11, 'view_foodorder');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(254) COLLATE utf8_unicode_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$320000$EwEj8FE2SLugRlQ64MCOr8$jT1i3qS5ijn1WUBJVnCPWutte1yd7R4ObmsLi9Sh0FM=', '2023-02-06 12:37:40.218125', 1, 'chuminhnam', 'Chu', 'Minh Nam', 'chuminhnamma@gmail.com', 1, 1, '2022-09-24 12:17:49.000000'),
(2, 'pbkdf2_sha256$320000$QJtNmbvDIurlJewPtx8E3l$JDPGxJym7PaBlF8lXJH1+nOHcYpGJHc8tRm7VvlyPEY=', NULL, 0, 'tranngocha', 'Trần Ngọc', 'Hà', 'tranngocha@gmail.com', 0, 1, '2022-09-27 01:32:53.000000'),
(3, 'nguyenvana123!@', NULL, 0, 'nguyenvana', '', '', '', 0, 1, '2022-10-10 14:35:56.389988'),
(4, 'nguyenvana123!@', NULL, 0, 'nguyenvanb', '', '', '', 0, 1, '2022-10-10 14:39:07.342795'),
(5, 'nguyenvana123!@', NULL, 0, 'nguyenvanc', '', '', '', 0, 1, '2022-10-10 14:49:27.308775'),
(6, 'nguyenvand', NULL, 0, 'nguyenvand', '', '', '', 0, 1, '2022-10-10 15:12:14.013457'),
(7, 'nguyenvane', NULL, 0, 'nguyenvane', '', '', '', 0, 1, '2022-10-10 15:12:23.093582'),
(8, 'chuminhnam', NULL, 0, 'namdeptrai', '', '', '', 0, 1, '2022-10-10 15:19:13.643663'),
(9, 'pbkdf2_sha256$320000$Rq2vrxASFZd87DhDXoZjdx$sc0C4C4lI/8qkeYjCbd2r9IQEZ4co9XF+F/7Nl+UDZA=', NULL, 0, 'nguyenvang', '', '', '', 0, 1, '2022-10-10 15:21:11.119495'),
(10, 'pbkdf2_sha256$320000$5xdqQBqplWRnuMIAvFONTf$lLOCKKBkXOtxgQe54MJtpWQJZBHzYG/AP7tOQOalJmo=', NULL, 0, 'nguyenvanh', '', '', '', 0, 1, '2022-10-10 15:22:05.315874'),
(11, 'pbkdf2_sha256$320000$H7Epshaa6J8utj2dVYzdFr$DFtyNpyWxOwyYENEQcBXWFunxUznW4tRK+ks+7YKBFQ=', NULL, 0, 'ngocha', '', '', '', 0, 1, '2022-10-11 12:07:32.173594'),
(12, 'pbkdf2_sha256$320000$vvdBIZltpnqyfmyJIe8oqo$XjASJOdoVgRokheu1FHc1gsjoztjZOpywlBvRJ5A1m0=', NULL, 0, 'nam', 'Chu', 'Minh Nam', 'chuminhnam@gmail.com', 0, 1, '2023-07-11 00:47:48.220905'),
(13, 'pbkdf2_sha256$320000$XcVOk5DlGWSTyCzK3MsazY$MzhsHC+riHCflB1gqnhHzdjb5/IX9H/Ru2KrE7SCqrg=', NULL, 0, 'nam2', 'Chu', 'Minh Nam', 'chuminhnam@gmail.com', 0, 1, '2023-07-11 00:52:15.130552');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8_unicode_ci DEFAULT NULL,
  `object_repr` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2022-09-25 10:00:45.261171', '1', 'Đồ Ăn Nhanh', 1, '[{\"added\": {}}]', 7, 1),
(2, '2022-09-25 10:00:52.599693', '1', 'Đồ Ăn Nhanh', 2, '[{\"changed\": {\"fields\": [\"Slug\"]}}]', 7, 1),
(3, '2022-09-25 10:01:41.444810', '1', 'Sữa chua Vinamilk', 1, '[{\"added\": {}}]', 8, 1),
(4, '2022-09-25 10:01:50.458838', '1', 'Sữa chua Vinamilk', 2, '[]', 8, 1),
(5, '2022-09-25 10:07:38.329526', '2', 'Bánh kẹp thịt', 1, '[{\"added\": {}}]', 8, 1),
(6, '2022-09-25 10:09:45.179389', '3', 'Bánh mỳ bơ lạc', 1, '[{\"added\": {}}]', 8, 1),
(7, '2022-09-25 10:13:19.173705', '4', 'Bánh Pizza', 1, '[{\"added\": {}}]', 8, 1),
(8, '2022-09-25 10:16:08.062409', '5', 'Khoai tây chiên', 1, '[{\"added\": {}}]', 8, 1),
(9, '2022-09-25 10:18:23.094194', '6', 'Xúc xích bò', 1, '[{\"added\": {}}]', 8, 1),
(10, '2022-09-25 10:20:52.217460', '7', 'Bim bim Snack Lays', 1, '[{\"added\": {}}]', 8, 1),
(11, '2022-09-25 10:22:49.124119', '8', 'Salad rau trộn', 1, '[{\"added\": {}}]', 8, 1),
(12, '2022-09-25 10:24:38.550539', '2', 'Đồ Tráng Miệng', 1, '[{\"added\": {}}]', 7, 1),
(13, '2022-09-25 10:28:29.781472', '9', 'Chè đậu xanh', 1, '[{\"added\": {}}]', 8, 1),
(14, '2022-09-25 10:30:27.119870', '10', 'Bánh chuỗi nướng', 1, '[{\"added\": {}}]', 8, 1),
(15, '2022-09-25 10:32:00.976884', '11', 'Kem vị chuối', 1, '[{\"added\": {}}]', 8, 1),
(16, '2022-09-25 10:34:18.684759', '12', 'Thạch rau câu dừa', 1, '[{\"added\": {}}]', 8, 1),
(17, '2022-09-25 10:39:05.176018', '13', 'Nước ép dưa hấu', 1, '[{\"added\": {}}]', 8, 1),
(18, '2022-09-25 10:41:41.052133', '14', 'Bánh phú sĩ', 1, '[{\"added\": {}}]', 8, 1),
(19, '2022-09-25 10:45:41.734435', '15', 'Tào phớ tàu hũ', 1, '[{\"added\": {}}]', 8, 1),
(20, '2022-09-25 10:48:32.596540', '16', 'Bánh đậu xanh', 1, '[{\"added\": {}}]', 8, 1),
(21, '2022-09-25 10:49:57.120677', '3', 'Cơm', 1, '[{\"added\": {}}]', 7, 1),
(22, '2022-09-25 10:50:14.394577', '3', 'Đồ Ăn Cơm', 2, '[{\"changed\": {\"fields\": [\"Name\", \"Slug\"]}}]', 7, 1),
(23, '2022-09-25 10:54:52.605294', '17', 'Cơm gà rang', 1, '[{\"added\": {}}]', 8, 1),
(24, '2022-09-25 11:00:15.623712', '18', 'Cơm cá kho', 1, '[{\"added\": {}}]', 8, 1),
(25, '2022-09-25 11:04:43.808079', '19', 'Cơm chiên trứng', 1, '[{\"added\": {}}]', 8, 1),
(26, '2022-09-25 11:07:46.088943', '20', 'Cơm rang dưa bò', 1, '[{\"added\": {}}]', 8, 1),
(27, '2022-09-25 11:07:51.396033', '20', 'Cơm rang dưa bò', 2, '[]', 8, 1),
(28, '2022-09-25 11:15:09.744636', '21', 'Cơm bình dân', 1, '[{\"added\": {}}]', 8, 1),
(29, '2022-09-25 11:23:32.321434', '22', 'Cơm thịt kho trứng', 1, '[{\"added\": {}}]', 8, 1),
(30, '2022-09-25 11:28:40.325416', '23', 'Cơm Pizza', 1, '[{\"added\": {}}]', 8, 1),
(31, '2022-09-25 11:32:54.286028', '24', 'Cơm cháy giòn', 1, '[{\"added\": {}}]', 8, 1),
(32, '2022-09-25 11:34:11.570647', '4', 'Nước Giải Khát', 1, '[{\"added\": {}}]', 7, 1),
(33, '2022-09-25 11:37:55.276812', '25', 'Nước uống Coca Cola', 1, '[{\"added\": {}}]', 8, 1),
(34, '2022-09-25 11:41:29.933208', '26', 'Nước uống Pepsi', 1, '[{\"added\": {}}]', 8, 1),
(35, '2022-09-25 11:44:23.767800', '27', 'Nước uống Sting', 1, '[{\"added\": {}}]', 8, 1),
(36, '2022-09-25 11:48:06.341131', '28', 'Nước uống Rell Bull', 1, '[{\"added\": {}}]', 8, 1),
(37, '2022-09-25 11:50:12.897538', '29', 'Nước uống Nutriboost', 1, '[{\"added\": {}}]', 8, 1),
(38, '2022-09-25 11:52:49.679986', '30', 'Nước uống C2', 1, '[{\"added\": {}}]', 8, 1),
(39, '2022-09-25 11:54:30.702257', '31', 'Trà xanh Không độ', 1, '[{\"added\": {}}]', 8, 1),
(40, '2022-09-25 11:57:25.444517', '32', 'Nước cam Twister', 1, '[{\"added\": {}}]', 8, 1),
(41, '2022-09-25 17:30:54.893805', '1', 'chuminhnam', 1, '[{\"added\": {}}]', 10, 1),
(42, '2022-09-25 17:31:00.097958', '2', 'chuminhnam', 1, '[{\"added\": {}}]', 10, 1),
(43, '2022-09-25 17:32:28.924223', '2', 'chuminhnam', 2, '[{\"changed\": {\"fields\": [\"AddCart\"]}}]', 10, 1),
(44, '2022-09-25 17:32:31.625874', '1', 'chuminhnam', 2, '[{\"changed\": {\"fields\": [\"AddCart\"]}}]', 10, 1),
(45, '2022-09-25 17:49:10.508276', '3', 'chuminhnam', 1, '[{\"added\": {}}]', 10, 1),
(46, '2022-09-25 17:49:15.016406', '4', 'chuminhnam', 1, '[{\"added\": {}}]', 10, 1),
(47, '2022-09-26 00:33:56.396423', '1', 'chuminhnam', 1, '[{\"added\": {}}]', 9, 1),
(48, '2022-09-26 00:38:52.451073', '1', 'chuminhnam', 3, '', 9, 1),
(49, '2022-09-27 01:32:53.946336', '2', 'tranngocha', 1, '[{\"added\": {}}]', 4, 1),
(50, '2022-09-27 01:33:09.046718', '2', 'tranngocha', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\", \"Email address\"]}}]', 4, 1),
(51, '2022-09-27 01:33:26.812239', '2', 'chuminhnam', 1, '[{\"added\": {}}]', 9, 1),
(52, '2022-09-27 01:34:05.980946', '3', 'tranngocha', 1, '[{\"added\": {}}]', 9, 1),
(53, '2022-09-27 03:52:08.664203', '7', 'tranngocha', 3, '', 10, 1),
(54, '2022-09-27 03:52:12.515021', '9', 'tranngocha', 3, '', 10, 1),
(55, '2022-09-27 03:52:31.894718', '10', 'tranngocha', 1, '[{\"added\": {}}]', 10, 1),
(56, '2022-09-27 03:57:07.807778', '8', 'chuminhnam', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 10, 1),
(57, '2022-09-27 03:57:36.973578', '8', 'chuminhnam', 2, '[]', 10, 1),
(58, '2022-09-27 03:58:48.286027', '3', 'chuminhnam', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 10, 1),
(59, '2022-09-27 04:59:18.154057', '3', 'chuminhnam', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 10, 1),
(60, '2022-09-27 05:05:01.890989', '8', 'chuminhnam', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 10, 1),
(61, '2022-09-27 05:05:05.378255', '3', 'chuminhnam', 2, '[]', 10, 1),
(62, '2022-09-27 05:05:07.743281', '4', 'chuminhnam', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 10, 1),
(63, '2022-09-27 05:05:10.480334', '5', 'chuminhnam', 2, '[{\"changed\": {\"fields\": [\"Status\"]}}]', 10, 1),
(64, '2022-09-27 11:48:53.125122', '1', 'chuminhnam', 2, '[{\"changed\": {\"fields\": [\"First name\", \"Last name\"]}}]', 4, 1),
(65, '2022-09-27 12:30:32.665373', '2', 'tranngocha', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(66, '2022-09-27 12:57:43.695850', '2', 'tranngocha', 2, '[{\"changed\": {\"fields\": [\"password\"]}}]', 4, 1),
(67, '2022-09-28 12:01:30.656589', '13', 'chuminhnam', 2, '[{\"changed\": {\"fields\": [\"Product\"]}}]', 10, 1),
(68, '2022-10-10 10:14:43.205737', '2', 'chuminhnam', 2, '[{\"changed\": {\"fields\": [\"Avatar\"]}}]', 9, 1),
(69, '2022-10-10 10:23:34.338597', '2', 'chuminhnam', 2, '[{\"changed\": {\"fields\": [\"Avatar\"]}}]', 9, 1),
(70, '2022-10-21 08:18:19.267999', '4', 'Nước Giải Khát', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(71, '2022-10-21 08:21:21.334719', '3', 'Đồ Ăn Cơm', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(72, '2022-10-21 08:22:09.861965', '2', 'Đồ Tráng Miệng', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(73, '2022-10-21 08:23:12.839627', '1', 'Đồ Ăn Nhanh', 2, '[{\"changed\": {\"fields\": [\"Image\"]}}]', 7, 1),
(74, '2022-10-22 08:05:15.380327', '27', 'chuminhnam', 1, '[{\"added\": {}}]', 10, 1),
(75, '2022-10-22 08:06:21.410021', '4', 'chuminhnam', 3, '', 10, 1),
(76, '2022-10-22 08:06:24.068653', '6', 'tranngocha', 3, '', 10, 1),
(77, '2022-10-22 08:06:26.097411', '18', 'chuminhnam', 3, '', 10, 1),
(78, '2022-10-22 08:06:28.901173', '20', 'chuminhnam', 3, '', 10, 1),
(79, '2022-10-22 08:06:31.952057', '17', 'chuminhnam', 3, '', 10, 1),
(80, '2022-10-22 08:06:34.010346', '23', 'chuminhnam', 3, '', 10, 1),
(81, '2022-10-22 08:06:36.135395', '22', 'chuminhnam', 3, '', 10, 1),
(82, '2022-10-22 08:06:38.472722', '14', 'chuminhnam', 3, '', 10, 1),
(83, '2022-10-22 08:06:40.811242', '11', 'tranngocha', 3, '', 10, 1),
(84, '2022-10-22 08:06:43.098653', '21', 'chuminhnam', 3, '', 10, 1),
(85, '2022-10-22 08:06:45.181899', '10', 'tranngocha', 3, '', 10, 1),
(86, '2022-10-22 08:06:47.105272', '12', 'tranngocha', 3, '', 10, 1),
(87, '2022-10-22 08:06:48.860932', '13', 'chuminhnam', 3, '', 10, 1),
(88, '2022-10-22 08:06:50.640935', '15', 'chuminhnam', 3, '', 10, 1),
(89, '2022-10-22 08:06:53.388005', '19', 'chuminhnam', 3, '', 10, 1),
(90, '2022-10-22 08:06:55.767904', '24', 'chuminhnam', 3, '', 10, 1),
(91, '2022-10-22 08:06:57.747766', '25', 'chuminhnam', 3, '', 10, 1),
(92, '2022-10-22 08:07:00.524245', '26', 'chuminhnam', 3, '', 10, 1),
(93, '2022-11-02 09:35:52.982378', '1', 'chuminhnam', 1, '[{\"added\": {}}]', 11, 1),
(94, '2023-02-06 12:41:00.703515', '32', 'Nước cam Twister 2', 2, '[{\"changed\": {\"fields\": [\"Description\"]}}]', 8, 1),
(95, '2023-02-06 12:41:04.978721', '32', 'Nước cam Twister', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 8, 1),
(96, '2023-02-06 18:31:33.337563', '2', 'tranngocha', 2, '[{\"changed\": {\"fields\": [\"IsReceived\"]}}]', 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `model` varchar(100) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(8, 'Api', 'food'),
(10, 'Api', 'foodcart'),
(7, 'Api', 'foodcategory'),
(11, 'Api', 'foodorder'),
(9, 'Api', 'person'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'Api', '0001_initial', '2022-09-24 12:16:13.609422'),
(2, 'contenttypes', '0001_initial', '2022-09-24 12:16:13.642730'),
(3, 'auth', '0001_initial', '2022-09-24 12:16:14.137475'),
(4, 'admin', '0001_initial', '2022-09-24 12:16:14.249750'),
(5, 'admin', '0002_logentry_remove_auto_add', '2022-09-24 12:16:14.257729'),
(6, 'admin', '0003_logentry_add_action_flag_choices', '2022-09-24 12:16:14.266705'),
(7, 'contenttypes', '0002_remove_content_type_name', '2022-09-24 12:16:14.328642'),
(8, 'auth', '0002_alter_permission_name_max_length', '2022-09-24 12:16:14.386549'),
(9, 'auth', '0003_alter_user_email_max_length', '2022-09-24 12:16:14.445443'),
(10, 'auth', '0004_alter_user_username_opts', '2022-09-24 12:16:14.453452'),
(11, 'auth', '0005_alter_user_last_login_null', '2022-09-24 12:16:14.500271'),
(12, 'auth', '0006_require_contenttypes_0002', '2022-09-24 12:16:14.507396'),
(13, 'auth', '0007_alter_validators_add_error_messages', '2022-09-24 12:16:14.519636'),
(14, 'auth', '0008_alter_user_username_max_length', '2022-09-24 12:16:14.541400'),
(15, 'auth', '0009_alter_user_last_name_max_length', '2022-09-24 12:16:14.565085'),
(16, 'auth', '0010_alter_group_name_max_length', '2022-09-24 12:16:14.621894'),
(17, 'auth', '0011_update_proxy_permissions', '2022-09-24 12:16:14.636331'),
(18, 'auth', '0012_alter_user_first_name_max_length', '2022-09-24 12:16:14.653697'),
(19, 'sessions', '0001_initial', '2022-09-24 12:16:14.689373'),
(20, 'Api', '0002_person_foodcart', '2022-09-24 12:43:12.962612'),
(21, 'Api', '0003_alter_person_phone', '2022-09-26 00:33:09.651730'),
(22, 'Api', '0004_person_avatar', '2022-09-26 00:40:00.843116'),
(23, 'Api', '0005_foodcart_status', '2022-09-27 03:11:34.081062'),
(24, 'Api', '0006_rename_status_foodcart_isorder', '2022-09-27 05:06:27.160403'),
(25, 'Api', '0003_foodcart_isorder_person_avatar_alter_person_phone', '2022-09-27 05:16:39.202229'),
(26, 'Api', '0004_foodcategory_image', '2022-10-21 08:15:47.737877'),
(27, 'Api', '0005_foodcart_image_foodcart_name_foodcart_price', '2022-10-22 07:57:20.764976'),
(28, 'Api', '0006_foodorder', '2022-11-02 09:18:59.680185'),
(29, 'Api', '0007_alter_foodorder_timeorder', '2022-11-02 09:51:15.675568'),
(30, 'Api', '0008_remove_food_timeupload', '2023-02-04 02:53:45.476687'),
(31, 'Api', '0009_foodcart_number', '2023-02-04 02:53:45.505960'),
(32, 'Api', '0010_foodorder_number', '2023-02-04 02:53:45.534883'),
(33, 'Api', '0011_foodorder_phoneorder', '2023-02-04 02:53:45.562755'),
(34, 'Api', '0012_food_popular', '2023-02-04 02:53:45.584243'),
(35, 'Api', '0013_foodorder_iscancel', '2023-02-04 02:53:45.614165');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8_unicode_ci NOT NULL,
  `session_data` longtext COLLATE utf8_unicode_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('0oy186l7ssf2dqbg9lod8iwf63ga9ccm', '.eJxVjEEOwiAQRe_C2hAKTJm4dO8ZyMwAUjU0Ke3KeHdt0oVu_3vvv1Skba1x63mJU1JnNajT78Ykj9x2kO7UbrOWua3LxHpX9EG7vs4pPy-H-3dQqddvbRHAF8_FCUJgZwgMCtiAlA0im4AJEdjb0RWyeRxKCpiDFy_OMav3B8gCN4A:1pO8hg:UadXIdgqqeOARZHc8GZjspL0XHTIwNa8aWN9K2r9UH4', '2023-02-18 02:55:00.649117'),
('5op4kmaswri1be8ct9ja4u5b2dpi4e0t', '.eJxVjEEOwiAQRe_C2hAKTJm4dO8ZyMwAUjU0Ke3KeHdt0oVu_3vvv1Skba1x63mJU1JnNajT78Ykj9x2kO7UbrOWua3LxHpX9EG7vs4pPy-H-3dQqddvbRHAF8_FCUJgZwgMCtiAlA0im4AJEdjb0RWyeRxKCpiDFy_OMav3B8gCN4A:1oq9qE:rROlBfJ9mPC-vhY1sGQYsHFP1UzI06gXBKkmBjs5Nug', '2022-11-16 09:15:22.937712'),
('t8ped10bl3iz3vbslw738ttslfu8nqjm', '.eJxVjEEOwiAQRe_C2hAKTJm4dO8ZyMwAUjU0Ke3KeHdt0oVu_3vvv1Skba1x63mJU1JnNajT78Ykj9x2kO7UbrOWua3LxHpX9EG7vs4pPy-H-3dQqddvbRHAF8_FCUJgZwgMCtiAlA0im4AJEdjb0RWyeRxKCpiDFy_OMav3B8gCN4A:1ohpng:SX5siHdIDFey9e90fYNpr7yg8BuElRc6xo4SC1WdP5Y', '2022-10-24 10:14:20.245940'),
('t9ogf26ctdrh1i3otemmyfnhe9btsre1', '.eJxVjEEOwiAQRe_C2hAKTJm4dO8ZyMwAUjU0Ke3KeHdt0oVu_3vvv1Skba1x63mJU1JnNajT78Ykj9x2kO7UbrOWua3LxHpX9EG7vs4pPy-H-3dQqddvbRHAF8_FCUJgZwgMCtiAlA0im4AJEdjb0RWyeRxKCpiDFy_OMav3B8gCN4A:1pP0ke:8VIaeiKWnlZMns0UuJ5Pjs7bjMWKW1kVwNcaD1UOvjY', '2023-02-20 12:37:40.221948');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `api_food`
--
ALTER TABLE `api_food`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `Api_food_category_id_caf0182b_fk_Api_foodcategory_id` (`category_id`);

--
-- Indexes for table `api_foodcart`
--
ALTER TABLE `api_foodcart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Api_foodcart_product_id_eedf1396_fk_Api_food_id` (`product_id`),
  ADD KEY `Api_foodcart_user_id_ff5fea96_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `api_foodcategory`
--
ALTER TABLE `api_foodcategory`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`);

--
-- Indexes for table `api_foodorder`
--
ALTER TABLE `api_foodorder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Api_foodorder_product_id_2eebee73_fk_Api_food_id` (`product_id`),
  ADD KEY `Api_foodorder_user_id_246c862a_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `api_person`
--
ALTER TABLE `api_person`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Api_person_user_id_f7a3196a_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `api_food`
--
ALTER TABLE `api_food`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `api_foodcart`
--
ALTER TABLE `api_foodcart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `api_foodcategory`
--
ALTER TABLE `api_foodcategory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `api_foodorder`
--
ALTER TABLE `api_foodorder`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `api_person`
--
ALTER TABLE `api_person`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `api_food`
--
ALTER TABLE `api_food`
  ADD CONSTRAINT `Api_food_category_id_caf0182b_fk_Api_foodcategory_id` FOREIGN KEY (`category_id`) REFERENCES `api_foodcategory` (`id`);

--
-- Constraints for table `api_foodcart`
--
ALTER TABLE `api_foodcart`
  ADD CONSTRAINT `Api_foodcart_product_id_eedf1396_fk_Api_food_id` FOREIGN KEY (`product_id`) REFERENCES `api_food` (`id`),
  ADD CONSTRAINT `Api_foodcart_user_id_ff5fea96_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `api_foodorder`
--
ALTER TABLE `api_foodorder`
  ADD CONSTRAINT `Api_foodorder_product_id_2eebee73_fk_Api_food_id` FOREIGN KEY (`product_id`) REFERENCES `api_food` (`id`),
  ADD CONSTRAINT `Api_foodorder_user_id_246c862a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `api_person`
--
ALTER TABLE `api_person`
  ADD CONSTRAINT `Api_person_user_id_f7a3196a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
