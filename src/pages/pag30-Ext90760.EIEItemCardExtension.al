pageextension 90760 "EIE Item Card Extension" extends "Item Card"
{
    actions
    {
        addbefore(Functions)
        {
            group(ImportExport)
            {
                Caption = 'Images';
                Visible = true;

                action(ImportItemPicture)
                {
                    Caption = 'Import Item Picture';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ApplicationArea = all;

                    trigger OnAction()
                    var
                        ImageManagement: Codeunit "EIE Image Management";
                    begin
                        ImageManagement.ImportItemPicture(Rec);
                    end;
                }
                action(ExportItemPicture)
                {
                    Caption = 'Export Item Picture';
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ApplicationArea = all;

                    trigger OnAction()
                    var
                        ImageManagement: Codeunit "EIE Image Management";
                    begin
                        ImageManagement.ExportItemPicture(Rec);
                    end;
                }
            }
        }
    }
}