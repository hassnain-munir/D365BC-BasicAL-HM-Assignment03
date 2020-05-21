query 90760 "EIE CustLedgEntrQuery"
{
    QueryType = Normal;
    OrderBy = descending(Sum_Amount_LCY);
    TopNumberOfRows = 10;
    elements
    {
        dataitem(Customer; Customer)
        {
            dataitem(CustLedgEntry; "Cust. Ledger Entry")
            {
                DataItemLink = "Customer No." = Customer."No.";
                SqlJoinType = InnerJoin;
                DataItemTableFilter = "Document Type" = filter(Invoice | "Credit Memo");
                column(Sum_Amount_LCY; "Amount (LCY)") { Method = Sum; }
            }
            column(No; "No.") { }
            column(Name; Name) { }
            column(CustomerPostingGroup; "Customer Posting Group") { }
        }
    }
}