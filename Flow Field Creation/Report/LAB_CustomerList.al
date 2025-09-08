/// <summary>
/// Report LAB_CustomerList (ID 50000).
/// </summary>
report 50001 LAB_CustomerList
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    CaptionML = ENU = 'LAB_CustomerList';
    RDLCLayout = 'layouts/LAB_CustomerList.rdl';
    WordLayout = 'layouts/LAB_CustomerList.docx';
    PreviewMode = Normal;
    WordMergeDataItem = Customer;
    ProcessingOnly = true;
    ExcelLayout = 'layouts/LAB_CustomerList.xlsx';
    dataset
    {
        dataitem(Customer; Customer)
        {
            DataItemTableView = SORTING(Name);
            column(No; "No.")
            {
                IncludeCaption = true;
            }
            column(Name; Name)
            {
                IncludeCaption = true;
            }
            column(Balance; "Balance (LCY)")
            {
                IncludeCaption = true;
            }
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
            area(processing)
            {
                action(LayoutName)
                {

                }
            }
        }
    }
}