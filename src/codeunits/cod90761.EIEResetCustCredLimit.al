codeunit 90761 "EIE Reset Top 10 Cust. Cr."
{
    trigger OnRun()
    begin
        Top10Cust.SETFILTER(Sum_Amount_LCY, '>%1', 0);
        Top10Cust.OPEN;
        WHILE Top10Cust.READ DO BEGIN
            Cust.GET(Top10Cust.No);
            CustTmp := Cust;
            CustTmp.INSERT;
        END;
        Top10Cust.CLOSE;
        IF PAGE.RUNMODAL(PAGE::"Customer List", CustTmp) = ACTION::LookupOK THEN
            ConfirmReset;
    end;

    local procedure ResetCreditLimit()
    begin
        IF CustTmp.FINDSET THEN
            REPEAT
                Cust.GET(CustTmp."No.");
                Cust."Credit Limit (LCY)" := 0;
                Cust.MODIFY;
            UNTIL CustTmp.NEXT = 0;
        MESSAGE(Text002);
    end;

    local procedure ConfirmReset()
    begin
        IF CONFIRM(Text001,
        FALSE,
        Cust.FIELDCAPTION("Credit Limit (LCY)"), 0)
        THEN
            ResetCreditLimit;
    end;

    var
        Top10Cust: Query "EIE CustLedgEntrQuery";
        Cust: Record Customer;
        CustTmp: Record Customer temporary;
        Text001: TextConst ENU = 'Do you want to reset the %1 to %2 for these customers?';
        Text002: TextConst ENU = 'Action completed successfully.';
}