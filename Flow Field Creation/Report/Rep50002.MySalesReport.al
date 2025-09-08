/// <summary>
/// Report MySalesReport (ID 50002).
/// </summary>
report 50002 MySalesReport
{
    ApplicationArea = All;
    Caption = 'MySalesReport';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'layouts/MySalesReport.rdl';
    dataset
    {
        dataitem(SalesHeader; "Sales Header")
        {
            RequestFilterFields = "Document Type", "No.";
            column(companylogo; companyinfo.Picture) { }
            column(DocumentType; "Document Type") { }
            column(No; "No.") { }
            column(SelltoCustomerName; "Sell-to Customer Name") { }
            column(SelltoContact; "Sell-to Contact") { }
            column(LocationCode; "Location Code") { }
            column(Bill_to_Address; "Bill-to Address") { }
            column(Bill_to_City; "Bill-to City") { }
            column(Bill_to_Contact_No_; "Bill-to Contact No.") { }
            column(Nolbl; Nolbl) { }
            column(DocTypelbl; DocTypelbl) { }
            column(loclbl; loclbl) { }
            column(Conlbl; Conlbl) { }
            column(Addlbl; Addlbl) { }
            column(citlbl; citlbl) { }
            column(companyinfo; companyinfo.Name) { }
            column(companyinfo1; companyinfo.Address) { }
            column(companyinfo2; companyinfo.City) { }
            column(companyinfo3; companyinfo."Post Code") { }
            column(companyinfo4; companyinfo."Address 2") { }
            column(companyinfo5; companyinfo."Created DateTime") { }
            dataitem("Sales Line"; "Sales Line")
            {
                DataItemLink = "Document Type" = field("Document Type"), "Document No." = field("No.");
                column(Document_Type; "Document Type") { }
                column(Document_No_; "Document No.") { }
                column(Type; Type) { }
                column(Typelbl; Typelbl) { }
                column(Line_No_; "Line No.") { }
                column(LineNolbl; LineNolbl) { }
                column(Description; Description) { }
                column(Amount; Amount) { }
                column(Descplbl; Descplbl) { }
                column(Amountlbl; Amountlbl) { }
            }
            trigger OnPreDataItem()
            begin
                companyinfo.get();
                companyinfo.CalcFields(Picture);
                
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
    var
        Nolbl: Label 'Document No';
        DocTypelbl: Label 'Document Type';
        Typelbl: Label 'Item Type';
        LineNolbl: Label 'Line No';
        Amountlbl: Label 'Amount';
        Descplbl: Label 'Item Description';
        companyinfo: Record "Company Information";
        loclbl: Label 'Location Code';
        Addlbl: Label 'Address';
        Conlbl: Label 'Contact';
        citlbl: Label 'City';
}