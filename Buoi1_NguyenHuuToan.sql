--1.	Cho biến @NgaySinh kiểu datetime lưu thông tin ngày sinh. Viết script xuất ra màn hình bằng lệnh PRINT thông báo theo dạng “Tuổi là [@tuổi]”.
set dateformat dmy
Declare @Ngaysinh Datetime
set @Ngaysinh = '17/09/2003'
Print N'Tuổi của tui là : ' + cast(datediff(year,@Ngaysinh,getdate()) as char(2))


--2.	Viết khối lệnh hiển thị số đơn đặt hàng mỗi nhân viên đã đặt trong năm 1997, nếu số đơn nhiều ít hơn 3 thì hiện thông báo "số lượng đơn hàng quá ít”.
--Ngược lại hiển thị số lượng đơn hàng đã lập.
use Northwind
go
Declare @Cau2 Table(MaNV int,Sl int, TT nVarchar(50))
Insert Into @Cau2(MaNV,Sl)
Select EmployeeID, COUNT(*)
From orders
Where YEAR(OrderDate)=1997
Group By EmployeeID

Update @Cau2
Set TT = (Case 
			When SL < 30 Then N' Số Lượng Quá ít'
			else N'Số lượng đơn hàng là : '+ CONVERT(char(5),SL)
			end)
Select *
From @Cau2

--Bài tập Stored Procedure
--o	Thủ tục không có tham số
--1)	Viết stored- procedure xuất danh sách các danh mục chưa có sản phẩm nào.
