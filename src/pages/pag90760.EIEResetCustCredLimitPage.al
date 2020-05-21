page 90760 "EIE Reset Cust. Cred. Limit."
{
    Caption = 'Reset Top 10 Customers Credit Limit';
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    trigger OnOpenPage()
    var
        ResetCodeUnit: Codeunit "EIE Reset Top 10 Cust. Cr.";
    begin
        ResetCodeUnit.Run();
    end;
}