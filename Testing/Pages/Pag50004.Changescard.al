/// <summary>
/// Page Changes card (ID 50004).
/// </summary>
page 50004 "Changes card"
{
    ApplicationArea = All;
    Caption = 'Changes card';
    PageType = Card;
    SourceTable = Changes;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(ID; Rec.ID)
                {
                    ToolTip = 'Specifies the value of the ID field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field(Gender; Rec.Gender)
                {
                    ToolTip = 'Specifies the value of the Gender field.', Comment = '%';
                }
                field("Phone No"; Rec."Phone No")
                {
                    ToolTip = 'Specifies the value of the Phone No field.', Comment = '%';
                }
                field("Submitted ID Proof"; Rec."Submitted ID Proof")
                {
                    ToolTip = 'Specifies the value of the Submitted ID Proof field.', Comment = '%';
                }
                field(Fee; Rec.Fee)
                {
                    ToolTip = 'Specifies the value of the Fee field.', Comment = '%';
                }
                field("Joining Date"; Rec."Joining Date")
                {
                    ToolTip = 'Specifies the value of the Joining Date field.', Comment = '%';
                }
                field("Joining Time"; Rec."Joining Time")
                {
                    ToolTip = 'Specifies the value of the Joining Time field.', Comment = '%';
                }
                field("Count"; Rec."Count")
                {

                    ToolTip = 'Specifies the value of the Count field.', Comment = '%';
                }
            }
        }
    }
}
