///Table Marks 50001
table 50001 Marks
{
    Caption = 'Marks';
    DataClassification = CustomerContent;
    LookupPageId = "Marks List";
    DrillDownPageId = "Marks List";

    fields
    {
        field(1; "Student ID"; Code[20])
        {
            TableRelation = "Test".ID;
            Caption = 'Stduent ID';
            /* trigger OnLookup()
            var
                Vartestrec: Record Test;
            begin
                if page.RunModal(page::"Test List", Vartestrec) = Action::LookupOK then
                    rec."Student ID" := Vartestrec.ID;
            end; */
            trigger OnValidate()
            var
            VarTest : Record Test;
            begin
                if VarTest.Get("Student ID") then
                Name:= VarTest.Name;
            end;
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';

        }
        field(3; Subject; Code[20]) { Caption = 'Subject'; }
        field(4; Marks; Integer) { Caption = 'Marks'; }
        field(5; Picture; Blob) { Caption = 'Picture'; DataClassification = CustomerContent; Subtype = Bitmap; }
        field(6; Count; Integer) { Caption = 'Count'; }
    }
    keys { key(PK; "Student ID", Subject) { /*Clustered = true;*/ } key(Test; Count) { } }
    fieldgroups { fieldgroup(Brick; "Student ID", Name, Marks) { } }
}