/// <summary>
/// Page Changes List (ID 50005).
/// </summary>
page 50005 "Changes List"
{
    ApplicationArea = All;
    Caption = 'Changes List';
    PageType = List;
    SourceTable = Changes;
    UsageCategory = Lists;
    CardPageId = "Changes card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(ID; Rec.ID)
                {
                    ToolTip = 'Specifies the value of the ID field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field("Phone No"; Rec."Phone No")
                {
                    ToolTip = 'Specifies the value of the Phone No field.', Comment = '%';
                }
                field(Gender; Rec.Gender)
                {
                    ToolTip = 'Specifies the value of the Gender field.', Comment = '%';
                }
                field(Count; Rec.Count)
                {

                    ToolTip = 'Specifies the value of the Count field.', Comment = '%';
                }
            }
        }
    }
}