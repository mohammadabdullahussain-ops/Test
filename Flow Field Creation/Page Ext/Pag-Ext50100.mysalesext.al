/* /// <summary>
/// PageExtension mysalesext (ID 50100) extends Record Sales Order.
/// </summary>
pageextension 50100 mysalesext extends "Sales Order"
{
    layout
    {

    }
    actions
    {
        addlast("&Print")
        {

            action(Salesrepott)
            {
                Caption = 'Sales Abbu Report';
                ApplicationArea = All;
                Image = Report;
                Promoted = true;
                PromotedCategory = Report;
                PromotedOnly = true;
                trigger OnAction()
                var
                    SalesHeader: Record "Sales Header";
                begin
                    SalesHeader.SetRange("Document Type", rec."Document Type");
                    SalesHeader.SetRange("No.",rec."No.");
                    Report.Run(report::MySalesReport, true, true, SalesHeader)
                end;
            }
        }

    }
} */