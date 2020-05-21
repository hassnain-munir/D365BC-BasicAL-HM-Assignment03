pageextension 90761 "EIE Customer List Ext" extends "Customer List"
{
    actions
    {
        addafter("&Customer")
        {
            group(ImportExport)
            {
                Caption = 'XMLPort';
                Visible = true;
                Image = XMLFile;

                action(ExportToXML)
                {
                    Caption = 'Export to XML';
                    ApplicationArea = all;
                    Image = Export;
                    RunObject = xmlport "EIE CustomerXML";
                }
                action(ExportToCSV)
                {
                    Caption = 'Export to CSV';
                    ApplicationArea = all;
                    Image = Export;
                    RunObject = xmlport "EIE CustomerCSV";
                }
            }
        }
    }
}