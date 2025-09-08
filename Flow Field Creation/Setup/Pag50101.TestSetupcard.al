/// <summary>
/// Page TestSetupcard (ID 50101).
/// </summary>
page 50201 TestSetupcard
{
    ApplicationArea = All;
    Caption = 'TestSetupcard';
    PageType = Card;
    SourceTable = "Test Setup";
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("ID No"; Rec."ID No")
                {
                    ToolTip = 'Specifies the value of the ID No field.', Comment = '%';
                }
            }
        }
    }
}
