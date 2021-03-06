set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
go


-- =============================================
-- Author:		周文超
-- Create date: 2010-06-24
-- Description:	生成订单号
-- =============================================
ALTER FUNCTION [dbo].[fn_TourOrder_CreateOrderNo]
(
)
RETURNS nvarchar(250)
AS
BEGIN
	DECLARE @newOrderNo nvarchar(250)
	DECLARE @OrderCount int
	SET @newOrderNo = CONVERT(nvarchar(8),getdate(),112)
	SELECT @OrderCount = count(*) FROM tbl_TourOrder WHERE datediff(dd,getdate(),IssueTime) = 0
	SET @newOrderNo = @newOrderNo + dbo.fn_PadLeft(CASE WHEN @OrderCount = 0 THEN 1 ELSE @OrderCount END,'0',4)
	
	RETURN @newOrderNo
END

