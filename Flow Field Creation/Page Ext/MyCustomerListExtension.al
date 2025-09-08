/// <summary>
/// PageExtension MyCustomerListExtension (ID 50000) extends Record Customer List.
/// </summary>
pageextension 50000 MyCustomerListExtension extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        // Add changes to page actions here
    }
    var
        myInt: Integer;

    // trigger OnOpenPage()
    // begin
    //     report.Run(Report::LAB_CustomerList);
    // end;
}