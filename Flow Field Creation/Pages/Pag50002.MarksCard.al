/// <summary>
/// Page Marks Card (ID 50002).
/// </summary>
page 50002 "Marks Card"
{
    ApplicationArea = All;
    Caption = 'Marks Card';
    PageType = Card;
    SourceTable = Marks;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(ID; Rec."Student ID")
                {
                    ToolTip = 'Specifies the value of the ID field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field(Subject; Rec.Subject)
                {
                    ToolTip = 'Specifies the value of the Subject field.', Comment = '%';
                }
                field(Marks; Rec.Marks)
                {
                    ToolTip = 'Specifies the value of the Marks field.', Comment = '%';
                }
                //field(Picture; Rec.Picture)
                //{
                //    ToolTip = 'Specifies the value of the Picture field.', Comment = '%';
                //}
            }
        }
    }
}
