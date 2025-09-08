/// <summary>
/// Page Test Card (ID 50000).
/// </summary>
page 50000 "Test Card"
{
    ApplicationArea = All;
    Caption = 'Test Card';
    Extensible = false;
    PageType = Card;
    SourceTable = "Test";
    //DataCaptionExpression = 'Name';

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
            }
            group("Grades")
            {
                field("Total Marks"; Rec."Total Marks")
                {
                    ToolTip = 'Specifies the value of the Total Marks field.', Comment = '%';
                }
            }
            group("Additional Information")
            {
                field(Gender; Rec.Gender)
                {
                    ToolTip = 'Specifies the value of the Gender field.', Comment = '%';
                    //Enabled = false;
                }
                field("Email"; Rec."Email")
                {
                    ToolTip = 'Specifies the value of the Email field.', Comment = '%';
                }
                field("Phone No"; Rec."Phone No")
                {
                    ToolTip = 'Specifies the value of the Phone No field.', Comment = '%';
                }
                field("Submitted ID Proof"; Rec."Submitted ID Proof")
                {
                    ToolTip = 'Specifies the value of the Submitted ID Proof field.', Comment = '%';
                    QuickEntry = true;
                }
                field("Joining Date"; Rec."Joining Date")
                {
                    ToolTip = 'Specifies the value of the Joining Date field.', Comment = '%';
                }
                field("Joining Time"; Rec."Joining Time")
                {
                    ToolTip = 'Specifies the value of the Joining Time field.', Comment = '%';
                }
                field(Fee; Rec.Fee)
                {
                    ToolTip = 'Specifies the value of the Fee field.', Comment = '%';
                }
                field("Picture"; Rec."Picture1")
                {
                    ToolTip = 'Specifies the value of the Picture field.', Comment = '%';
                }
            }
        }
    }
    // trigger OnNewRecord(BelowxRec: Boolean)
    // begin
    //     if rec.ID = '' then begin
    //         Testsetup.Get();
    //         Testsetup.TestField("ID No");
    //         //Nosrsmng.InitSeries(Testsetup."ID No", xRec."No. Series", 0D, ID, Testsetup."ID No");
    //         rec.ID := Nosrsmng.GetNextNo(Testsetup."ID No", 0D);
    //     end;
    // end;

    // var
    //     Testsetup: Record "Test Setup";
    //     //Nosrsmng: Codeunit NoSeriesManagement;
    //     Nosrsmng: Codeunit "No. Series";
}
