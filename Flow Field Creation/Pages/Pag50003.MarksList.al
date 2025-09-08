/// <summary>
/// Page Marks List (ID 50003).
/// </summary>
page 50003 "Marks List"
{
    ApplicationArea = All;
    //Caption = 'Marks List';
    PageType = List;
    SourceTable = Marks;
    UsageCategory = Lists;
    CardPageId = "Marks Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(ID; Rec."Student ID")
                {
                    ToolTip = 'Specifies the value of the ID field.', Comment = '%';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.', Comment = '%';
                }
                field(Marks; Rec.Marks)
                {
                    ToolTip = 'Specifies the value of the Marks field.', Comment = '%';


                }
                field(Subject; Rec.Subject)
                {
                    ToolTip = 'Specifies the value of the Subject field.', Comment = '%';

                }
                //field(Picture;Rec.Picture)
                //{
                //     ToolTip = 'Specifies the value of the Picture field.', Comment = '%';
                //}
            }
        }
    }
    // trigger OnOpenPage()
    // var
    //     recref: RecordRef;
    //     fieldr: FieldRef;
    //     OK: Boolean;
    // begin
    //     recref.Open(50000);
    //     fieldr := recref.Field(4);
    //     if recref.FindSet() then
    //         repeat
    //             fieldr.CalcField();
    //             Message(Format(fieldr.Value));
    //         until recref.Next() = 0;
    // end;
    // trigger OnOpenPage()
    // var
    //     Tets: record Test;
    // begin
    //     //tets.SetAutoCalcFields("Total Marks");
    //     //tets.SetRange(ID, '401', '405');
    //     // if tets.FindSet() then
    //     //     repeat
    //     //  tets.CalcFields("Total Marks");
    //     tets.CalcSums(Fee);
    //     Message(Format(tets.Fee));
    //     //until tets.Next() = 0;
    // end;
    // trigger OnOpenPage()
    // var
    //     SelectionHandler: Codeunit MySelectstrmenu;
    // begin
    //     if SelectionHandler.GetSelectedOption() <> 5 then
    //         Error('Access Denied. You must select the 5th option before opening this page.');
    // end;
}
